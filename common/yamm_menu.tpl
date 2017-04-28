<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<nav class="navbar yamm top-bar-section" role="navigation">
<!--
	<div class="navbar-header">
		<button type="button" data-target="#menu-main-menu-1" data-toggle="collapse" class="navbar-toggle">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
-->
	<ul class="nav navbar-nav" id="menu-main-menu-1">
		<?php $a = array( 'style'=>'font-size:16px;vertical-align:middle;display:table-cell;padding-left:2px;',
			'title'=>'Home' );?>
		<li><?php echo anchor(base_url(),'<span class="glyphicon glyphicon-home"></span>', $a);?></li>
		<li class="dropdown yamm-fw">
			<?php echo anchor('shop/overview/1/all-categories','All<br>Categories <span class="caret"></span>', 'data-toggle="dropdown" class="dropdown-toggle"');?>
			<ul class="dropdown-menu menu-6" role="menu">
				<?php
					$n = count($cssmenu);
					foreach( $cssmenu as $i=>$v ):
						echo $v['li'];
						if(isset($v['items'])):
							$items = $v['items'];
							echo '<ul>';
							foreach( $items as $m ):
								echo $m;
							endforeach;
							echo '</ul>';
						endif;
						echo '</li>';
						if( ( ($i+1)>0 && ($i+1)%4==0) || ( $n==($i+1) && ($i+1)%4!=0 ) ) echo '<br clear="all"><!--end of row'.(int)(($i/4)+1).'-->';
					endforeach;
				?>
				
			</ul>
			
		</li>
		<li>
			<?php echo anchor('shop/overview/8/books','Books &amp;<br>Magazines')?>
		</li>
		<li><?php echo anchor('shop/overview/64-117/music-movies-games','Music, Movies <br>&amp; Games')?></li>
		<li class="dropdown yamm-fw">
			<?php echo anchor('shop/overview/6/phones-tablets-accessories','Phones, Tablets <br>&amp; Accessories <span class="caret"></span>', 
			'class="dropdown-toggle" data-toggle="dropdown"');?>
			<ul class="dropdown-menu menu-6">
				<li class="col-sm-4">
				<br clear="all">
					<h2><?php echo anchor( 'shop/overview/6/phones-tablets-accessories', 'Phones, Tablets &amp; Accessories' );?></h2>
					<ul>
								<?php if(isset($topmenu[6]['l'])):
									$l = $topmenu[6]['l']; $r = $topmenu[6]['r'];
									foreach($menulist as $k=>$v):
										if( $v['l']>$l && $v['r']<$r && $v['level']==2 ):?>
											<li><h3><?php echo anchor( 'shop/categories/'.$v['id'].'/'.$v['segment'], $v['name'] );?></h3></li>
									<?php endif;
									endforeach;
								endif;?>
					</ul>
				</li>
				<li class="col-sm-8">
					<?php $img = array( 'src'=>'images/page_banners/HTC-Desire-510.png', 'class'=>'img-responsive' );
						echo anchor( 'https://www.zimall.co.zw/warehouse/products/1308/htc-desire-510.html', img($img) );
					?>
				</li>
			</ul>
		</li>
		<li class="dropdown yamm-fw">
			<?php echo anchor('shop/overview/3/computers-printers-accessories','Computers, Printers <br>&amp; Accessories <span class="caret"></span>', 
			'class="dropdown-toggle" data-toggle="dropdown"');?>
			<ul class="dropdown-menu menu-6">
				<li class="col-sm-4">
				<br clear="all">
					<h2><?php echo anchor( 'shop/overview/3/computers-printers-accessories', 'Computers, Printers &amp; Accessories' );?></h2>
					<ul>
								<?php if(isset($topmenu[3]['l'])):
									$l = $topmenu[3]['l']; $r = $topmenu[3]['r'];
									foreach($menulist as $k=>$v):
										if( $v['l']>$l && $v['r']<$r && $v['level']==2 ):?>
											<li><h3><?php echo anchor( 'shop/categories/'.$v['id'].'/'.$v['segment'], $v['name'] );?></h3></li>
									<?php endif;
									endforeach;
								endif;?>
					</ul>
				</li>
				<li class="col-sm-8">
					<?php $img = array( 'src'=>'images/page_banners/lenovo-g5030.png', 'class'=>'img-responsive' );
						echo anchor( 'https://www.zimall.co.zw/warehouse/products/1042/lenovo-ideapad-g5030.html', img($img) );
					?>
				</li>
			</ul>
		</li>
		<li><?php echo 
			anchor('shop/overview/30-31/home-office-equipment','Home &amp; Office<br>Equipment')?>
		</li>
		<li><?php echo 
			anchor('shop/overview/36/clothing-shoes-bags','Clothing, Shoes <br>&amp; Bags')?>
		</li>
		<li class="dropdown yamm-fw">
			<?php echo anchor('shop/overview/4/electronics-home-appliances',
				'Electronics &amp;<br>Appliances <span class="caret"></span>', 
				'class="dropdown-toggle" data-toggle="dropdown"');?>
			<ul class="dropdown-menu menu-6">
				<li class="col-sm-4">
				<br clear="all">
					<h2><?php echo anchor( 'shop/overview/4/electronics-home-appliances', 'Electronics &amp; Home Appliances' );?></h2>
					<ul>
								<?php if(isset($topmenu[4]['l'])):
									$l = $topmenu[4]['l']; $r = $topmenu[4]['r'];
									foreach($menulist as $k=>$v):
										if( $v['l']>$l && $v['r']<$r && $v['level']==2 ):?>
											<li><h3><?php echo anchor( 'shop/categories/'.$v['id'].'/'.$v['segment'], $v['name'] );?></h3></li>
									<?php endif;
									endforeach;
								endif;?>
					</ul>
				</li>
				<li class="col-sm-8">
					<?php $img = array( 'src'=>'images/page_banners/nikon-d5300-hero-banner.png', 'class'=>'img-responsive' );
						echo anchor( 'https://www.zimall.co.zw/warehouse/products/1449/nikon-d5300-digital-slr-camera.html', img($img) );
					?>
				</li>
			</ul>
		</li>
		<li class="dropdown">
			<?php echo anchor( 'blog', 'Blog, Reviews<br>& Testimonials <span class="caret"></span>', 
				'class="dropdown-toggle" data-toggle="dropdown"' );?>
			<ul class="dropdown-menu" style="margin-top:10px;margin-left:-15px;">
				<li>
					<?php echo anchor( 'blog', 'The Zimall Blog' );?>
				</li>
				<li>
					<?php echo anchor( 'reviews/product', 'Product Reviews' );?>
				</li>
				<li>
					<?php echo anchor( 'reviews/shop', 'Customer Feedback' );?>
				</li>
			</ul>
		</li>
	</ul>
</nav> <!-- end of navbar -->
