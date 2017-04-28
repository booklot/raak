<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<!--begin footer-->
		<footer>
		<div class="footerOuter">
			<div class="container">
				<div class="row-fluid">

					<div class="span6">
						<div class="titleHeader clearfix">
							<h3>Usefull Links</h3>
						</div>

						
						<div class="usefullLinks">
							<div class="row-fluid">
								<div class="span6">
									<ul class="unstyled">
										<li><?php echo anchor( 'shop/about', '<i class="icon-caret-right"></i> '.lang('about-us'), 'class="invarseColor"');?></li>
										<li><?php echo anchor( 'shop/delivery', '<i class="icon-caret-right"></i> '.lang('delivery-info'),
											'class="invarseColor"');?></li>
										<li><?php echo anchor( 'shop/privacy', '<i class="icon-caret-right"></i> '.lang('privacy-policy'),
											'class="invarseColor"');?></li>
										<li><?php echo anchor( 'shop/terms_conditions', '<i class="icon-caret-right"></i> '.lang('terms-conditions'),
											'class="invarseColor"');?></li>
									</ul>
								</div>

								<div class="span6">
									<ul class="unstyled">
										<li><?php echo anchor( 'shop/become_a_seller', '<i class="icon-caret-right"></i> Sell Your Products',
											'class="invarseColor"');?></li>
										<li><?php echo anchor( 'https://www.zimall.co.zw/support', 
											'<i class="icon-caret-right"></i> '.lang('customer-support'),
											'class="invarseColor" target="_blank"');?></li>
										<li><?php echo anchor( 'shops', '<i class="icon-caret-right"></i> View Shops',
											'class="invarseColor"');?></li>
										<li><?php echo anchor( 'shop/special', '<i class="icon-caret-right"></i> '.lang('promotions'),
											'class="invarseColor"');?></li>
									</ul>
								</div>
							</div>
						</div>

					</div><!--end span6-->

					<div class="span3">
						<div class="titleHeader clearfix">
							<h3><?php echo lang('contact-info') ?></h3>
						</div>

						<div class="contactInfo">
							<ul class="unstyled">
								<li>
									<button class="btn btn-small">
										<i class="icon-volume-up"></i>
									</button>
									<?php echo lang('call-us') ?>: 
									<a class="invarseColor" href="tel:<?php echo lang('phone') ?>"><?php echo lang('site-phone') ?></a>
								</li>
								<li>
									<button class="btn btn-small">
										<i class="icon-envelope-alt"></i>
									</button>
									<?php echo safe_mailto( lang('site-email'), lang('site-email'), 'class="invarseColor"' );?>
								</li>
								<li>
									<button class="btn btn-small">
										<i class="icon-map-marker"></i>
									</button>
									<?php echo lang('site-address') ?>
								</li>
							</ul>
						</div>

					</div><!--end span3-->

					<div class="span3">
						<div class="titleHeader clearfix">
							<h3><?php echo lang('newsletter'); ?></h3>
						</div>

						<div class="newslatter">
							<?php echo form_open( 
								'http://zimall.us3.list-manage1.com/subscribe/post?u=5920f443d00e6dd695190aa0c&amp;id=e591c063be', 
								array('target'=>"_blank") );?>
								<div class="input-prepend">
									<span class="add-on"><i class="icon-user"></i></span>
									<input class="input-block-level span10" type="text" name="FNAME" value="" 
										placeholder="Your Name..." Name="">
								</div>
								<div class="input-prepend">
									<span class="add-on">@</span>
									<input class="input-block-level span10"type="text"name="EMAIL" value="" 
										placeholder="Your E-Mail..." Name="">
								</div>
								<input type="hidden" name="subscribe_to_newsletter" value="1">
								<input type="hidden" name="nl_id" value="1">
								<input type="hidden" name="return_url" value="<?php echo current_url();?>">
								<!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
								<div class="hidden">
									<input type="text" name="b_5920f443d00e6dd695190aa0c_e591c063be" value="">
								</div>
								<button class="btn btn-block" type="submit" name="subscribe" 
									value="Subscribe" id="mc-embedded-subscribe"><?php echo lang('join-us-now'); ?></button>
							</form>
						</div>

					</div><!--end span3-->

				</div><!--end row-fluid-->
				
				<div id="mce-responses" class="clear">
					<div class="response" id="mce-error-response" style="display:none"></div>
					<div class="response" id="mce-success-response" style="display:none"></div>
				</div>

			</div><!--end container-->
		</div><!--end footerOuter-->

		<div class="container">
			<div class="row">
				<div class="span12">
					<ul class="payments inline pull-right">
						<li class="visia"></li>
						<li class="paypal"></li>
						<li class="electron"></li>
						<li class="discover"></li>
					</ul>
					<ul class="local-payments inline pull-right">
						<li class="ecocash"><?php echo anchor( 'shop/payments/ecocash', '&nbsp;', 'style="display:block;"' )?></li>
					</ul>
					<p>
						&copy; Copyright 2012 - <?php echo date('Y').' '.lang('site-name'); ?>
						&nbsp;&nbsp;&nbsp;powered by Carbon Microsystems
					</p>
				</div>
			</div>
		</div>
		</footer>
		<!--end footer-->
	</div><!--end mainContainer-->





<form class="hidden">
	<input type="hidden" name="base_url" id="base_url" value="<?php echo base_url()?>">
	<input type="hidden" name="site_url" id="site_url" value="<?php echo site_url()?>">
	<input type="hidden" name="current_url" id="current_url" value="<?php echo current_url()?>">
	<input type="hidden" name="site_theme" id="site_theme" value="<?php echo $theme?>">
</form>

<?php

//echo link_tag('https://fonts.googleapis.com/css?family=Sanchez:400italic,400|Open+Sans:400italic,600italic,700italic,400,600');

$this->carabiner->display('js');

if( isset($scripts) ):
	if( is_array($scripts) ):
	//$scripts = array_unique($scripts);
	foreach( $scripts as $n=>$f ):
			if(is_array($f)):
				if($f['echo']):
					echo '<script>';
					$this->load->file("scripts/$n.js");
					echo '</script>';
				endif;
			else:
				echo '<script src="'.base_url().'scripts/'.$f.'.js"></script>';
			endif;
	endforeach;
	endif;
endif;

if( isset($theme_scripts) ):
	if( is_array($theme_scripts) ):
	$theme_scripts = array_unique($theme_scripts);
	foreach( $theme_scripts as $f ):
		echo '<script src="'.base_url().'site/views/'.$theme.'/js/'.$f.'.js"></script>';
	endforeach;
	endif;
endif;

if( isset($print_scripts) ):
	if( is_array($theme_scripts) ):
	echo '<script>';
	foreach( $print_scripts as $f ):
		echo $f." \n";
	endforeach;
	echo '</script>';
	endif;
endif;

echo '<script>';
$this->load->file("scripts/analyticstracking.js");
echo '</script>';

?>
<script>
  //var navigation = responsiveNav("#cssmenu");
</script>

<?php
if(isset($fb_script)):
	if($fb_script==TRUE):
		$this->load->view("$theme/account/fb_script.tpl");
	endif;
endif;
?>


</body>
</html>
