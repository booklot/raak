<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<ul class="hProductItems grid">
	
	<?php foreach( $products as $k=>$f ):
		$link = "{$f['id']}/{$f['segment']}";
	?>
		<li class="col-sm-3 clearfix">
			<div class="fixed-thumb" style="position:relative;">
				<?php $img = array( 'src'=>'images/products/150x210/'.$f['image'], 'class'=>"thumbnail", 'alt'=>$f['name'] );
					echo anchor( $link, cdn($img) );
					if($f['shipping'] && $f['shipping_cost']>0):
				?>
					<span class="free-shipping-red"></span>
				<?php endif;?>
			</div>
			<div class="thumbSetting">
				<div class="thumbTitle">
					<?php echo anchor( $link, character_limiter($f['name'], 30), 'class="invarseColor" title="'.$f['name'].'"');?>
					<small><?php echo character_limiter($f['var1'], 50);?></small>
				</div>

				<div class="rating_count">
					<?php if($f['rating']>0):?>
						<div class="rating small" data-role="rating" 
							data-param-rating="<?php echo $f['rating'];?>" data-param-vote="off">
						</div>
					<?php else:?>
						<small disabled>(no reviews)</small>
					<?php endif;?>
				</div>

				<div class="thumbPrice">
					<span>
						<?php if( $f['old_price'] > $f['price'] ):?>
							<span class="strike-through"><?php echo toc( $f['old_price'] )?></span>
						<?php endif;?>
						<?php if($f['price']==0) echo 'FREE'; else echo toc( $f['price'] );?>
					</span>
				</div>
				<div class="thumbButtons">
					<div class="btn-group btn-group-sm">
						<?php
							echo anchor( $link,
								'<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Buy&nbsp;Now',
								'class="btn btn-danger"');
							$wish = site_url("shopping_cart/add_to_wishlist/{$f['id']}/{$f['company_id']}").'?r='.uri_string();
							//echo anchor( $wish, '<i class="glyphicon glyphicon-heart"></i>',
							//	'class="btn-default btn addToWishlist wishlistProd_8" title="Add to Wishlist" rel="tooltip"' );
							$compare = site_url("shopping_cart/add_to_compare/{$f['id']}/{$f['company_id']}").'?r='.uri_string();
							//echo anchor( $compare, '<i class="glyphicon glyphicon-retweet"></i>', 
							//	'class="btn-default btn add_to_compare" title="Compare" data-title="Compare" rel="tooltip"' );
						?>
					</div>
				</div>
				
			</div>
			<!-- end of thumbSetting -->
		</li>
		<!-- list item -->
	<?php endforeach;?>
</ul> <!-- grid products-bloc-row -->

