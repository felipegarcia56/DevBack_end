

$(function() {
	new WOW().init();
	register_view();
	$(".item").click(function(){
		$("#body_content").children().remove();
        $("#navBar .active").removeClass('active');
        $(this).parent().addClass('active');
        switch ($(this).attr("id")){
            case 'reg':
				register_view();
            	break;
            case 'admin':
                admin_view();
                break;
            case 'report':
                report_view();
                break;
            default:
                alert($(this).attr('id'));
        }    
    });

});
