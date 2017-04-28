<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- If you delete this meta tag, Half Life 3 will never be released. -->
<meta name="viewport" content="width=device-width" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome to <?php echo lang('site-name');?></title>
</head>
 
<body bgcolor="#FFFFFF" style="margin:0;padding:0">
<!-- HEADER -->
<div style="font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; margin:0; padding:0; -webkit-font-smoothing:antialiased; -webkit-text-size-adjust:none; width: 100%!important; height: 100%;">

<?php $a = array( 'style'=>'color: #2BA6CB;' );
	$p_callout = 'style = '.'"padding:15px; background-color:#f2dede; margin-bottom: 15px;"';
	$a_callout = array('style'=>'font-weight:bold; color: #2BA6CB;');
	$col = 'margin:0;padding:0;';
	$fb = 'style = "padding: 3px 7px; font-size:12px; margin-bottom:10px; text-decoration:none; color: #FFF;
				font-weight:bold; display:block; text-align:center; background-color: #3B5998!important;"';
	$tw = 'style = "padding: 3px 7px; font-size:12px; margin-bottom:10px; text-decoration:none; color: #FFF;
				font-weight:bold; display:block; text-align:center; background-color: #1daced!important;"';
	$gp = 'style = "padding: 3px 7px; font-size:12px; margin-bottom:10px; text-decoration:none; color: #FFF;
				font-weight:bold; display:block; text-align:center; background-color: #DB4A39!important;"';
	$ss = 'style = "padding: 3px 7px; margin-bottom:10px; text-decoration:none; color: #FFF; font-size:12px; 
				font-weight:bold; display:block; text-align:center; background-color: #1daced!important; margin-top:4px;"';
	$mp = 'style = "padding: 15px 7px; margin-bottom:10px; text-decoration:none; color: #FFF;
				font-weight:bold; display:block; text-align:center; background-color: #1daced!important; margin-top:4px;"';
	$h1 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:200; font-size: 44px; \'';
	$h2 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:200; font-size: 37px; \'';
	$h3 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:500; font-size: 27px; \'';
	$h4 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; color:#000; font-weight:500; font-size: 23px; '.$col.' margin-bottom:10px;\'';
	$h5 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:900; font-size: 17px;'.$col.' \'';
	$h6 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:900; font-size: 14px;
				text-transform: uppercase; color:#444; \'';
	$p = 'style=\'margin-bottom: 10px; font-weight: normal; font-size:14px; line-height:1.6;\'';
	$head_wrap = 'style= \'width: 100%;'.$col.'\'';
	$collapse = 'style="margin:0;padding:0;"';
	$h6collapse = 'style=\'font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:900; font-size: 14px;
				text-transform: uppercase; color:#444;margin:0!important;\'';
	$content = 'style=\'padding:15px; max-width:600px; margin:0 auto; display:block;\'';
	$container = 'style=\'display:block!important; max-width:600px!important; margin:0 auto!important; clear:both!important;\'';
	$column = 'style="width: 300px; float:left;"';
	$socialcolumn = 'style="width: 280px; min-width: 279px; float:left; margin:0; padding:0;"';
	$footer = 'style="width: 100%;clear:both!important;"';
	
?>

<table <?php echo $head_wrap?> bgcolor="#e7e7e7">
	<tr>
		<td></td>
		<td style="width:100%;display: block!important;max-width: 600px!important;margin: 0 auto!important;clear: both!important;" >
				
				<div <?php echo $content?>>
				<table bgcolor="#e7e7e7" style="width:100%">
					<tr>
						<td><?php echo anchor( base_url(), img("images/zimall3-220x74.png"), $a );?></td>
						<td align="right"><h6 <?php echo $h6collapse;?>>Order could not be placed</h6></td>
					</tr>
				</table>
				</div>
				
		</td>
		<td></td>
	</tr>
</table><!-- /HEADER -->


<!-- BODY -->
<table <?php echo $head_wrap;?>>
	<tr>
		<td></td>
		<td <?php echo $container;?> bgcolor="#FFFFFF">

			<div <?php echo $content?>>
			<table>
				<tr>
					<td>
						<h3 <?php echo $h3;?>>Hello, <?php echo $invoice['fname'].' '.$invoice['surname'];?></h3>
						<p class="lead">Your order could not be placed on <?php echo lang('site-name');?>. Some or all of the products you ordered are not available anymore.</p>
						
						<!-- Callout Panel -->
						<div <?php echo $p_callout;?>>
						<h4 <?php echo $h4;?>>Order Details <span style="float:right;font-size:14px;">Invoice Num: <?php echo $invoice['invoice_num'];?></span> </h4>


<table style="width:100%;text-align:left; border-collapse:collapse; border: 1px solid #ccc;" border="1">
	<tr>
		<th>Name</th>
		<th>Qty</th>
		<th>Shop</th>
		<th style="text-align:right;">Price</th>
	</tr>

