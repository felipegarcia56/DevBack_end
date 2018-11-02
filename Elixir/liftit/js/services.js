var host = "http://localhost:4000/api";
//var host = "https://siftit.herokuapp.com";

function getTradeMark(params){
	return $.ajax({	 
		url: host+'/trademark/',
		type: 'GET',
		dataType: 'json',
		crossDomain :true,
		data: params, 
		})	
}

function getBodywork(params){
	return $.ajax({
		url: host+'/typeTb/',
		type: 'GET',
		dataType: 'json',
		data: params,
	})		
}

function getTypeV(params){
	return $.ajax({
		url: host+'/typeV/',
		type: 'GET',
		dataType: 'json',
		data: params,
	})	
}

function getTypeU(params){
	return $.ajax({
		url: host+'/typeU/',
		type: 'GET',
		dataType: 'json',
		data: params,
	})	
}

function getUser(params){
	return $.ajax({
		url: host+'/users/',
		type: 'GET',
		dataType: 'json',
		data: params,
	})	
}

function getUserInf(params){
	return $.ajax({
		url: host+'/grlUser/',
		type: 'GET',
		dataType: 'json',
		data: params,
	})	
}

function getVehicle(params){
	return $.ajax({
		url: host+'/vehicle/',
		type: 'GET',
		dataType: 'json',
		data: params,
	})	
}
function getGrlInfo(params){
	return $.ajax({
		url: host+'/grlInfo',
		type: 'GET',
		dataType: 'json',
		data: params,
	})	
}

function getTmInfo(){
	return $.ajax({
		url: host+'/reportsTm/',
		type: 'GET',
		dataType: 'json',
		params:{}
	})	
}

function postUser(params){
	/*return $.ajax({
		url: host+'/createU/',
		type: 'POST',
		dataType: 'json',
		data: {'data':JSON.stringify(params)},
	})*/
	return $.post(host+'/createU/',params)	
}

function postVehicle(params){
	/*return $.ajax({
		url: host+'/vehicle/',
		type: 'POST',
		dataType: 'json',
		data: {'data':JSON.stringify(params)},
	})*/
	return $.post(host+'/createV/',params)	

}
function postTrademark(params){
	/*return $.ajax({
		url: host+'/typeT/',
		type: 'POST',
		dataType: 'json',
		data: {'data':JSON.stringify(params)},
	})*/
	return $.post(host+'/createT',params)	
}

function postBodywork(params){
	/*return $.ajax({
		url: host+'/typeB/',
		type: 'POST',
		dataType: 'json',
		data: {'data':JSON.stringify(params)},
	})*/	
	return $.post(host+'/createTb',params)	

}

function postTypeV(params){
	/*
	return $.ajax({
		url: host+'/typeV/',
		type: 'POST',
		dataType: 'json',
		data: {'data':JSON.stringify(params)},
	})*/
	return $.post(host+'/createTv',params)		
}

function putVehicle(params){
	return $.ajax({
		url: host+'/updateV/',
		method: 'PUT',
		dataType: 'json',
		data: {'data':JSON.stringify(params)},
	})	
}


