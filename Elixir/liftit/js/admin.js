function loadTables(){
	var param = {"all":"True"};
	var trademarks = getTradeMark(param);
	var bodywork = getBodywork(param);
	var type_vehicle = getTypeV(param);

	$.when(trademarks,bodywork,type_vehicle).done(function(response_tm,response_bw,response_tv){
		var headers_tm =[{"description":"Marca"}];
		var headers_bw =[{"description":"Carrocería"}];
		var headers_tv =[{"description":"Tipo"}];
		var table_tm =create_table("table_tm",headers_tm,response_tm[0]["data"]);
		var table_bw =create_table("table_bw",headers_bw,response_bw[0]["data"]);
		var table_tv =create_table("table_tv",headers_tv,response_tv[0]["data"]);
		$("#trademark_table").children().remove();
		$("#bodyword_table").children().remove();
		$("#type_vehicle").children().remove();
		$("#trademark_table").append(table_tm);
		$("#bodyword_table").append(table_bw);
		$("#type_vehicle").append(table_tv);

	}).fail(function(response){
		console.log(response);
	});
	
}

function admin_view(){
	$("#body_content").load("views/admin.html",function(){
		loadTables();
		$(".show_m").off("click");
		$(".show_m").click(function(e){
			$('#save_data').removeAttr("data-act");
			switch ($(this).data('type')){
				case 'trademark':
					$('#modalTitle').text('Crear una marca');
					$('#save_data').attr("data-act","trademark");
					break;
				case 'bodywork':
					$('#modalTitle').text('Crear una carrocería');
					$('#save_data').attr("data-act","bodywork");
					break;
				case 'type_v':
					$('#modalTitle').text('Crear un tipo de vehiculo');
					$('#save_data').attr("data-act","type_v");
					break;
			}
		});
		$("#modal_form").off("submit");
		$("#modal_form").submit(function(e){
			var params = {"description":$("#description").val()};
			switch($("#save_data").attr('data-act')){
				case 'trademark':
					postTrademark(params).done(function(response){
						console.log(response);
						$("#description").val('');
						$("#modal_admin").modal("hide");
						loadTables()
					}).fail(function(response){
						console.log(response);
					});
					break;
				case 'bodywork':
					postBodywork(params).done(function(response){
						console.log(response);
						$("#description").val('');
						$("#modal_admin").modal("hide");
						loadTables()
					}).fail(function(response){
						console.log(response);
					});
					break;
				case 'type_v':
					postTypeV(params).done(function(response){
						console.log(response);
						$("#description").val('');
						$("#modal_admin").modal("hide");
						loadTables()
					}).fail(function(response){
						console.log(response);
					});				
					break;
			}
			e.preventDefault();
		})
	});



}