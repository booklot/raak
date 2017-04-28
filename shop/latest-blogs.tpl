<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
	<!-- MODULE Block blockleoblogstabs -->
<div class="blogs_block nopadding hidden-xs">
	<h3 class="title_block">
		<span>
			<?php echo anchor( site_url('blog'), 'Latest Blogs', 'class="invarseColor"' );?>
		</span>
	</h3>
	<div class="block_content">
		<div id="blockleoblogs" class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<?php foreach($recent_blogs as $k=>$v):
						$segment = url_title($v['title'], '-', TRUE );
						$link = "blog/article/{$v['id']}/$segment";
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
