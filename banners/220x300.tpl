<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if( !empty($b_220x300) ):?>
	<?php if(isset($this->data['br'])) echo br($this->data['br'],1);?>
	<div class="">
		<div class="flexslider">
			<ul class="slides"><?php
			foreach($b_220x300 as $i=>$f):
				$att = array( 'target'=>$f['target'] );
				$img = array( 'src'=>'images/shop_banners/'.$f['size'].'/'.$f['image'], 
					'style'=>'max-height:300px; max-width:220px', 'alt'=>$f['description'] );?>	
				<li><?php echo anchor( $f['href'], img($img), $att );?></li>
			<?php endforeach;?>
			</ul>
		</div><!--end flexslider-->
	</div><!--end span12-->
<?php endif;?>