<?php $orders = $invoice['invoice_details'];
	foreach($orders as $order):?>
	<tr>
		<td><?php echo $order['name']?></td>
		<td><?php echo $order['qty']?></td>
		<td><?php echo $order['shop']?></td>
		<td style="text-align:right;"><?php echo toc($order['qty']*$order['price'])?></td>
	</tr>
<?php endforeach;?>
<tfoot>
	<tr>
		<td colspan="4"><br clear="all"></td>
	</tr>
	<tr>
		<td colspan="1">Payment Method</td>
		<td colspan="3"><em><?php echo $invoice['payment_method']?></em> </td>
	</tr>
	<tr>
		<td colspan="1">Delivery Method</td>
		<td colspan="2"><em><?php echo $invoice['shipping_method']?></em> </td>
		<td style="text-align:right;"><?php echo toc( $invoice['shipping'] )?></td>
	</tr>
	
	<tr>
		<td colspan="3">Transaction Fees</td>
		<td style="text-align:right;"><?php echo toc( $invoice['fees'] )?></td>
	</tr>
	
	<tr>
		<td colspan="2"></td>
		<td colspan="1" style="text-align:left;">Order Total</td>
		<td colspan="1" style="text-align:right;font-weight:bold;"><?php echo toc( $invoice['total'] )?></td>
	</tr>
	
</tfoot>
</table>


						</div><!-- /Callout Panel -->		



<p>
Thank you for choosing <?php echo lang('site-name');?> for all of your online shopping needs. We look forward to serving you.</p>

						<!-- Callout Panel -->
						<p <?php echo $p_callout;?>>If you have any questions about your order, you can email our sales team, 
						<?php echo mailto('sales@zimall.co.zw', 'sales@zimall.co.zw', $a_callout);?> or call <?php echo lang('site-phone');?></p><!-- /Callout Panel -->					
												
						<!-- social & contact -->
						<table style="background-color: #ebebeb; margin:0; padding:0;" width="100%">
							<tr>
								<td <?php echo $collapse;?>>
									
									<!-- column 1 -->
									<table align="left" <?php echo $socialcolumn?>>
										<tr>
											<td style="padding: 15px;"'>				
												
												<h5 <?php echo $h5;?> class="">Connect with Us:</h5>
												<p <?php echo $p?>>
													<?php echo anchor( 'https://www.facebook.com/zimall', 'Facebook', $fb );?>
													<?php echo anchor( "https://twitter.com/ZimallStore", 'Twitter', $tw );?>
													<?php echo anchor( "https://plus.google.com/+ZimallCoZwstore/", 'Google +', $gp );?>
												</p>
						
												
											</td>
										</tr>
									</table><!-- /column 1 -->	
									
									<!-- column 2 -->
									<table align="left" <?php echo $socialcolumn?>>
										<tr>
											<td style="padding: 15px;">				
																			
												<h5 <?php echo $h5;?> class="">Contact Info:</h5>												
												<p <?php echo $p?>>
													Phone: <strong><?php echo lang('site-phone');?></strong><br/>
                									Email: <strong>
                									<?php echo mailto( lang('support-email'), lang('support-email'), $a );?></strong><br>
                									Help: <strong>
                									<?php echo anchor( 'https://www.zimall.co.zw/support', lang('site-name').' Support Center', $a);?></strong>
                						<?php echo anchor( base_url(), 'Start Shopping Now', $ss );?>			
                </p>
                
											</td>
										</tr>
									</table><!-- /column 2 -->
									
									<span class="clear"></span>	
									
								</td>
							</tr>
						</table><!-- /social & contact -->
						
					</td>
				</tr>
			</table>
			</div><!-- /content -->
									
		</td>
		<td></td>
	</tr>
</table><!-- /BODY -->

<!-- FOOTER -->
<table <?php echo $footer?>>
	<tr>
		<td></td>
		<td <?php echo $container?>>
			
				<!-- content -->
				<div <?php echo $content?>>
				<table style="width:100%;">
				<tr>
					<td align="center">
						<p style="margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">
							<?php echo anchor( base_url('shop/terms_conditions'), 'Terms and Conditions', $a);?> |
							<?php echo anchor( base_url('shop/privacy'), 'Privacy Policy', $a);?> |
							<?php echo anchor( base_url('shop/delivery'), 'Delivery Information', $a);?> |  
							<?php echo anchor( base_url('account/cancel_order/'.$invoice['invoice_num']), 'Cancel Order', $a );?>
						</p>
					</td>
				</tr>
			</table>
				</div><!-- /content -->
				
		</td>
		<td></td>
	</tr>
</table><!-- /FOOTER -->
</div>
</body>
</html>
