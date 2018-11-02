function updateV(id_){
	var plate= $("#updateV input[name='new_plate']").val();
	var type_v= $("#updateV #utype_ve option:selected").val();
	var type_bw=$("#updateV #ubodywork option:selected").val();
	var type_tm=$("#updateV #utrademarks option:selected").val();
	var user=$("#updateV #utype_us option:selected").val();
	console.log(type_tm)
	var params = {"id":""+id_,"plate":plate,"type_vehicle":type_v,"type_bw":type_bw,"type_tm":type_tm,"user":user};
	console.log(params);
			
	putVehicle(params).done(function(response){
		console.log(response);
		$('#trademark_record').children().remove();
		$("form:first").submit();
		$("#modal_vehicle").modal("hide");

	}).fail(function(response){
		console.log(response);
	});
}

function fillModal(tr_){
	var params = {'all':'True'};
	var trademarks = getTradeMark(params);
	var bodywork = getBodywork(params);
	var type_v = getTypeV(params);
	var user = getUser(params);
	var vehicle = $(tr_).find("td:first").data("id");
	$.when(trademarks,bodywork,type_v,user).done(function(response_tm, response_bw,response_tv,response_us){
		var resp_us = [];
		$.each(response_us[0],function(index, el) {
			resp_us.push({"id":el['id'],"description":el['last_name']+' '+el['full_name']});
		});

		var select_tm = create_select("utrademarks",response_tm[0],"Elije la marca ...",false);
		var select_bw = create_select("ubodywork",response_bw[0],"Elije la carrocería ...",false);
		var select_tv = create_select("utype_ve",response_tv[0],"Elije el tipo ...",false);
		var select_us = create_select("utype_us",resp_us,"Elija el usuario ...",false);
		
		$("#select_newv").append(select_tv);
		$("#select_newtm").append(select_tm);
		$("#select_newbw").append(select_bw);
		$("#select_newus").append(select_us);
		var c_plate=$(tr_).find(".plate").text();
		$("#updateV input[name='new_plate']").val(c_plate);

		$("#updateV").submit( function(e){
			updateV(vehicle);
			e.preventDefault();
		});
	}).fail(function(response){
		console.log(response)
	});
	
}

function report_view(){
	$("#body_content").load("views/reports.html",function(){		
		$(".export").off('click');
		$(".export").click(function(e){
			$("#table_csv").table2csv();
		});

		$("#lookFor_trademark").submit(function(e){
			var params = {"all":"False", "filter": $("#trademarks option:selected").val(),"column":"type_tm"};
			console.log(params);
			getVehicle(params).done(function(response){
				console.log(response);
				var headers_tm =[{"description":"Placa"},{"description":"Tipo de vehículo"},{"description":"Carrocería"},{"description":"Marca"},{"description":"Usuario"}];
				var table_tm =create_table("table_tmi",headers_tm,response,true);
				$("#trademark_record").children().remove();
				$("#trademark_record").append(table_tm);
				$("#trademark_record tr").click(function(e){
					$("#select_newv").children().remove();
					$("#select_newtm").children().remove();
					$("#select_newbw").children().remove();
					$("#select_newus").children().remove();
					
					fillModal($(this));
					$("#modal_vehicle").modal("show");
				})
				
			}).fail(function(response){
				console.log(response);
			})
			e.preventDefault();
		})
		
		var tmInf = getTmInfo();
		var trademarks = getTradeMark({'all':'True'});

		var params ={"all":"True"}
		var vehi_rp =getVehicle(params);
		$.when(tmInf,trademarks, vehi_rp).done(function(response_tmi, response_tm,response_rp){
			var headers_t =[{"description":"Marca"},{"description":"Vehiculos"}];
			var select_tm = create_select("trademarks",response_tm[0],"Elije la marca ...",false);
			$(".selector_tm").append(select_tm);
			$("#trademarks").off('change');
			$("#trademarks").change(function(){
				$("form:first").submit();
			});

			var vehicle_arr =[];
			var cont = 1; 
			$.each(response_rp[0],function(index, el) {
				vehicle_arr.push({"num":cont,"plate":el['plate'],"trademark":el['trademark'],"type_vehicle":el['type_vehicle']});
				cont=cont+1;
			});
			
			var headers_csv =[{"description":"#"},{"description":"Placa"},{"description":"Marca"},{"description":"tipo"}];
			var table_t =create_table("table_csv",headers_csv,vehicle_arr,true);
			$("#table_export").children().remove();
			$("#table_export").append(table_t);	

			var table_t =create_table("table_tmi",headers_t,response_tmi[0],true);
			$("#table_trademark").children().remove();
			$("#table_trademark").append(table_t);	
		}).fail(function(response){
			console.log(response)
		});

		
	});
}