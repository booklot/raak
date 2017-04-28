<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if( !empty($b_620x300) ):?>
	<?php if(isset($this->data['br'])) echo br($this->data['br'],1);?>
	<div class="col-sm-8">
		<div class="flexslider">
			<ul class="slides"><?php
			foreach($b_620x300 as $i=>$f):
				$att = array( 'target'=>$f['target'] );
				$img = array( 'src'=>'images/shop_banners/'.$f['size'].'/'.$f['image'], 
					'style'=>'max-height:300px; max-width:620px', 'alt'=>$f['description'] );?>	
				<li><?php echo anchor( $f['href'], img($img), $att );?></li>
			<?php endforeach;?>
			</ul>
		</div><!--end flexslider-->
	</div><!--end span8-->

<?php else:?>
	<div class="col-sm-8">
		<div class="flexslider">
			<ul class="slides">
			<?php  $prod = $featured; shuffle($prod); $chunk = array_slice($prod, 0, 4);
			foreach($chunk as $i=>$f):
				$img = array( 'src'=>'images/products/'.$f['image'], 'style'=>'max-height:300px; max-width:620px', 'alt'=>$f['name'] );?>	
				<li><?php echo anchor( 'shop/products/'.$f['id'].'/'.$f['segment'], img($img) );?></li>
			<?php endforeach;?>
			</ul>
		</div><!--end flexslider-->
	</div><!--end span8-->

<?php endif;?>
