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
	$p_callout = 'style = '.'"padding:15px; background-color:#ECF8FF; margin-bottom: 15px;"';
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
	$h1 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:200; font-size: 44px; \'';
	$h2 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:200; font-size: 37px; \'';
	$h3 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:500; font-size: 27px; \'';
	$h4 = 'style=\' font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, 
				"Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000; font-weight:500; font-size: 23px; \'';
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
						<td align="right"><h6 <?php echo $h6collapse;?>>New Account Registration</h6></td>
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
						<h3 <?php echo $h3;?>>Hi, <?php echo $name;?></h3>
						<p class="lead">Thank you for Registering on <?php echo lang('site-name');?>, Zimbabwe's online shopping mall</p>
						
						<!-- Callout Panel -->
						<p <?php echo $p_callout;?>>
Before you can access your account, you need to activate your account. Please <?php echo anchor( base_url('account/activate_account/'. $user_id .'/'. $activation_token), 'Click Here', $a_callout);?> to activate your account.
						</p><!-- /Callout Panel -->		
						
						<p>
We are pleased to welcome you as a new customer on <?php echo lang('site-name');?>. We are sure that you will find online shopping to be easy, safe and time saving. <br><br>
On Zimall, you can buy almost anything from the comfort of your home or office. Payments for your orders can be done using either <strong>EcoCash</strong> or <strong>Bank Transfer/Deposit</strong>. We are working to provide more payment methods for your convenience.<br><br>
<?php echo lang('site-name');?> offers delivery services for all orders you make, so please make sure you add a delivery address in your account section.
Deliveries are currently made the next morning after you have made your payment.
<br><br>
If you would like to sell your products via <?php echo lang('site-name');?>, 
<?php echo anchor( base_url('shop/become_a_seller'), 'learn how to sell your products', $a );?>.<br>

Thank you for choosing <?php echo lang('site-name');?> for all of your online shopping needs. We look forward to serving you.</p>

						<!-- Callout Panel -->
						<p <?php echo $p_callout;?>>If you have not  activated your account yet,<br>
						<?php echo anchor( base_url('account/activate_account/'. $user_id .'/'. $activation_token), 'Activate Account', $a_callout);?></p><!-- /Callout Panel -->					
												
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
							<?php echo anchor( base_url('account/subscribe/user/'.$user_id.'/nl_id/1/set/0'), 'Unsubscribe', $a );?>
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
