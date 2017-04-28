<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

</div><!--end mainContainer-->
<!--begin footer-->
	<footer>
		<div class="footerOuter">
			<div class="container">
				
				<div class="row" style="border-bottom: solid 3px dodgerblue;padding-bottom:20px;">
					<div class="container">
						<div class="col-sm-6" style="border-right: dashed 1px #ccc;">
						<div class="col-sm-2">
							<a class="pull-left" href="#">
								<?php $img = array( 'src'=>'images/mail.png', 'class'=>'media-object', 'style'=>'max-width:60px;' );?>
								<?php echo img($img);?>
							</a>
						</div>
							<div class="col-sm-10">
								<h6 class="media-heading">sign up for exclusive offers</h6>
								<em>news, special offers and new items</em>
								<div class="newslatter">
							<?php echo form_open( 'account/subscribe', 'style="margin-top:5px;" class="form-horizontal"' );?>
							
								<div class="form-group"><div class="col-sm-11"><div class="input-group">
									<span class="input-group-addon">Name:</span>
									<input type="text" class="form-control" placeholder="Your Name..." name="name" required>
								</div></div></div>

								<div class="form-group"><div class="col-sm-11">
									<div class="input-group">
										<span class="input-group-addon">Email:&nbsp;</span>
										<input type="email" class="form-control" name="email" placeholder="Your email address	"
										required>
										<span class="input-group-btn">
											<button class="btn btn-default"  type="submit" name="subscribe">
											&nbsp;&nbsp;&nbsp;&nbsp;join&nbsp;&nbsp;&nbsp;&nbsp;</button>
										</span>
									</div><!-- /input-group -->
								</div><!-- /.col-lg-8 --></div>
							
								<input type="hidden" name="subscribe_to_newsletter" value="1">
								<input type="hidden" name="nl_id" value="1">
								<input type="hidden" name="return_url" value="<?php echo current_url();?>">
							</form>
						</div>
						</div>
					</div>
					
					<div class="col-sm-6 contact">
						<div class="col-sm-2">
							<a class="pull-left" href="#">
								<?php $img = array( 'src'=>'images/old-telephone200px.png', 'class'=>'media-object', 'style'=>'max-width:60px;' );?>
								<?php echo img($img);?>
							</a>
						</div>
							<div class="col-sm-10">
								<h6 class="media-heading">contact us</h6>
								<em>Monday to Friday, 9am to 5pm GMT +02:00</em>
								<p class="telephone">
									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tel:</span>&nbsp;
									<a class="invarseColor" href="tel:<?php echo $this->config->item('phone') ?>"><?php 
										echo $this->config->item('site-phone') ?></a>
								</p>
								<p>
									<span>email:&nbsp;</span>
									<?php echo safe_mailto( $this->config->item('sales-email'), 
										$this->config->item('sales-email'), 'class="invarseColor"' );?><br>
									<span>address:</span> <?php echo $this->config->item('address');?>
								</p>
							</div>
					</div>
					
				</div>
				</div>
				<div class="row" style="border-top: solid 1px dodgerblue; margin-top:2px;height:30px;">
					<div class="col-sm-12"></div>
				</div>
				
				
				<div class="row">
					<div class="container">
					<div class="col-sm-6" style="border-right: dashed 1px #ccc;">
						<h4>About Us</h4>
						<p style="text-align: justify; padding-right: 3%;">
							<?php echo auto_link( $this->config->item('footer-about') );?> 
							<?php echo anchor( 'shop/about', 'Read More' );?>...
						</p>
						<br clear="all">
					</div>
					
					<div class="col-sm-3" style="border-right: dashed 1px #ccc;">
						<!--
						<h4>Shopping online</h4>
						<ul class="unstyled new-footer">
							
							<li><span class="icon-caret-right"></span> <?php echo anchor( 'shop/delivery', lang('delivery-info') );?></li>
							<li><span class="icon-caret-right"></span> <?php echo anchor( 'shop/privacy', lang('privacy-policy') );?></li>
							<li><span class="icon-caret-right"></span> <?php echo anchor( 'shop/terms_conditions', lang('terms-conditions') );?></li>
							<li><span class="icon-caret-right"></span> <?php echo anchor( 'shop/return_policy', 'Returns' );?></li>
							<li><span class="icon-caret-right"></span> <?php echo anchor( 'shop/become_a_seller', 'Sell Your Products' );?></li> 
							<li><span class="icon-caret-right"></span> <?php echo anchor( 'shops', 'View Shops' );?></li>
						</ul>
						 -->
					</div>
					
					<div class="col-sm-3">
						<h4>Follow Us</h4>
						<?php $social = $this->config->item('social-media');?>
						<ul class="unstyled follow" style="margin:0px;">
							<?php if($social['facebook']):?>
							<li class="col-sm-2" style="padding-left:0;">
								<?php echo anchor( $social['facebook'], 
								'<i class="radmin-facebook-2"></i> <span class="visible-xs">Facebook</span>', 
								'style="color:#3f5c9a" target="blank"' );?>
							</li>
							<?php endif;
							if($social['twitter']):?>
							<li class="col-sm-2">
								<?php echo anchor( $social['twitter'], 
								'<i class="radmin-twitter-2"></i> <span class="visible-xs">Twitter</span>', 
								'style="color:#55acee" target="blank"' );?>
							</li>
							<?php endif;
							if($social['linkedin']):?>
							<li class="col-sm-2">
								<?php echo anchor( $social['linkedin'], 
								'<i class="radmin-linkedin"></i> <span class="visible-xs">Linked In</span>', 
								'style="color:#2387bd" target="blank"' );?>
							</li>
							<?php endif;
							if($social['twitter']):?>
							<li class="col-sm-2">
								<?php echo anchor( $social['twitter'],
								'<i class="radmin-google-plus-3"></i> <span class="visible-xs">Google +</span>', 
								'style="color:#dd4b39" target="blank"' );?>
							</li>
							<?php endif;
							if($social['youtube']):?>
							<li class="col-sm-2">
								<?php echo anchor( $social['youtube'], 
								'<i class="radmin-youtube"></i> <span class="visible-xs">Youtube</span>', 
								'style="color:#dc2725" target="blank"' );?>
							</li>
							<?php endif;?>
						</ul>
						<br clear="all">
						<?php if($social['support']):?>
						<ul class="unstyled follow" style="margin:0px;">
							<li class="col-xs-2" style="padding-left:0;">
								<?php echo anchor( $social['support'], '<i class="radmin-support"></i>', 'style="color:red"' );?>
							</li>
							<li class="col-xs-10" style="margin-top:0px;">
								<?php echo anchor( $social['support'], 
								' Support Centre', 'style="font-size: 14px;" target="_blank"' );?>
							</li>
						</ul>
						<?php endif;?>
					</div>
				</div>
				</div>
			</div><!--end container-->
		</div><!--end footerOuter-->

		<div class="container">
			<div class="top-container">
				<div class="col-sm-12">
					
					<ul class="payments inline pull-right">
					<!-- 
						<li class="paypal"><?php echo anchor( 'shop/payments/flocash', '&nbsp;' );?></li>
						<li class="visa"><?php echo anchor( 'shop/payments/flocash', '&nbsp;' );?></li>
						<li class="electron"><?php echo anchor( 'shop/payments/flocash', '&nbsp;' );?></li>
						
						<li class="discover"></li>
					 -->
					</ul>
					<ul class="local-payments inline pull-right">
					<!--
						<li class="ecocash"><?php echo anchor( 'shop/payments/ecocash', '&nbsp;', 'style="display:block;"' )?></li>
						<li class="telecash"><?php echo anchor( 'shop/payments/telecash', '&nbsp;', 'style="display:block;"' )?></li>
						<li class="flocash"><?php echo anchor( 'shop/payments/flocash', '&nbsp;', 'style="display:block;"' )?></li>
					-->
						<li class="paynow-badge"><?php echo anchor( 'shop/payments/paynow', img('images/payment_types_badge.png'), 'style="display:block;"' );?></li>
					</ul>
					
					<p>
						&copy; Copyright 2012 - <?php echo date('Y').' '.anchor( base_url(), $this->config->item('business-name'), 
						'class="invarseColor"'); ?><br>
						powered by <?php echo anchor('https://www.zimall.co.zw', 'Zimall Online', 'target="_blank"')?><br>
						<ul class="local-payments inline pull-left">
					<?php if( substr_compare( base_url(), 'http://localhost', 0, 16) !=0 && 0>1):?>
						<li class="pull-left" style="text-align:left;">
							<span id="siteseal">
								<script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=sAuqaezhJKNNOM2TGb9oGpO5m4DsM8WZqoA7RCifdfjpah9UvAWt1"></script></span>
						</li>
					<?php endif;?>
					</ul>
					</p>
				</div>
			</div>
			<br clear="all"><br clear="all"><br clear="all">
		</div>
	</footer>
		<!--end footer-->
