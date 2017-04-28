<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if( !empty($b_960x160) ):?>
<div class="row">
	<?php if(isset($this->data['br'])) echo br($this->data['br'],1);?>
	<div class="">
		<div class="flexslider">
			<ul class="slides"><?php
			foreach($b_960x160 as $i=>$f):
				$att = array( 'target'=>$f['target'] );
				$img = array( 'src'=>'images/shop_banners/'.$f['size'].'/'.$f['image'], 
					'style'=>'max-height:160px; max-width:960px', 'alt'=>$f['description'] );?>	
				<li><?php echo anchor( $f['href'], img($img), $att );?></li>
			<?php endforeach;?>
			</ul>
		</div><!--end flexslider-->
	</div><!--end span12-->
</div><!--end row-->
<?php endif;?>
