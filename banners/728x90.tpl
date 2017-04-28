<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if( !empty($b_728x90) ):?>
	<?php if(isset($this->data['br'])) echo br($this->data['br'],1);?>
	<div class="">
		<div class="flexslider">
			<ul class="slides"><?php
			foreach($b_728x90 as $i=>$f):
				$att = array( 'target'=>$f['target'] );
				$img = array( 'src'=>'images/shop_banners/'.$f['size'].'/'.$f['image'], 
					'class'=>'img-resposive', 'alt'=>$f['description'] );?>	
				<li><?php echo anchor( $f['href'], img($img), $att );?></li>
			<?php endforeach;?>
			</ul>
		</div><!--end flexslider-->
	</div><!--end span12-->
<?php endif;?>
