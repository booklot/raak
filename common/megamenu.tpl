<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="navbar top-bar-section">
	<ul class="nav navbar-nav" id="menu-main-menu-1">
		<?php $a = array( 'style'=>'font-size:16px;vertical-align:middle;display:table-cell;padding-left:2px;',
			'title'=>'Home' );?>
		<li><?php echo anchor(base_url(),'<span class="glyphicon glyphicon-home"></span>', $a);?></li>
		<li>
			<?php echo anchor('shop/overview/1/all-categories','All<br>Categories <span class="caret"></span>', 'data-toggle="dropdown"');?>
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
						if( ( ($i+1)>0 && ($i+1)%3==0) || ( $n==($i+1) && ($i+1)%3!=0 ) ) echo '<br clear="all"><!--end of row'.(int)(($i/3)+1).'-->';
					endforeach;
				?>
				
			</ul>
			
		</li>
		<li><?php echo anchor('shop/overview/8/books','Books &amp;<br>Magazines')?></li>
		<li><?php echo anchor('shop/overview/64-117/music-movies-games','Music, Movies <br>&amp; Games')?></li>
		<li><?php 
			echo anchor('shop/overview/6/phones-tablets-accessories','Phones, Tablets <br>&amp; Accessories')?>
		</li>
		<li><?php echo 
			anchor('shop/overview/3/computers-printers-accessories','Computers, Printers <br>&amp; Accessories')?>
		</li>
		<li><?php echo 
			anchor('shop/overview/30-31/home-office-equipment','Home &amp; Office<br>Equipment')?>
		</li>
		<li><?php echo 
			anchor('shop/overview/36/clothing-shoes-bags','Clothing, Shoes <br>&amp; Bags')?>
		</li>
		<li><?php echo 
			anchor('shop/overview/4/electronics-home-appliances','Electronics &amp;<br>Home Appliances')?>
		</li>
	</ul>
</div> <!-- end of navbar -->
