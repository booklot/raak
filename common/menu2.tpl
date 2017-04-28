<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<ul class="nav navbar-nav dropdown" id="main-menu-remove">
	<?php $a = array( 'style'=>'font-size:16px;vertical-align:middle;display:table-cell;padding-left:2px;',
		'title'=>'Home' );?>
	<li><?php echo anchor(base_url(),'<span class="glyphicon glyphicon-home"></span>', $a);?></li>
	<li>
		<?php echo anchor('shop/overview/1/all-categories','All<br>Categories');?>
		
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
			<li role="presentation" class="divider"></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
		</ul>
		
	</li>
	<li>
		<?php echo anchor('shop/overview/8/books','Books &amp;<br>Magazines')?>
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
			<li role="presentation" class="divider"></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
		</ul>
	</li>
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
		anchor('shop/overview/86/groceries-fresh-produce','Groceries &amp;<br>Fresh Produce')?>
	</li>
</ul>
