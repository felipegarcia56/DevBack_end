function create_select(id_, object, message, disabled=false){
	var disabled = (disabled)?"disabled":"";
    var select ="<select id='"+id_+"'' class='browser-default custom-select' "+disabled+">";
    select = select + "<option value='' disabled>"+message+"</option><option value='' selected>--</option>";
    $.each(object,function(index, el) {
        select = select + "<option value='"+el['id']+"'>"+el['description']+"</option>";
    });
    select = select+"</select>";
    return select;
}

function create_table(id_,headers,object,multiD=false){
	console.log(object);
	var table = "<table id='"+id_+"' class='table table-striped'><thead><tr>";
  	$.each(headers,function(index, el) {
  		table = table +"<th scope='col'>"+el["description"]+"</th>";
  	});
    table = table+"</tr></thead><tbody>";
    if(!multiD){	
	  	$.each(object,function(index, el) {
	  		table = table +"<tr>";	
			table = table +"<td id='"+el['id']+"'>"+el['description']+"</td>";
	  		table = table +"</tr>";
	  	});
    }
    else{
    	var data = 0;
    	$.each(object,function(index, el) {
		  	table = table +"<tr>";	
	  		$.each(el,function(key, val) {	
				if(key!='id'){
					table = table +"<td class='"+key+" cell_content' data-id = '"+data+"'>"+val+"</td>";
				}
				else{
					data = val;
				}
				
	  		});
	  		table = table +"</tr>";
	  	});
    }

  	table = table+"</tbody></table>";
  	return table;
}
