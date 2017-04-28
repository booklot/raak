<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
$color='white';
$block = 1;
$prd = array();
	foreach( $recently_viewed as $f )
	{
		$s = $f['shops'];
		$ns = count($s);
		if( $ns>=1 && isset( $s[0]['id'] ) )
			$prd[] = $f;
	}
$n = count($prd);
if($n>0):
?>




<div id="ptsproductcountdown" class="block products_block ptsproductcountdown highlighted block-danger nopadding">
	<h4 class="title_block">
		<?php echo anchor( 'shop/special', 'Hot Deals' );?>
	</h4>
	<div class="block_content hProductItems" style="">
		<div id="ptsproductcountdown_left" class="boxcarousel carousel slide">
			<div class="carousel-controls">
			 	<a class="carousel-control left" href="#ptsproductcountdown_left" data-slide="prev">&lt;</a>
				<a class="carousel-control right" href="#ptsproductcountdown_left" data-slide="next">&gt;</a>
			</div>
			
			<div class="carousel-inner" style="overflow: hidden;">
				<?php foreach($special as $i=>$f):
				$link = "shop/products/{$f['id']}/{$f['segment']}";?>
				<div class="item <?php if($i==0) echo 'active';?> thumbnail noborder">
					<?php $img=array('src'=>"images/products/280x160/{$f['image']}",'class'=>'replace-2x img-responsive pts-image', 
						'alt'=>$f['name'], 'title'=>$f['name'], 'itemprop'=>'image' );
						echo anchor( $link, img( $img ), 'class="img product_img_link" title="'.$f['name'].'" itemprop="url"' );?>
					<div class="caption thumbSetting">
						<h3 class="thumbTitle" itemprop="name" style="text-align:center;">
							<?php echo anchor( $link, $f['name'], 
							'class="invarseColor" title="'.$f['name'].'" itemprop="url"' );?>
						</h3>
						<p class="product-desc description" itemprop="description" style="text-align:center">
							<?php echo character_limiter( $f['summary']?$f['summary']:$f['d_summary'], 100 );?>
						</p>
						<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer" class="thumbPrice" 
							style="text-align:center">
							<span><span class="strike-through"><?php echo toc($f['old_price'])?></span></span>
							<span itemprop="price" class="product-price"><?php echo toc($f['price'])?></span>
							<meta itemprop="priceCurrency" content="USD">
							<span><span class="price-percent-reduction">-<?php echo (int)($f['disc']*100);?><small>%</small></span></span>
						</div>
					</div> <!-- thumbSetting -->
				</div><!-- thumbnail -->
				<?php endforeach;?>
			</div><!-- carousel-inner -->
		</div>
	</div>








	<div class="col-sm-12" style="background-color:<?php echo $color;?>">
		<div class="featuredItems">
			
			<div class="row myCarousel-row hidden-xs">
				<div class="myCarousel-control col-sm-1">
					<div class="myCarousel-control pull-left">
						<a class="left carousel-control hidden-xs" href="#myCarouselx" data-slide="prev"></a>
					</div>
				</div>
				<div class="col-sm-10"></div>
				<div class="myCarousel-control col-sm-1">
					<div class="myCarousel-control pull-right">
						<a class="right carousel-control hidden-xs" href="#myCarouselx" data-slide="next"></a>
					</div>
				</div>
			</div>
			
			<div class="col-sm-12">
			
				<div id="myCarouselx" class="carousel slide home-carousel" 
					style="padding:0;border:none;width:100%;box-shadow:none;">
					<?php $slides = ceil( count( $prd)/4 );?>
					<ul class="hProductItems clearfix">
						<div class="carousel-inner" data-interval="false">
							<?php foreach($prd as $i=>$f):
								$s = $f['shops']; $ns = count($s);
								
								if($i==0) $active = ' active'; else $active = '';
								if( $i%4==0 ) echo '<div class="item'.$active.'"><div class="row">';
								if( $ns==1 && isset( $s[0]['id'] ) ):
									$shop = $s[0];
									if($shop['permalink']) $link = $shop['segment']."/products/{$f['id']}/{$f['segment']}";
									else $link = "shops/{$shop['id']}/{$shop['segment']}/products/{$f['id']}/{$f['segment']}";
									
									$this->load->view("$theme/shop/multiple_shops.tpl", array( 'f'=>$f, 'ns'=>$ns, 's'=>$s, 'link'=>$link, 'shop'=>$shop ));
								else:
									$link = "shop/products/{$f['id']}/{$f['segment']}";
									
									$this->load->view("$theme/shop/single_shop.tpl", array( 'f'=>$f, 'ns'=>$ns, 's'=>$s, 'link'=>$link ));
								endif;
								
								if( ( ($i+1)>0 && ($i+1)%4==0) || ( $n==($i+1) && ($i+1)%4!=0 ) ) echo '</div><!--end of row'.(int)(($i/4)+1).'--></div><!-- end of item -->';
								
							endforeach;?>
						</div><!-- end of corousel inner-->
					</ul> <!-- end of hProductItems -->

				</div><!-- end of carousel slide -->

			</div><!-- end of col-sm-12 -->
			
		</div><!-- end of featured-items-->
	</div><!-- end of span12-->
</div><!-- end of row-->
<?php else: echo "no recently viewed items;";
endif;?>
<br clear="all"><br clear="all"><br clear="all">