<br clear="all"><br clear="all"><br clear="all">




<form class="hidden">
	<input type="hidden" name="base_url" id="base_url" value="<?php echo base_url()?>">
	<input type="hidden" name="site_url" id="site_url" value="<?php echo site_url()?>">
	<input type="hidden" name="current_url" id="current_url" value="<?php echo current_url()?>">
	<input type="hidden" name="site_theme" id="site_theme" value="<?php echo $theme?>">
</form>

<?php

//echo link_tag('https://fonts.googleapis.com/css?family=Sanchez:400italic,400|Open+Sans:400italic,600italic,700italic,400,600');

if(!empty($fext_js))
{
	foreach( $fext_js as $fj )
	{
		echo script_tag($fj);
	}
}

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

$this->sc->display('js');

if( isset($theme_scripts) ):
	if( is_array($theme_scripts) ):
	$theme_scripts = array_unique($theme_scripts);
	foreach( $theme_scripts as $f ):
		echo '<script src="'.base_url().'site/views/'.$theme.'/js/'.$f.'.js"></script>';
	endforeach;
	endif;
endif;

if( isset($print_scripts) ):
	if( is_array($print_scripts) ):
	echo '<script>';
	foreach( $print_scripts as $f ):
		echo $f." \n";
	endforeach;
	echo '</script>';
	endif;
