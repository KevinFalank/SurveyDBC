/*
 * SimpleModal Basic Modal Dialog
 * http://simplemodal.com
 *
 * Copyright (c) 2013 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 */
var survey_form_data = ""
var survey_data_submitted = false;

jQuery(function ($) {
	// Load dialog on page load
	//$('#basic-modal-content').modal();

	// Load dialog on click
	$('#header_nav .basic').click(function (e) {
		$('#basic-modal-content').modal();

		return false;
	});

	$('.validate_login').click(function (e) {
		var user_id = $('#logon_user_id').val();
		survey_form_data = $('#display_survey').serialize();
		survey_data_submitted = true;
		if (user_id === "") {
			e.preventDefault();
			$('#basic-modal-content').modal();
		} else {
			return true;
		}
	});

	$('#sign-in').submit(function (e){
		e.preventDefault();
	  var data = $(this).serialize();
		$.post( "/sessions", data, function() {
		  if (survey_data_submitted === true) {
		  	$.post("/surveys", survey_form_data, function() {
		  		// alert ("survey submitted");
		  		survey_form_data = ""
		  		survey_data_submitted = false;
		  		window.location.href = '/'

		  	});
		  } else {
		  	window.location.href = '/'
		  }
		});

	});
});



