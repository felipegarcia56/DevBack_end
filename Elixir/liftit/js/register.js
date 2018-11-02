function loadSelectors(){
	var params = {};
	var trademarks = getTradeMark(params);
	var bodywork = getBodywork(params);
	var type_v = getTypeV(params);
	var type_u = getTypeU(params)

	$.when(trademarks,bodywork,type_v, type_u).done(function(response_tm, response_bw,response_tv,response_tu){
		console.log(response_tm);
		console.log(response_bw);
		console.log(response_tv);
		console.log(response_tu);

		var select_tm = create_select("trademarks",response_tm[0]["data"],"Elije la marca ...",false);
		var select_bw = create_select("bodywork",response_bw[0]["data"],"Elije la carrocería ...",false);
		var select_tv = create_select("type_ve",response_tv[0]["data"],"Elije el tipo ...",false);
		var select_tu = create_select("type_tu",response_tu[0]["data"],"Elije el tipo de usuario");
		$(".selector_v").append(select_tv);
		$(".selector_tm").append(select_tm);
		$(".selector_bw").append(select_bw);
		$(".selector_tu").append(select_tu);
		
	}).fail(function(response){
		console.log(response)
	});
}

function createVehicle(){
	var type_v = $("#reg_v #type_ve option:selected").val();
	var type_tm = $("#reg_v #trademarks option:selected").val();
	var type_bw = $("#reg_v #bodywork option:selected").val();
	var plate = $("#reg_v input[name='plate']").val();
	var document_ = $("#reg_v input[name='doc_p']").data("us");
	
	var params = {"plate":plate,"type_vehicle":type_v,"type_bodywork":type_bw,'id_user':document_,"trademark":type_tm};
	postVehicle(params).done(function(response){
		toastr.success('Haz creado tu vehiculo!', 'Perfecto');
		$("#reg_v input[name='plate']").val('');
		$("#reg_v input[name='doc_p']").val('');
		$("#reg_v input[name='doc_p']").removeAttr('data-us');
		
		console.log(response);
	}).fail(function(response){
		console.log("fail");
		console.log(response);
	})
}
function createUser(){

	var type_u = $("#reg_u #type_tu option:selected").val();
	var type_d = $("#reg_u #type_d option:selected").val();
	var last_name = $("#reg_u input[name='last_name']").val();
	var name = $("#reg_u input[name='name']").val();
	var document_ = $("#reg_u input[name='document']").val();
	var file = $("#reg_u input[name='file']").val();
	var params = {"last_name":last_name,"full_name":name,"identification":document_,"type_user":type_u};
	console.log(params)
	postUser(params).done(function(response){
		toastr.success('Haz creado tu usuario!', 'Perfecto');
		$("#reg_u input[name='last_name']").val('');
		$("#reg_u input[name='name']").val('');
		$("#reg_u input[name='document']").val('');
		console.log(response);
	}).fail(function(response){
		console.log("fail");
		console.log(response);
	})
}


function valid_user(formid,name,object_,regU){
	var params = {"ident":$(object_).val()};
    	var input_ = object_;
    	getUserInf(params).done(function(response){
    		console.log(response);
    		if((response.length == 0 && regU) || (response.length > 0 && !regU) || response["data"]==null){
    			$(formid+" select").attr("disabled","disabled");
    			$(formid+" input[name!='"+name+"']").attr("disabled","disabled");
    			$(formid+" button").attr("disabled","disabled");
				
				toastr.info('El número de documento no existe!', 'Upps!');
    		}
    		else{
    			$(formid+" select").removeAttr('disabled');
    			$(formid+" input[name!='"+name+"']").removeAttr('disabled');	
    			$(formid+" button").removeAttr("disabled");
    			if(regU){
    				$(input_).attr("data-us",response['data']['id']);
					toastr.info('Nuevo vehiculo '+response['data']['full_name']+'?', 'Huyyy!');
    			}				
    		}
    	}).fail(function(response){
    		console.log("fail");
    		console.log(response);
    	});
}

function grlInfo(){

	var params = {"name":$("#lookFor_user input[name='look_forN']").val(), "identification":$("#lookFor_user input[name='look_forD']").val(),"plate":$("#lookFor_user input[name='look_forP']").val()};
    	getGrlInfo(params).done(function(response){
			console.log(response);
			var headers_t =[{"description":"tipo vehículo"},{"description":"tipo carrocería"},{"description":"marca"},{"description":"placa"},{"description":"Apellidos"},{"description":"Nombre"}];
			var table_t =create_table("table_info",headers_t,[response],true);
			$("#table_uv").children().remove();
			$("#table_uv").append(table_t);
    		$("#modal_info").modal("show");
			
    	}).fail(function(response){
    		toastr.info('No existe información','Consulta');
    		console.log(response);
    	});
}


function register_view(){
	$("#body_content").load("views/register.html",function(){
		loadSelectors();
		
	    $("#reg_v input[name='doc_p']").change(function(e){
	    	valid_user("#reg_v","doc_p",this,true);
	    });
	    $("#lookFor_user input").off("focusin");
	    $("#lookFor_user input").focusin(function(e){
	    	var edited = this;
	    	$.each($("#lookFor_user input"), function(index, val) {
	    		 if(this != edited){
	    		 	$(this).attr("disabled","disabled");
	    		 	$(this).val("");
	    		 }
	    	});
	    });
		$("#lookFor_user input").off("focusout");
	    $("#lookFor_user input").focusout(function(e){
	    	var edited = this;
	    	$.each($("#lookFor_user input"), function(index, val) {
	    		 if(this != edited && $(edited).val()==""){
	    		 	$(this).removeAttr("disabled");
	    		 }
	    	});
	    });

	    $("form").submit(function(e){
	    	switch ($(this).attr('id')){
	    		case 'reg_v':
					createVehicle();
	    			break;
	    		case 'reg_u':
					createUser();
	    			break;
	    		case 'lookFor_user':
					grlInfo();
	    			break;
	    		default:
	    			break;
	    	}
	    	e.preventDefault();
	    });
	});
};
