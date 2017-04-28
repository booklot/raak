<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="row">
<?php
	$span12 = array();
	foreach( $banners as $k=>$b):
		if( isset( $b['images']['960x300'] ) ):
			$image = $b['images']['960x300'];
			$image['description'] = $b['description'];
			$image['href'] = $b['href'];
			$span12[] = $image;
		endif;
	endforeach;
		
	if( !empty($span12) ):?>

	<div class="">
		<div class="flexslider">
			<ul class="slides"><?php
			foreach($span12 as $i=>$f):
				$img = array( 'src'=>'images/shop_banners/'.$f['size'].'/'.$f['image'], 
					'style'=>'max-height:300px; max-width:960px', 'alt'=>$f['description'] );?>	
				<li><?php echo anchor( $f['href'], img($img) );?>
					<!--
					<div class="flex-caption">
						<p>A short but descriptive paragraph</p>
					</div>
					-->
				</li>
			<?php endforeach;?>
			</ul>
		</div><!--end flexslider-->
	</div><!--end span12-->

	<?php elseif(!empty($featured)):?>

	<div class="">
		<div class="flexslider">
			<ul class="slides">
			<?php  $prod = $featured; shuffle($prod); $chunk = array_slice($prod, 0, 4);
			foreach($chunk as $i=>$f):
				$img = array( 'src'=>'images/products/'.$f['image'], 'style'=>'max-height:300px; max-width:600px', 'alt'=>$f['name'] );?>	
				<li><?php echo anchor( 'shop/products/'.$f['id'].'/'.$f['segment'], img($img) );?></li>
			<?php endforeach;?>
			</ul>
		</div><!--end flexslider-->
	</div><!--end span8-->

<?php endif;?>
</div><!--end row-->
