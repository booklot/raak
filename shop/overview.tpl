<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="col-md-3">
	<div class="sidebar">
		<?php $this->load->view("$theme/shop/main-side.tpl")?>
	</div>
</div>

<div class="col-md-9">
	<?php
		foreach( $categori as $categorized ):
			if(!empty($categorized)):
				$color='white';
				foreach( $categorized as $k=>$c ):
					$products = $c['products'];
					$n = count($products);
					if( $color == 'white' ) $color='#fff;';
					else $color='white';
					$block = 1;
	?>

					<div class="row">
						<div class="col-sm-12">
							<div class="featuredItems">
								<div class="titleHeader clearfix">
									<?php $clink = "shop/categories/{$c['id']}/{$c['segment']}"?>
									<h3><?php echo anchor( $clink, $c['name'] )?></h3>
									<div class="pagers">
										<div class="btn-toolbar">
											<?php echo anchor( $clink, 'View All', 'class="btn btn-sm btn-default"' );?>
										</div>

										<div class="myCarousel-controls hidden-xs">
											<a class="left btn btn-default btn-sm hidden-xs" href="#myCarousel<?php echo $k;?>" data-slide="prev">
												<span class="glyphicon glyphicon-chevron-left"></span>
											</a>
											<a class="right btn btn-default btn-sm hidden-xs" href="#myCarousel<?php echo $k;?>" data-slide="next">
												<span class="glyphicon glyphicon-chevron-right"></span>
											</a>
										</div>
										<!-- carousel controls -->
										
									</div>
								</div>
								<!--end titleHeader-->
			
								<div id="myCarousel<?php echo $k?>" class="carousel slide home-carousel" 
										style="padding:0;border:none;width:100%;box-shadow:none;">
										<?php $slides = ceil( count( $products )/4 );?>
											<!-- <ol class="carousel-indicators">
													<?php for($x=0; $x<$slides;$x++ ):
														if($x==0) $active = 'active'; else $active = '';
													?>
													<li data-target="#myCarousel<?php echo $k?>" data-slide-to="<?php echo $x?>" class="<?php echo $active?>"></li>
													<?php endfor;?>
												</ol>
											-->

										<ul class="hProductItems clearfix">
											<div class="carousel-inner" data-interval="false">
												<?php foreach($products as $i=>$f):
													//if($f['permalink']) $link = $f['company_segment']."/products/{$f['id']}/{$f['segment']}";
													$link = "shop/products/{$f['id']}/{$f['segment']}";
													if($i==0) $active = ' active'; else $active = '';
													if( $i%4==0 ):?>
														<div class="item<?php echo $active;?>">
																<?php endif;?>
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
																					echo anchor( $wish, '<i class="glyphicon glyphicon-heart"></i>&nbsp;Add&nbsp;To&nbsp;Wishlist',
																						'class="btn-default btn addToWishlist wishlistProd_8" title="Add to Wishlist" rel="tooltip"' );
																				?>
																			</div>
																		</div>
																		
																	</div>
																	<!-- end of thumbSetting -->
																</li>
																<!-- list item -->
																<?php if( ( ($i+1)>0 &&($i+1)%4==0) || ( $n==($i+1) && ($i+1)%4!=0 ) ):?>
															<!--end of row'.(int)(($i/4)+1).'-->
														</div>
														<!-- item -->
												<?php endif; endforeach;?>
											</div>
											<!-- end of corousel inner-->
										</ul>
										<!-- hProductItems -->
									</div>
									<!-- end of carousel slide -->
								<!-- end of col-sm-12 -->
			
							</div>
							<!-- end of featured-items-->
							<hr />
						</div>
						<!-- end of span12-->
					</div>
					<!-- end of row-->
				<?php endforeach;
			endif;?> <!-- end of FEATURED ITEMS-->
		<?php endforeach;?>
</div>
