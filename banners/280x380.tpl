<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if( !empty($b_280x380) ):?>
	<?php if(isset($this->data['br'])) echo br($this->data['br'],1);?>
	<div style="padding-left:0;padding-right:0; margin-bottom:20px;">
		<div class="flexslider">
			<ul class="slides"><?php
			foreach($b_280x380 as $i=>$f):
				$att = array( 'target'=>$f['target'] );
				$img = array( 'src'=>'images/shop_banners/'.$f['size'].'/'.$f['image'], 
					'style'=>'max-width:300', 'alt'=>$f['description'], 'class'=>'img-responsive' );?>	
				<li><?php echo anchor( $f['href'], img($img), $att );?></li>
			<?php endforeach;?>
			</ul>
		</div><!--end flexslider-->
	</div><!--end span12-->
<?php endif;?>
