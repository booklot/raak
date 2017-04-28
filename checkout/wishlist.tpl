<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<div class="col-sm-3">
	<div class="block block-default">
		<h4 class="title_block">
			<?php echo anchor('wishlist','My Wishlists')?>
		</h4>
		<div class="wishlist">
			<ul class="list-group">
				<?php foreach($lists as $k=>$v):?>
					<li class="list-group-item">
						<a style="display:block" href="<?php echo site_url('wishlist/'.$k)?>">
							<h4>
								<?php echo $v['name'];?>
								<span class="badge pull-right"><?php echo $v['count']?></span>
							</h4>
						</a>
					</li>
				<?php endforeach;?>
			</ul>
		</div>
	</div>
	
	<?php $this->load->view("$theme/shop/hot-deals.tpl");?>
	
</div>


<?php 
	if(empty($wishlist))
	{	
		$data = $list;
		$list_id = '';
	}
	else
	{
		$data = $wishlist['items'];
		$list_id = $wishlist['id'];
	}

?>

			<div class="col-sm-9">
			
				<div class="block block-info">
					<h4 class="title_block">
						<span> <?php if(isset($wishlist['name'])) echo $wishlist['name']; else echo 'My Wishlist';?> </span>
					</h4>

					<ul class="grid products-block row" style="overflow-x:hidden">
					<?php foreach($data as $k=>$f):
						if($f['shop_id']>0):
							if($f['permalink']) $link = $f['company_segment']."/products/{$f['product_id']}/{$f['segment']}";
							else $link = "shops/{$f['company_id']}/{$f['company_segment']}/products/{$f['product_id']}/{$f['segment']}";
						else:
							$link = "shop/products/{$f['product_id']}/{$f['segment']}";
						endif;
					?>
						<li class="wishlist row last-item-of-tablet-line">
							<div class="col-sm-3 product-block" style="margin-top:0;">
								<?php 
									$img = array( 
										'src'=>'images/products/280x160/'.$f['image'], 
										'class'=>'img-responsive' );
									echo anchor( $link, img($img) );
								?>
							</div>
							<div class="col-sm-9">
								<h4>
									<?php echo anchor( $link, $f['name'], 'class="invarseColor"' );?>
								</h4>
								<p>
									<?php if(strlen($f['summary'])>10) echo $f['summary']; else echo $f['d_summary'];?>
								</p>
								<div class="content_price price">
									<?php if($f['old_price']>$f['price']):?>
										<span class="old-price product-price"><?php echo toc($f['old_price'])?></span>
									<?php endif;?>
									<span class="product-price"><?php echo toc($f['price'])?></span>
								</div>
								<hr />
								
								<div class="col-sm-4">
									<div class="rating_cont" style="width: 50%;display:inline-block">
										<div class="rating small" data-role="rating" 
											data-param-rating="<?php echo $f['rating'];?>" data-param-vote="off">
										</div>
									</div>
									<!-- 
									<span class="nb-comments pull-right">
				            			<span itemprop="reviewCount">1</span> Review(s)
				            		</span>
				            		-->
				            	</div><!-- comments_note -->
								<div class="col-sm-6">
									
									<div class="btn-group btn-group-xs">
										<?php 
											echo anchor( $link, '<i class="fa fa-shopping-cart"></i>&nbsp;Buy Now', 
					            				'class="btn btn-primary"' );
											echo anchor( "shopping_cart/remove_wishlist_item/{$f['id']}/$list_id", 
												'<span class="glyphicon glyphicon-trash"></span>', 
												'class="btn btn-danger" title="remove from list" rel="tooltip"' );
										?>
									</div>
								</div>
								<div class="visible-xs">
									<br clear="all">
								</div>
							</div>
						</li>
					<?php endforeach;?>
					</div>
				</div><!-- blok info -->
				
			</div> <! col-sm-12 -->


			<br clear="all">
			<div class="raw">
				<?php $this->load->view( $theme.'/shop/recently-viewed.tpl' );?>
			</div><!-- container -->

