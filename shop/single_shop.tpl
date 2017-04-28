<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<li class="col-sm-3 clearfix">
	<div class="thumbnail">
		<?php $img = array( 'src'=>'images/products/210x120/'.$f['image'] ); echo anchor( $link, img($img) );?>
	</div>

	<div class="thumbSetting">
						
		<div class="thumbTitle">
			<?php echo anchor( $link, character_limiter($f['name'], 30),
			'class="invarseColor" style="margin-bottom:0;display:block;"');?>
			<small style="line-height:15px;position:relative;top:-5px;"><?php echo $ns;?> different shops</small>
		</div>
						
		<div class="thumbPrice" style="margin-top:-5px;">
			<span>from <?php echo toc( $f['price'] )?></span>
		</div>

		<div class="thumbButtons">
			<?php echo anchor( $link, '<span class="glyphicon glyphicon-star"></span>&nbsp;View Offers', 
			'class="btn btn-primary btn-xs"' );?>
		</div>
						
		<div class="rating_cont">
			<div class="rating small" data-role="rating" data-param-rating="<?php echo $f['rating'];?>" 
				data-param-vote="off"></div>
		</div>
						
	</div><!-- end of thumbSetting-->
				
</li>
