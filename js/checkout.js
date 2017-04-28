String.prototype.countWords = function(){ return this.trim().split(/\s+/).length;}
String.prototype.words = function(){ return this.trim().split(/\s+/);}

$(document).ready(function(){
	
	
	$('#register_form').validator({
		custom: {
			'full_name': function($el)
			{
				name = $el.val();
				l = name.countWords();
				if( l > 1 )
				{
					//console.log(name.words());
					words = name.words();
					last = words.pop();
					if(last.length < 2) return "Surely your last name can't just be \""+last+'"';
				}
				else return "Please also include your last name / surname";
			}
		}
	});
	

	$('#register_ccode').change(function(){
		var url = $(this).data('url'),
			code = $(this).val(),
			phone = $('#register_phone_number').val();
		
		$('#ccode_span').text('+'+code);
		new_url = url+'/'+code;
		
		$('#phone_div .input-group input').remove();
		
		input = '<input type="tel" class="form-control input-lg" name="register_phone_number" placeholder="Phone Number" 								value="'+phone+'" id="register_phone_number" data-remote="'+new_url+'" min-length="5" required>';
		
		$('#phone_div .input-group').append(input);
		
		$('#register_form').validator('update');
	});

	$('#register_ccode2').change(function(){
		var url = $(this).data('url'),
			code = $(this).val(),
			phone = $('#alt_phone_number').val();
		
		$('#ccode_span2').text('+'+code);
		new_url = url+'/'+code;
		
		$('#phone_div2 .input-group input').remove();
		
		input = '<input type="tel" class="form-control input-lg" name="alt_phone_number" placeholder="Phone Number" 								value="'+phone+'" id="alt_phone_number" data-remote="'+new_url+'" min-length="4">';
		
		$('#phone_div2 .input-group').append(input);
		
		$('#register_form').validator('update');
	});

	$('#register_next').click(function(){
		
		$('#register_form').validator('validate');
		
		
		
		li = $('.help-block.track li').html();
		//console.log(li);
		if(li)
		{
			alert( 'Please fix the errors above before continuing' );
		}
		else
		{
			$('#register_next_tab').tab('show');
		}
	});


	register_phone_group();


	$(".set_delivery_address").click( function()
	{
		var checked = $(".set_delivery_address").data('checked');
		if( checked == 1 )
		{
			stash = $( ".delivery_address_stash" ).html();
			
			if(stash.length>10)
			{
				$( ".delivery_address" ).html( stash );
				register_phone_group();
				$('#register_form').validator('update');
			}
			else
			{
				var url = $('#base_url').val()+'ajax/template',
					file = 'checkout/new/da',
					m = 'site/location',
					f = 'get_countries',
					n = 'countries';
				var data = {file:file,m:m,f:f,n:n};

				$.get( url, data, function( response )
				{
					$( ".delivery_address" ).html( response );
					register_phone_group();
					$('#register_form').validator('update');
				});
			}
			
			$(".set_delivery_address").data('checked', "0");
		}
		else
		{
			$(".set_delivery_address").data('checked', "1") ;
			stash = $( ".delivery_address" ).html();
			$( ".delivery_address_stash" ).html(stash);
			$( ".delivery_address" ).html('');
			$('#register_form').validator('update');
			//console.log( "it is checked: "+checked );
		}
	});


	$(".create_account").click( function()
	{
		if( $(".create_account").data('checked') == '0' )
		{
			
			stash = $( ".password_stash" ).html();
			
			if(stash.length>10)
			{
				$( ".passwords" ).html( stash );
				$('#register_form').validator('update');
				$(".create_account").data('checked', 1);
			}
			else console.log('stash empty!');
		}
		else
		{
			$(".create_account").data('checked', "0") ;
			stash = $( ".passwords" ).html();
			$( ".password_stash" ).html(stash);
			$( ".passwords" ).html('');
			$('#register_form').validator('update');
		}
	});


	 //$('.input-phone').intlInputPhone();

/*
	$("#register_phone_number").intlTelInput({
      // allowDropdown: false,
      // autoHideDialCode: false,
      // autoPlaceholder: "off",
      // dropdownContainer: "body",
      // excludeCountries: ["us"],
       formatOnDisplay: true,
      // geoIpLookup: function(callback) {
      //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
      //     var countryCode = (resp && resp.country) ? resp.country : "";
      //     callback(countryCode);
      //   });
      // },
       initialCountry: "zw",
       nationalMode: true,
      // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
      // placeholderNumberType: "MOBILE",
       preferredCountries: ['zw', 'za'],
       separateDialCode: true,
      utilsScript: $('#base_url').val()
    });
*/
});



function register_phone_group()
{
	$('.phone_group').each(function()
	{
		var id = $(this).attr('id');
		var parent = $(this).data('parent');
		var url = $('#'+id).data('url');
		//console.log('We are dealing with '+id);
		
		$( '#'+id+' ul li a' ).click(function(e){
			e.preventDefault();
			iso_code = $(this).data('iso_code');
			ccode = $(this).data('ccode');
			
			$('#'+id+' button span.btn-cc').text('+'+ccode);
			$('#'+id+' button span:first-child').removeClass();
			$('#'+id+' button span:first-child').addClass( 'flag btn-flag '+iso_code);
			$('#'+id+' input.ccode').val(ccode);
			$('#'+id+' input.iso_code').val(iso_code);
			
			
			var name = $('#'+id+' input.phone-field').attr('name'),
				phone = $('#'+id+' input.phone-field').val(),
				required = $('#'+id+' input.phone-field').prop('required');
			
			
			var cls = 'class="form-control phone-field"';
			if(url)
			{
				new_url = url+'/'+ccode;
				remote = 'data-remote="'+new_url+'"';
			}else remote = '';
			
			if(required) req = 'required'; else req = '';
			
			ph = 'placeholder="Phone Number"';
			
			console.log(remote);
			
			input = '<input type="tel" '+cls+' name="'+name+'" '+ph+' value="'+phone+'" '+remote+' min-length="5" '+req+'>';
			$('#'+id+' input.phone-field').replaceWith(input);
		
			//$('#'+id+' .cc-selecter').append(input);
		
			$('#'+parent).validator('update');
			if(phone) $('#'+id+' input.phone-field').trigger('change');
		});
		
		
	});
}
