$(document).ready(function(){
	optionChecker();
	$("input[name=opsiUrl]", "#opsiGenUrl").change(function(){
		optionChecker();
	});
	function optionChecker(){
		opsiUrl = $("input[name=opsiUrl]:checked", "#opsiGenUrl").val();
		if(opsiUrl == "default"){
			$("#form_create").show();
			$("#form_create_custom").hide();
		} else {
			$("#form_create").hide();
			$("#form_create_custom").show();
		}
	}
});