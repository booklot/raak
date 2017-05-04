<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

	<?php if(isset($page)): 
		if(isset($page['title'])) $title = $page['title']; else $title = $page['name'];
	endif;
	if(isset($start) && isset($per)):
		if( $per>0 && $start>1 ) $pn = " - Page ".(int)($start/$per+1);
		else $pn = '';
	else: $pn = '';
	endif;
	?>

	<!-- Basic Page Needs
  ================================================== -->
	<?php echo meta( 'charset', 'utf-8' );
		$st = $this->config->item('site_name');
		$sd = $this->config->item('site_description');
		$sk = $this->config->item('site_keywords');
	?>
	<title><?php 
		if(isset($title)) echo $title.' : '.$st;
		else echo $st;
		echo $pn;
	?></title>
	<?php
		if(isset($page['summary'])) echo meta('description', $page['summary']);
		elseif(isset($page['description'])) echo meta('description', $page['description']);
		else echo meta('description', $sd );
	 ?>
	
	<?php
	if(isset($page['keywords'])):
		if( strlen($page['keywords'])>5 ):
			echo meta('keywords', $page['keywords']);
		else:
			$str = str_replace(array('/','-'), ',', $page['segment']);
			$metakey = implode(', ', array_unique(explode(',',$str)) );
			echo meta('keywords', $metakey);
		endif;
	elseif(isset($page['segment'])):
		$str = str_replace(array('/','-'), ',', $page['segment']);
		$metakey = implode(', ', array_unique(explode(',',$str)) );
		echo meta('keywords', $metakey.", {$st}");
	else: echo meta( 'keywords', $sk );
	endif;?>
	<meta name="author" content="BIT Technologies">
	<meta name="msvalidate.01" content="BF7D4DE2BBB1A18BCFE60A8F881893F5" />
	<!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<link rel="icon" type="image/png" href="<?php echo base_url("site/views/{$theme}/img/fav.png")?>">

	<?php
	
	$this->carabiner->display('css');

	if( isset($stylesheet) ):
		
		foreach( $stylesheet as $css ):
			if( is_array($css) ):
				if( !preg_match( '/^http/', $css['href'] ) )
					$css['href'] = "site/views/$theme/css/".$css['href'].".css";
				echo link_tag($css);
			else:
				if( !preg_match( '/^http/', $css ) )
				$css = "site/views/$theme/css/$css.css";
				echo link_tag($css);
			endif;
		endforeach;
	endif;
	$this->load->view("{$theme}/css.tpl.php");
	?>

	
	
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
		<script src="<?php echo base_url('scripts/respond.min.js')?>"></script>
		<?php echo link_tag(base_url()."site/views/$theme/css/font-awesome-ie7.css");?>
	<![endif]-->

	<!-- saved from url=(0014)about:internet -->
	<?php if( substr_compare( base_url(), 'http://localhost', 0, 16) !=0 ) $this->load->view("$theme/common/dfp.tpl");?>
</head>


