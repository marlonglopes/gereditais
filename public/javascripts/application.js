///////////// pooling

//$(function () {  
//  if ($('#microposts').length > 0) {  
//    setTimeout(updateComments, 10000);  
//  }  
//});  
//  
//function updateComments() {  
//	var edital_id=$('#microposts').attr("data-edital_id");
//	var url='/editals/' + edital_id + "microposts.js";
//	$.getScript(url);  
//	setTimeout(updateComments, 10000);  
//}

/////////////////
//$('#sub1').click(function() {
// 	$('#new_download').submit();
//  	return false;
//});



//$(".textbox-auto-clear").each(function(){
//    var origValue = $(this).val(); // Store the original value
//    $(this).focus(function(){
//        if($(this).val() == origValue) {
//            $(this).val('');
//        }
//    });
//    $(this).blur(function(){
//        if($(this).val() == '') {
//            $(this).val(origValue);
//        }
//    });
//});




if ( $.browser.msie ) {

	$("#search_find_by_licitacao").placeHolder({
			 "text"           : "Formato NNN/YYYY",
			 "active"         : "#000",
			 "placeholder"    : "#333"
	});

	$("#search_descricao_or_aviso_contains").placeHolder({
			 "text"           : "Executa pesquisa nos campos descrição e aviso",
			 "active"         : "#000",
			 "placeholder"    : "#333"
	});

	$("#search_data_publicacao_gte").placeHolder({
			 "text"           : "de",
			 "active"         : "#000",
			 "placeholder"    : "#333"
	});

	$("#search_data_publicacao_lte").placeHolder({
			 "text"           : "até",
			 "active"         : "#000",
			 "placeholder"    : "#333"
	});

	$("#search_data_abertura_gte").placeHolder({
			 "text"           : "de",
			 "active"         : "#000",
			 "placeholder"    : "#333"
	});

	$("#search_data_abertura_lte").placeHolder({
			 "text"           : "até",
			 "active"         : "#000",
			 "placeholder"    : "#333"
	});


}




$('#post-area').keyup(function(event) {

		tot=2000;
		len = this.value.length;
		$('#post-counter').attr("value",(tot-len));
		
		if (len==0){
			$("#micropost_submit").attr("disabled",true);
			return false;
		}

		if (len>2000){
			this.value=old;
			$("#micropost_submit").attr("disabled",true);
			return false;
		}

		old=this.value
		$("#micropost_submit").attr("disabled",false);
	   return false;

});



$('#user_cep').blur(function(event) {

	var root=$('#endereco_empresa').attr("data-root");

	var cep_format= /\d{8}/

	if (this.value!="") {
		$('#wait_cep').show();
  		$.getScript(root + "ceps/" + this.value);  
  		return false;
	} else {
		$('#user_logradouro').val("");
		$('#user_bairro').val("");
		$('#user_cidade').val("");
		$('#user_uf').val("");
		$('#wait_cep').hide();
	}

});



//$('#user_cep').blur(function(event) {

//	var root=$('#endereco_empresa').attr("data-root");

//	var cep_format= /\d{8}/

//	if (this.value.search(cep_format)!=-1) {
//		$('#wait_cep').show();
//  		$.getScript(root + "ceps/" + this.value);  
//  		return false;
//	} else {
//		$('#user_logradouro').val("");
//		$('#user_bairro').val("");
//		$('#user_cidade').val("");
//		$('#user_uf').val("");
//		$('#wait_cep').hide();
//	}

//});


$('.user_username').keydown(function(event) {
  if (event.keyCode == '32') {
		str = this.value.replace(/ /g,'');
		$('#user_username').val(str);
	   return false;
  }
});

//$('.container a').live(function() {
//  history.pushState({ path: this.path }, '', this.href)
//  $.get(this.href, function(data) {
//    $('.container').slideTo(data)      
//  })
//  return false  
//});

//$(window).bind('popstate', function() {
//  $('.container').slideTo(location.pathname)
//});


$(".btn-slide").click(function(){
	$("#panel").slideToggle("slow");
	$(this).toggleClass("active"); 
	return false;
});
	
//$('#search').hide();

$('.trigger').click(function() {
  $('#search').slideToggle();
});

$(function() {

//	$("#edital_data_abertura").datepicker($.datepicker.regional['pt-BR']);
//	$("#edital_data_publicacao").datepicker($.datepicker.regional['pt-BR']);
//	$("#search_data_publicacao_eq").datepicker($.datepicker.regional['pt-BR']);
//	$("#search_data_abertura_eq").datepicker($.datepicker.regional['pt-BR']);
//	$("#micropost_data").datepicker($.datepicker.regional['pt-BR']);
	$(".data").datepicker($.datepicker.regional['pt-BR']);
//	$(".data").datepicker(
//		{changeMonth: true,changeYear: true}
//	);

	$('.hora').timepicker({
		 timeSeparator: ':'
	})

});

$('.reset_search').click(function() {
//	$("#search_modalidade_id_equals").val('')
//	$("#search_descricao_or_aviso_contains").val('');
//	$("#search_data_publicacao_eq").val('');
//	$("#search_data_abertura_eq").val('');
//	$("#search_numero_licitacao_or_ano_licitacao_eq").val('');
	$(".clearme").val('');
	return false;
});

