<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<li class="col-sm-3 clearfix" style="margin-right:0;">
	<div class="thumbnail" style="position:relative;">
		<?php $img = array( 'src'=>'images/products/210x120/'.$f['image'] );
			echo anchor( $link, img($img) );
			if($shop['shipping'] && $shop['shipping_cost']>0):?>
				<span class="free-shipping-red"></span>
			<?php endif;?>
	</div>

	<div class="thumbSetting">
		<div class="thumbTitle">
			<?php echo anchor( $link, character_limiter($f['name'], 30),
				'class="invarseColor" style="margin-bottom:0;display:block;"');?>
			<small style="line-height:15px;position:relative;top:-5px;">
				<?php echo character_limiter($shop['name'], 50);?>
			</small>
		</div>

		<div class="thumbPrice" style="margin-top: -5px;">
			<span>
				<?php if( $shop['old_price'] > $f['price'] ):;?>
					<span class="strike-through"><?php echo toc( $shop['old_price'] )?></span>
				<?php endif;
				if($shop['download'] && $f['price']==0) echo 'FREE';
					else echo toc( $f['price'] );?>
			</span>
		</div>

		<div class="thumbButtons">
			<?php if($shop['download']) $btn='<span class="glyphicon glyphicon-download-alt"></span>&nbsp;Download';
			else $btn='<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Buy&nbsp;Now';
			echo  anchor($link, $btn, 'class="btn btn-primary btn-xs"' );?>
		</div>

		<div class="rating_cont">
			<div class="rating small" data-role="rating" data-param-rating="<?php echo $f['rating'];?>" 
				data-param-vote="off"></div>
		</div>

	</div><!-- end of thumbSetting-->

</li>