<body>

	<?php
		if( substr_compare( base_url(), 'http://localhost', 0, 16) !=0 ):
		$this->load->view("$theme/common/googletags.tpl");
		endif;
	?>

	<header class="">
		<div class="navbar navbar-default topbar navbar-fixed-top"><!--  -->
			<div class="top-container">
				<div class="container">
					 <!-- Brand and toggle get grouped for better mobile display -->
					 <div class="navbar-header">
					 	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					 		<span class="sr-only">Toggle navigation</span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 	</button>
					 	<?php $img_options = $this->config->item('logo_options',"{$theme}_theme");
					 		$img_options['src'] = "site/views/{$theme}/img/logos/".$this->config->item('logo',"{$theme}_theme");
					 		echo anchor( base_url(), img($img_options), 
					 		['class'=>'navbar-brand'] );?>
					 </div>
					 
					 <div class="collapse navbar-collapse navbar-ex1-collapse">
					 	<ul class="nav navbar-nav navbar-right">
							<li>
								<span class="hidden-sm hidden-md hidden-lg">
									<?php if($logged_in==TRUE):
										echo '<strong>'.$this->authorize->get_real_name().'</strong>';
									else:
										echo 'You can <strong>'.anchor('account','Login'). 
										'</strong> or <strong>'.anchor('account/register', 'Create and Account').'</strong>';
									endif;?>
								</span>
							</li>
							<li class="dropdown">
							<?php if($logged_in):?>
								<a class="dropdown-toggle" data-toggle="dropdown" data-target="#" 
									href="<?php echo home_url('account');?>">
									<span class="glyphicon glyphicon-user"></span> My Account
								</a>
								<?php $this->load->view("$theme/common/account_options.tpl");
								else: 
									echo anchor('account/login', '<span class="glyphicon glyphicon-user"></span> Login / Register');
								endif;?>
							</li>
							<li class="divider"></li>
							<!-- <li>
								<?php echo anchor( 'shopping_cart/wishlist', 
								'<span class="glyphicon glyphicon-heart"></span> Wish List');?>
							</li> 
							<li class="divider"></li>-->
							<li class="divider"></li>
							<li>
								<?php $ti = $this->cart->total_items();
								if($ti>0)
								{
									$a = 'style="font-weight:600;"'; 
									$b = $a.' title="click to view your cart"';
									$c = $a.' title="click to complete your order"';
								}
								else{$a=$b=$c='';}
								echo anchor( 'shopping_cart', 
								'<span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart', $b);?>
							</li>
							<li class="divider"></li>
							<li style="padding-right:0;">
								<?php echo anchor( 'checkout', '<span class="glyphicon glyphicon-check"></span> Checkout', $c);?>
							</li>
						</ul><!-- end of topbar right nav ul -->
					</div><!-- end of col-sm-6 -->
				</div><!-- end of container -->
			</div><!-- top-container -->
		</div><!-- end of topbar -->
		
		<div class="topbar2">
			<div class="top-container">
				<div class="container">
					<h1><?php echo $this->config->item('site-name')?></h1>
					<div class="">
						<?php $form = array( 'class'=>'container search', 'method'=>'get' );
						echo form_open( 'shop/search', $form ) ?>
								<div class="col-sm-2  col-lg-2 hidden-xs">
									<label class="btn btn-lg" for="home-search">Quick Search</label>
								</div>
								<div class="col-sm-8 col-xs-9 col-lg-8" style="padding-right:0;padding-left:0;">
									<input type="search" name="q" class="form-control input-lg" 
										placeholder="Search Title or ISBN"
										id="home-search" style="width: 100%;" value="" required>
								</div>
								<div class="col-xs-3 col-sm-2 col-lg-2">
									<button type="submit" class="btn btn-lg btn-gold btn-block">Search</button>
								</div>
								<?php $c = $this->input->get('category')?$this->input->get('category'):1;
									echo form_hidden( 'category', 1 );
									echo form_hidden('reset_sort',1);?>
						</form>
					</div> <!-- end of searchNav -->
				</div><!-- end of container -->
			</div><!-- top-container -->
		</div><!-- topbar2 -->
	</header><!-- end to header row -->

	<div id="mainContainer" class="clearfix container">

	<div id="fb-root"></div>
	
		<!--begain header-->
		<header class="hidden-print">
		
			<nav class="upperHeader">
				<div class="container">
					<div class="dropdown hidden">
						<ul class="visible-xs inline">
						
						</ul>
						<ul class="pull-right inline">
							
							<?php if( $logged_in===TRUE ):?>
								<li class="visible-xs">
									<?php echo anchor( 'account', 'My Account');?>
								</li>
								<li class="visible-xs">
									<?php echo anchor( 'account/logout', 'Logout' );?>
								</li>
							<?php else:?>
								<li class="visible-xs">
									<?php echo anchor( 'account/login', 'Login' );?>
								</li>
								<li class="visible-xs">
									<?php echo anchor( 'account/register', 'Register' );?>
								</li>
							<?php endif;?>
						
							<li class="visible-xs">
								<?php echo anchor('shopping_cart','Shopping Cart');?>
							</li>
							<li class="visible-xs">
								<?php echo anchor('checkout','Checkout');?>
							</li>
							<li><?php echo anchor( base_url('support'), 'Help', 'target="_blank" class="invarseColor"' );?></li>
							<li class="divider-vertical">|</li>
							<li><?php echo anchor( home_url('blog'), 'Blog', 'class="invarseColor"' );?></li>
							<li class="divider-vertical">|</li>
							<li><?php echo anchor( 'shop/become_a_seller', 'Sell Your Products', 'class="invarseColor"' );?></li>
						</ul>
					
						<ul class="inline">
							<li><span class="glyphicon glyphicon-road" style="color:black;"></span> 
								<?php echo anchor( 'shop/delivery', 'Nationwide Delivery', 'class="invarseColor"' );?>
							</li>
							<li class="divider-vertical"></li>
							<li>
								<span class="glyphicon glyphicon-briefcase" style="color:brown;"></span> 
								Multiple Payment Methods
							</li>
							<li class="divider-vertical"></li>
							<li>
								<a class="invarseColor" href="tel:<?php echo lang('phone') ?>" style="font-size:18px;">
									<span class="glyphicon glyphicon-phone-alt" style="color:green;"></span> 
									<strong><?php echo lang('site-phone')?></strong>
								</a>
							</li>
							<li>
								<a class="invarseColor" href="tel:<?php echo $this->config->item('whatsapp-number');?>" 
									style="font-size:18px;">
									<span class="fa fa-whatsapp" style="color:green;"></span> 
									<strong><?php echo $this->config->item('whatsapp')?></strong> <small>(Whatsapp only)</small>
								</a>
							</li>
						</ul>
					</div>
				</div><!--end container-->
			</nav><!--end upperHeader-->







		<?php $err = $this->actions->gem();
		$fa = $this->session->flashdata('message');
		
		if($fa):?> 
			<div class="container">
				<div style="margin-top:10px;">
					<?php
						if( isset($message) ):
							if( $fa!=$message ) echo $fa;
							echo $message;
						else: echo $fa;
						endif;
					?>
				</div>
			</div>
		<?php endif;
		if( !empty( $err ) ):?>
			<div class="container" id="error_div" style="margin-top:10px;">
			<?php
			foreach( $err as $e ):?>
				<div class="<?php echo $e['f']?>"><a href="#" class="close" data-dismiss="alert">&times;</a>
					<?php echo $e['msg'];?>
				</div>
			<?php endforeach;?>
			</div>
		<?php endif;
		$ve = validation_errors('<span>','</span>');
		if(!empty($ve)):?>
			<div class="container">
				<div class="alert alert-warning" style="margin-top:10px;"><a href="#" class="close" 
					data-dismiss="alert">&times;</a>
					<?php echo $ve;?>
				</div>
			</div>
		<?php endif;?>
	</header>
