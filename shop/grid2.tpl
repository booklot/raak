<?php defined('BASEPATH') OR exit('No direct script access allowed');
$prd = array();
foreach( $products as $f )
{
	$s = $f['shops'];
	$ns = count($s);
	if( $ns>=1 && isset( $s[0]['id'] ) )
		$prd[] = $f;
}
?>
<ul class="hProductItems grid">
	
	<?php foreach( $prd as $k=>$f ):
		$s = $f['shops'];
		$ns = count($s);
		$n = count($prd);
		if( $ns==1 && isset( $s[0]['id'] ) ):
			$shop = $s[0];
			if($shop['permalink']) $link = $shop['segment']."/products/{$f['id']}/{$f['segment']}";
			else $link = "shops/{$shop['id']}/{$shop['segment']}/products/{$f['id']}/{$f['segment']}";
		else: 
			$link = "shop/products/{$f['id']}/{$f['segment']}";
			$shop = array( 'old_price'=>0, 'price'=>$f['price'], 'shipping_cost'=>0, 'shipping'=>FALSE, 'id'=>0 );
		endif;
		$link = "{$f['id']}/{$f['segment']}";
	?>
		<li class="col-sm-3 clearfix">
			<div class="fixed-thumb" style="position:relative;">
				<?php $img = array( 'src'=>'images/products/150x210/'.$f['image'], 'class'=>"thumbnail", 
									'alt'=>$f['name'] );
					echo anchor( $link, cdn($img) );
					if($shop['shipping'] && $shop['shipping_cost']>0):
				?>
					<span class="free-shipping-red"></span>
				<?php endif; if($shop['quantity']<1):?>
					<span class="product-label outofstock">out of stock</span>
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
						<?php if( $shop['old_price'] > $shop['price'] ):?>
							<span class="strike-through"><?php echo toc( $shop['old_price'] )?></span>
						<?php endif;?>
						<?php if($shop['price']==0) echo 'FREE'; else echo toc( $shop['price'] );?>
					</span>
				</div>
				<div class="thumbButtons">
					<div class="btn-group btn-group-sm">
						<?php
							echo anchor( $link,
								'<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Buy&nbsp;Now',
								'class="btn btn-danger"');
							$wish = site_url("shopping_cart/add_to_wishlist/{$f['id']}/{$shop['id']}").'?r='.uri_string();
							//echo anchor( $wish, '<i class="glyphicon glyphicon-heart"></i>&nbsp;Add&nbsp;to&nbsp;Wishlist',
							//	'class="btn-default btn addToWishlist wishlistProd_8" title="Add to Wishlist" rel="tooltip"' );
						?>
					</div>
				</div>
				
			</div>
			<!-- end of thumbSetting -->
		</li>
		<!-- list item -->
		<?php if( ($k+1)%4 == 0 ) echo '<br clear="all">';?>
	<?php endforeach;?>
</ul> <!-- grid products-bloc-row -->

