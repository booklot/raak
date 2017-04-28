$(document).ready(function()
{

	
	$(".guest_reg_lab").click( function()
	{
		if( $(".guest_reg_lab").data('checked') == '1' )
		{
			$(".guest_register").removeClass('hidden');
			$(".guest_reg_lab").data('checked', 0);
			var pass = '<input type="password" id="password" name="register_password" class="form-control input-sm" value="" required>';
			var cpass = '<input type="password" id="confirm_password" name="register_confirm_password" value="" class="form-control input-sm" required>';
			$('.guest_register .password').html(pass);
			$('.guest_register .cpassword').html(cpass);
		}
		else
		{
			$(".guest_register").addClass('hidden');
			$(".guest_reg_lab").data('checked', 1) ;
			$('.guest_register .password').html('');
			$('.guest_register .cpassword').html('');
		}
	});

	$("#guest_register").submit(function(e)
	{
		var postData = $(this).serializeArray();
		var burl = $('#base_url').val();
		$.ajax(
		{
			url : burl+'ajax/guest_register',
			type: "POST",
			data : postData,
			dataType: 'json',
			beforeSend: function()
			{
				$('.guest_reg_btn').html( '<span class="radmin-busy"></span> Please Wait...' );
				$('.guest_reg_btn').attr('disabled',true);
			},
			success:function(data, textStatus, jqXHR)
			{
				if( data['error']==false )
				{
					$('.guest_checkout_error').html(data['message']);
					window.location = $('#current_url').val();
				}
				else
				{
					$('.guest_reg_btn').text( 'Continue' );
					$('.guest_reg_btn').removeAttr('disabled');
					$('.guest_checkout_error').html(data['message']);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
				('.guest_checkout_error').html( '<div class="alert alert-warning">'+errorThrown+': '+textStatus+'</div>' );
				$('.guest_reg_btn').removeAttr('disabled');
				$('.guest_reg_btn').text( 'Continue' );
			}
		});
		e.preventDefault(); //STOP default action
		//e.unbind(); //unbind. to stop multiple form submit.
	});

	$("#ajax_register").submit(function(e)
	{
		var postData = $(this).serializeArray();
		var burl = $('#base_url').val();
		$.ajax(
		{
			url : burl+'ajax/register',
			type: "POST",
			data : postData,
			dataType: 'json',
			beforeSend: function()
			{
				$('.ajax_register_btn').html( '<span class="radmin-busy"></span> Please Wait...' );
				$('.ajax_register_btn').attr('disabled',true);
			},
			success:function(data, textStatus, jqXHR)
			{
				if( data['error']==false )
				{
					$('.ajax_register_error').html(data['error_msg']);
					window.location = $('#current_url').val();
				}
				else
				{
					$('.ajax_register_btn').text( 'Register' );
					$('.ajax_register_btn').removeAttr('disabled');
					$('.ajax_register_error').html(data['error_msg']);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
				$('.ajax_register_error').html( '<div class="alert alert-warning">'+errorThrown+': '+textStatus+'</div>' );
				$('.ajax_register_btn').removeAttr('disabled');
				$('.ajax_register_btn').text( 'Register' );
			}
		});
		e.preventDefault(); //STOP default action
		//e.unbind(); //unbind. to stop multiple form submit.
	});

	$('#quicklogin').on('show.bs.modal', function (e){
		var invoker = $(e.relatedTarget);
		var href = $(invoker).attr('href');
		$('#login_action').val( href );
	});

	$("#quick_register").submit(function(e)
	{
		var postData = $(this).serializeArray();
		var burl = $('#base_url').val();
		$.ajax(
		{
			url : burl+'ajax/quick_register',
			type: "POST",
			data : postData,
			dataType: 'json',
			beforeSend: function()
			{
				$('.quick_reg_btn').html( '<span class="radmin-busy"></span> Please Wait...' );
				$('.quick_reg_btn').attr('disabled',true);
			},
			success:function(data, textStatus, jqXHR)
			{
				if( data['error']==false )
				{
					$('.quick_register_error').html(data['message']);
					//window.location = $('#current_url').val();
					window.location = $('#login_action').val();
				}
				else
				{
					$('.quick_reg_btn').text( 'Create My Account' );
					$('.quick_reg_btn').removeAttr('disabled');
					$('.quick_register_error').html(data['message']);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
				('.quick_register_error').html( '<div class="alert alert-warning">'+errorThrown+': '+textStatus+'</div>' );
				$('.quick_reg_btn').removeAttr('disabled');
				$('.quick_reg_btn').text( 'Create My Account' );
			}
		});
		e.preventDefault(); //STOP default action
		//e.unbind(); //unbind. to stop multiple form submit.
	});

	$("#ajax_login").submit(function(e)
	{
		var postData = $(this).serializeArray();
		var burl = $('#base_url').val();
		$.ajax(
		{
			url : burl+'ajax/login',
			type: "POST",
			data : postData,
			dataType: 'json',
			beforeSend: function()
			{
				$('.login_btn').html( '<span class="radmin-busy"></span> Please Wait...' );
				$('.login_btn').attr('disabled',true);
			},
			success:function(data, textStatus, jqXHR)
			{
				if( data['error']==false )
				{
					$('.quick_login_error').html(data['message']);
					//window.location = $('#current_url').val();
					window.location = $('#login_action').val();
				}
				else
				{
					$('.login_btn').text( 'Login' );
					$('.login_btn').removeAttr('disabled');
					$('.quick_login_error').html(data['message']);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
				('.quick_login_error').html( '<div class="alert alert-warning">'+errorThrown+': '+textStatus+'</div>' );
				$('.login_btn').removeAttr('disabled');
				$('.login_btn').text( 'Login' );
			}
		});
		e.preventDefault(); //STOP default action
		//e.unbind(); //unbind. to stop multiple form submit.
	});

});
