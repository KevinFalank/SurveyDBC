/*
 * SimpleModal Basic Modal Dialog
 * http://simplemodal.com
 *
 * Copyright (c) 2013 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 */

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
		if (user_id === "") {
			e.preventDefault();
			$('#basic-modal-content').modal();
		} else {
			return true;
		}
	});

	$('#sign-in').submit(function(){
	  var data = $(this).serialize();
	  alert(data)
	  return false;
	  
	});


});