$(function () {  
  $('#microposts .pagination a').live('click',function () {  
      $.getScript(this.href);  
      return false;  
    }  
  );  
}); 

$(function () {  
  $('#editais .pagination a').live('click',function () {  
      $.getScript(this.href);  
      return false;  
    }  
  );  
}); 

//$('#editais .pagination a').live(function() {
//  history.pushState({ path: this.path }, document.title, this.href)
//  $.get(this.href, function(data) {
//    $('#editais').slideTo(data)
//  })
//  return false  
//});

//$(window).bind('popstate', function() {
//  $('#editais').slideTo(location.pathname)
//});


$(function () {  
  $('#user_downloads .pagination a').live('click',function () {  
      $.getScript(this.href);  
      return false;  
    }  
  );  
}); 

$('.hoverme').live('mouseover mouseout', function(event) {
  if (event.type == 'mouseover') {
    alert('over');
  } else {
    alert('out');
  }
});

//$.fn.clearForm = function() {
//  return this.each(function() {
//    var type = this.type, tag = this.tagName.toLowerCase();
//    if (tag == 'form')
//      return $(':input',this).clearForm();
//    if (type == 'text' || type == 'password' || tag == 'textarea')
//      this.value = '';
//    else if (type == 'checkbox' || type == 'radio')
//      this.checked = false;
//    else if (tag == 'select')
//      this.selectedIndex = -1;
//  });
//};

//$(document).ready(function() { 

//	$('.reset_search').click(function() {

//		$("#search_modalidade_id_equals").val('')
//		$("#search_descricao_or_aviso_contains").val('');
//		$("#search_data_publicacao_eq").val('');
//		$("#search_data_abertura_eq").val('');		
//		
////		$("#search_data_publicacao_eq").attr("value",'bla');
////		var valor1=$("#search_data_publicacao_eq").attr("value");
////		var valor2=$("#search_data_publicacao_eq").val();
////		alert(valor1 + ' ' + valor2);
//		return false;
//	});

//}); 


//$('.reset_search').click(function() {
//	$("#search_data_publicacao_eq").reset();
//	var valor=$("#search_data_publicacao_eq").attr("value");
//	alert(valor);
//});


//$(document).ready(function() { 
////	var valor=$("#search_data_publicacao_eq").attr("value",'teste');
////	var valor=$("#search_data_publicacao_eq").attr("value");
////	alert(valor);
//}); 


//$(document).ready(function() { 
//	$('#edital_search').clearForm();
//}); 

//$('.reset_search').click(function() {
//	$('.reset_search').clearForm();
//});


//$.fn.clearForm = function() {
//  return this.each(function() {
//    if (this.tagName.toLowerCase() == "form") {
//      return $(":input",this).clearForm();
//    }
//    switch (this.type) {
//      case "password":
//      case "textarea":
//      case "text":
//        this.value = "";
//        break;
//      case "select-multiple":
//      case "select-one":
//        this.selectedIndex = -1;
//        break;
//      case "radio":
//      case "checkbox":
//        this.checked = false;
//        break;
//    }
//  });
//};


//$(document).ready(function() { 

//	var values = {};
//	$.each($('#edital_search').serializeArray(), function(i, field) {
//	 values[field.name] = field.value + field.value;
////	 field.val("");
//	 alert(field.value + ' ' + field.type ) ;
//	});

//	
//}); 


//$(document).ready(function() { 
//	$("#reset_search").clearform({form: '#edital_search'});
//}); 


//$('.reset_search','#edital_search')
// .not(':button, :submit, :reset, :hidden')
// .val('')
// .removeAttr('checked')
// .removeAttr('selected');


//$('.reset_search').click(function() {
//  $('#edital_search')[0].reset();
//  $('#search_data_publicacao_gteq').val("");
//  $('#search_data_publicacao_lteq').val("");
//	$("#search_data_publicacao_lteq").attr("value", "ddd");
//	document.getElementById('search_data_publicacao_lteq').value = 'Blahblah';
//});


//$('#myForm').submit(function() {
//    // get all the inputs into an array.
//    var $inputs = $('#myForm :input');

//    // not sure if you wanted this, but I thought I'd add it.
//    // get an associative array of just the values.
//    var values = {};
//    $inputs.each(function() {
//        values[this.name] = $(this).val();
//    });

//});

//$('.reset_search').click(function() {
//	document.getElementById('#edital_search').reset()
//});


//$(document).ready(function() { 
////   // bind 'myForm' and provide a simple callback function 
////   $('#edital_search').ajaxForm(function() { 
//////       alert("Thank you for your comment!"); 
////   }); 
//}); 


//$('.reset_search').click(function() {
//	var values = {};
//	$.each($('#edital_search').serializeArray(), function(i, field) {
//	 alert(field.value) ;
//	});
//});


//$('.reset_search').click(function() {
//	var values = {};
//	$.each($('#edital_search').serializeArray(), function(i, field) {
////	 values[field.name] = field.value + field.value;
//	 field.val("");
//	 alert(field.value) ;
//	});
//});


//$(document).ready(function () {
//  $('.clearme').focus(function() {
//    $(this).val("");
//  });
//});

