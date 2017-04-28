function increment_qty( id, max_order )
{
	document.getElementById( 'qty'+id ).value++;
	document.getElementById( 'sudo_qty'+id ).innerHTML++;
	if( document.getElementById( 'qty'+id ).value > max_order )
	{
		document.getElementById( 'qty'+id ).value = max_order;
		document.getElementById( 'sudo_qty'+id ).innerHTML = max_order;
	}
}
function decrement_qty( id, min_order )
{
	document.getElementById( 'qty'+id ).value--;
	document.getElementById( 'sudo_qty'+id ).innerHTML--;
	if( document.getElementById( 'qty'+id ).value < min_order )
	{
		document.getElementById( 'qty'+id ).value = min_order;
		document.getElementById( 'sudo_qty'+id ).innerHTML = min_order;
	}
}

function reset_sudo()
{
	document.getElementById("shopping_cart_form").reset();
	$(".uneditable-input").each(function(index, value)
	{
		$(this).text( $(this).attr('reset') );
	});
	$(".qty_hidden").each(function(index, value)
	{
		$(this).val( $(this).attr('reset') );
	});
}

// link fancybox plugin on product detail
function productFancyBox()
{
	if($(".fancybox"))
	{
		$(".fancybox").fancybox({
			openEffect	: 'none',
			closeEffect	: 'none'
		});
	}
}



$('.share_buttons').click(function(){
	// link selector and pop-up window size
	var Config = 
	{
		Width: 500,
		Height: 500
	};
	var btn = $(this);
	var link = $(this).data('link');
	//btn.target = null;
	//btn.href=null;
	//$(this).addClass('disabled');
	
	
	// popup position
	var
		px = Math.floor(((screen.availWisharedth || 1024) - Config.Width) / 2),
		py = Math.floor(((screen.availHeight || 700) - Config.Height) / 2);

	// open popup
	var popup = window.open(link, "social",
		"width="+Config.Width+",height="+Config.Height+",left="+px+",top="+py+
		",location=0,menubar=0,toolbar=0,status=0,scrollbars=1,resizable=1");
	if(popup)
	{
		popup.focus();
		if (btn.preventDefault) btn.preventDefault();
		else btn.returnValue = false;
	}
	return !!popup;
});

function total_price()
{
	var price = $('.product-inputs').data('price');
	if( price ) price = price*1;
	else return;
	var shipping = $('.shipping-cost').data('value')*1;
	var options = $('.product-inputs select option:selected');
	options.each(function(){ price = price + $(this).data('cost')*1;});
	var qty = $('.order-quantity').val()*1;
	var total = (price*qty)+shipping;
	if( qty < 1 ) total = 0;
	var f = $.number(total,2);
	$('.total-price').html('$'+f);
}

$(".order-quantity").change(function(e)
	{
		var postData = $('#add2cart').serializeArray();
		var burl = $('#base_url').val();
		moq = $('.min_order').val()*1;
		oq = $('.order-quantity').val()*1;
		if( moq > oq )
		{
			$('.price-loading').removeClass('hidden');
			$('.price-loading').text('MOQ is '+$('.min_order').val());
			return;
		}
		$.ajax(
		{
			url : burl+'ajax/total_price',
			type: "POST",
			data : postData,
			dataType: 'json',
			beforeSend: function()
			{
				$('.price-loading').removeClass('hidden');
				$('.total-price').addClass('faded');
			},
			success:function(data, textStatus, jqXHR)
			{
				if( data['error']==false )
				{
					var f = $.number(data['total_price'],2);
					$('.total-price').html('$'+f);
					$('.unit-price').html(data['product_price_html']);
					$('.discounts').html(data['discounts_html']);
					$('.shipping-options').html(data['shipping_html']);
					$('.total-savings').html(data['total_save_html']);
					$('.price-loading').addClass('hidden');
					$('.total-price').removeClass('faded');
				}
				else
				{
					$('.price-loading').text('can\'t get total price, retry?');
				}
			},
			error: function(jqXHR, textStatus, errorThrown) 
			{
				//$('.ajax_register_error').html( '<div class="alert alert-warning">'+errorThrown+': '+textStatus+'</div>' );
				$('.price-loading').text(errorThrown);
			}
		});
		e.preventDefault(); //STOP default action
		//e.unbind(); //unbind. to stop multiple form submit.
	});

$(document).ready(function()
{
	productFancyBox();
	$('.share_buttons').removeAttr('href');

	total_price();
	/*
	$(document).on("change", '.order-quantity', function(e)
	{
		total_price();
	});
	*/
	$(document).on("change", '.order-options', function(e)
	{
		total_price();
	});

	$('[data-toggle="tooltip"]').tooltip();
	//$( "a[rel=popover]" ).popover();
	$('[data-toggle="popover"]').popover();

});