endif;

if( isset($ckeditor) ):?>
	<script type="text/javascript" src="<?php echo base_url('scripts/ckeditor/ckeditor.js');?>"></script>

	<?php if($ckeditor=='basic'):?>
		<script>
					CKEDITOR.replace( 'ckeditor1',
					{
						toolbar : 'Basic',
						//uiColor : '#9AB8F3',
						enterMode : CKEDITOR.ENTER_BR
					});
		</script>
	<?php else:?>
	
		<script>
					CKEDITOR.replace( 'ckeditor1',
					{
						enterMode : CKEDITOR.ENTER_BR
					});
		</script>
				
<?php endif; endif;

if(isset($uploader)):
	if($uploader=='ajax'):?>
	<script src="<?php echo base_url() ?>scripts/ajaxupload.js"></script>
	<script src="<?php echo base_url() ?>scripts/images.js"></script>
<?php elseif( $uploader=='fine' || $uploader=='music'):?>
<script src="<?php echo base_url() ?>scripts/fine/header.js"></script>
<script src="<?php echo base_url() ?>scripts/fine/util.js"></script>
<script src="<?php echo base_url() ?>scripts/fine/button.js"></script>
<script src="<?php echo base_url() ?>scripts/fine/handler.base.js"></script>
<script src="<?php echo base_url() ?>scripts/fine/handler.form.js"></script>
<script src="<?php echo base_url() ?>scripts/fine/handler.xhr.js"></script>
<script src="<?php echo base_url() ?>scripts/fine/uploader.basic.js"></script>
<script src="<?php echo base_url() ?>scripts/fine/dnd.js"></script>
<script src="<?php echo base_url() ?>scripts/fine/uploader.js"></script>
<script src="<?php echo base_url() ?>scripts/<?php echo $uploader;?>.js"></script>
<?php endif;endif;?>
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


<?php if( substr_compare( base_url(), 'http://localhost', 0, 16) !=0 ):
		$this->load->view("$theme/common/google_analytics.tpl");
	//$this->load->view("$theme/common/chat.tpl");
	//$this->load->view("$theme/common/fb_audience_pixel.tpl");
endif;?>
</body>
</html>
