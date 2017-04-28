<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-3">

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
					if($f['permalink']) $link = $f['company_segment']."/products/{$f['id']}/{$f['segment']}";
					else $link = "shops/{$f['company_id']}/{$f['company_segment']}/products/{$f['id']}/{$f['segment']}";
					//$link = "shop/products/{$f['id']}/{$f['segment']}";?>
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
</div>




	<!-- MODULE Block blockleoblogstabs -->
<div id="blockleoblogstabs" class="block blogs_block blockleoblogs nopadding">
	<h3 class="title_block">
		<span>
			<?php echo anchor( base_url('blog.php'), 'Latest Blogs', 'class="invarseColor"' );?>
		</span>
	</h3>
	<div class="block_content">
		<div id="blockleoblogs" class="carousel slide">
			<div class="carousel-controls">
			 	<a class="carousel-control left" href="#blockleoblogs"   data-slide="prev">&lsaquo;</a>
				<a class="carousel-control right" href="#blockleoblogs"  data-slide="next">&rsaquo;</a>
			</div>
			<div class="carousel-inner">
				<div class="item active">
					<?php foreach($recent_blogs as $k=>$v):
						$segment = url_title($v['title'], '-', TRUE );
						$link = "blog/read/{$v['id']}/$segment";
					?>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 blog_block ajax_block_blog">
							<div class="blog_container clearfix">
								<div class="blog-image">
									<a href="<?php echo site_url($link);?>" title="<?php echo $v['title']?>">
										<?php if(file_exists("images/articles/{$v['image']}")):
											echo img( array( 'src'=>"images/articles/280x160/{$v['image']}", 
												'alt'=>$v['title'],'class'=>'img-responsive' ));
										else:
											echo img( array( 
												'src'=>'images/zimall-asset-260x180.jpg',
												'alt'=>$v['title'], 'class'=>'img-responsive'));
										endif;?>
									</a>
								</div>
								<div class="create-date label label-info pull-left">
									<span class="blog-created ">
										<span><?php echo date('d',$v['date_posted'])?></span><?php echo date('M',$v['date_posted']);?>
									</span>
								</div>
								<div class="blog-content">
									<h5 class="blog-title">
										<a href="<?php echo site_url($link)?>" title="<?php echo $v['title']?>">
											<?php echo $v['title']?>
										</a>
									</h5>
									<div class="blog-meta"></div>
									<div class="blog-shortinfo">
										<div class="blog-shortinfo">
											<?php echo character_limiter( strip_tags( 
												html_entity_decode( $v['summary'], ENT_QUOTES ) ), 80 );?>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><!-- row -->
					<?php endforeach;?>
				</div><!-- item -->
			</div><!-- carousel-inner -->
		</div><!-- #blogleoblogs -->
	</div><!-- block_content -->
</div>
	
</section> <!-- end of span4 -->
