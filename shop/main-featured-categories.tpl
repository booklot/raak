<?php defined('BASEPATH') OR exit('No direct script access allowed');
$color='white';
$products = $c['products'];
$view = $c['view'];
$n = count($products);
if( $color == 'white' ) $color='#fff;';
else $color='white';
$block = 1;
$clink = "shop/$view/{$c['id']}/{$c['segment']}"
?>
<div class="featuredItems">
	<div class="titleHeader clearfix">
		<h3>
			<?php echo anchor( $clink, $c['name'] )?>
		</h3>
		<div class="pagers">
			<div class="btn-toolbar">
				<?php echo anchor( $clink, 'View All', 'class="btn btn-sm btn-default"' );?>
			</div>

			<div class="myCarousel-controls hidden-xs">
				<a class="left btn btn-default btn-sm hidden-xs" href="#myCarousel<?php echo $c['id'];?>" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				<a class="right btn btn-default btn-sm hidden-xs" href="#myCarousel<?php echo $c['id'];?>" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
			<!-- carousel controls -->
		</div>
	</div>
								<!--end titleHeader-->
	<div id="myCarousel<?php echo $c['id'];?>" class="slide carousel boxcarousel products_block">
			
			<div class="carousel-inner" style="overflow: hidden;">
				<?php foreach($products as $i=>$block):?>
				<div class="item <?php if($i==0) echo 'active';?>">
					<ul class="hProductItems clearfix">
						<?php foreach($block as $k=>$f):
							//if($f['permalink']) $link = $f['company_segment']."/products/{$f['id']}/{$f['segment']}";
							//else $link = "shops/{$f['company_id']}/{$f['company_segment']}/products/{$f['id']}/{$f['segment']}";
							$link = "{$f['id']}/{$f['segment']}";
							$z = $k+1;
							if( $k%4==0 ) $c='first-in-line first-item-of-tablet-line first-item-of-mobile-line '.$z;
							elseif( ($k-1)%4==0 ) $c = 'last-item-of-tablet-line last-item-of-mobile-line '.$z;
							elseif( ($k-2)%4==0 ) $c='first-item-of-tablet-line first-item-of-mobile-line '.$z;
							elseif( ($k-3)%4==0 ) $c='last-in-line last-item-of-tablet-line last-item-of-mobile-line '.$z;
							//else $c='first-item-of-tablet-line first-item-of-mobile-line '.$l;
						?>
						<li class="col-sm-3 clearfix">
							<div class="fixed-thumb" style="position:relative;">
								<?php //$img = array( 'src'=>'images/products/210x120/'.$f['image'] );
									$img = array( 'src'=>'images/products/150x210/'.$f['image'], 'class'=>"thumbnail", 
									'alt'=>$f['name'] );
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
											$w = site_url("shopping_cart/add_to_wishlist/{$f['id']}/{$f['company_id']}").
												'?r='.uri_string();
											//echo anchor($w,
											//	'<i class="glyphicon glyphicon-heart"></i>&nbsp;Add&nbsp;To&nbsp;Wishlist',
											//	'class="btn-default btn addToWishlist wishlistProd_8" title="Add to Wishlist" 
											//	rel="tooltip"' );
										?>
									</div>
								</div>
							</div>
							<!-- end of thumbSetting -->
						</li>
						<!-- list item -->
						<?php endforeach;?>
					</ul> <!-- grid products-bloc-row -->
				</div><!-- item -->
				<?php endforeach;?>
			</div><!-- carousel-inner -->
		</div>
</div>
