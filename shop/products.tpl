<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if(isset($trail)):;?>
<div class="col-lg-12">
	<ul class="breadcrumb">
			<span>You are here:&nbsp;&nbsp;</span>
				<?php 
				echo '<li>'.anchor( base_url(), 'Home' ).'</li>';
				echo '<li>'.anchor( 'shop', 'Shop' ).'</li>';
				echo '<li>'.anchor( 'shop/categories', 'Categories' ).'</li>';
				foreach($trail as $k=>$v):
					if($v['l']>1)
						echo '<li>'.anchor( 'shop/categories/'.$v['id'].'/'.$v['segment'], $v['name'] ).'</li>';
				endforeach;
				echo '<li>'.anchor('shop/categories/'.$category['id'].'/'.$category['segment'], $category['name']).'</li>';
				echo '<li class="active">'.anchor($page['id'].'/'.$page['segment'], $page['name']).'</li>';?>
			
		</ul> <!-- end of breadcrumb -->
</div>
<?php endif;?>



<?php if(isset($view_single)):?>

<div class="col-sm-12" itemscope itemtype="https://schema.org/Product">
		<?php echo form_open( 'shopping_cart/add_to_cart', array( 'class'=>'form' ) );?>
			<div class="product-details container clearfix">
				<div class="col-sm-6">
					<div class="product-img">
					<?php $a = array( 'target'=>'_blank',	'class'=>'fancybox', 'rel'=>'group1', 'title'=>$page['name'] );
						$img = array( 'itemprop'=>'image', 'src'=>'images/products/main/'.$page['image'], 'alt'=>$page['name'] );
						echo anchor( base_url().'images/products/main/'.$page['image'], cdn($img), $a );
					 ?>
					</div><!--end product-img-->
					<div class="product-img-thumb" style="max-height:250px;overflow-y:auto;">
						<?php if( isset($page['images']) ):
					$images = $page['images'];
					$a = array( 'target'=>'_blank',	'class'=>'fancybox', 'rel'=>'group1', 'title'=>$page['name'] );
					if( is_array($images) ):
					foreach( $images as $image ):
						$img = array( 'src'=>'images/products/100x75/'.$image['image'], 'alt'=>$page['name'] );
						echo anchor( base_url().'images/products/main/'.$image['image'], cdn( $img ), $a);
					endforeach;endif;endif;?>
					</div><!--end flexslider-thumb-->
				</div><!--end span4-->
				
				<div class="col-sm-6">
					<div class="product-set">
						<div class="product-title row">
							<h1>
								<span itemprop="name"><?php echo $page['name']?></span>
							</h1>
						</div>
						
						<div class="product-info row">
							<table class="table">
								<tbody>
									<tr>
										<th>Rating:</th>
										<td>
											<div class="product-rate clearfix">
												<div class="rating small" data-role="rating" 
													data-param-rating="<?php echo $page['rating'];?>" 
													data-param-vote="off" style="float:left;margin-top:2px;"></div>
												<div itemprop="aggregateRating" itemscope itemtype="https://schema.org/AggregateRating">
												<meta itemprop="worstRating" content = "1" />
		        				    			<meta itemprop="ratingValue" content="<?php echo round($page['rating'],1);?>" />
						            			<meta itemprop="bestRating" content = "5" />
												<span itemprop="ratingCount"><?php echo $page['reviews'];?></span> 
													Review<?php if( $page['reviews']>1 || $page['reviews']==0 ) echo 's';?>
												</div>
											</div><!--end product-rate-->
										</td>
									</tr>
									<tr>
										<th><?php echo $page['field1']?>:</th>
										<td itemprop="model"><?php echo $page['var1']?></td>
									</tr>
									<tr>
										<th><?php echo $page['field2']?>:</th>
										<td itemprop="brand"><?php echo $page['var2']?></td>
									</tr>
									<?php if(0>1):?>
									<tr>
										<th>Review&nbsp;Points:&nbsp;&nbsp;&nbsp;</th>
										<td><?php if($page['points']>0) echo $page['points']; else echo 0;?> Points</td>
									</tr>
									<?php endif;?>
									<tr>
										<th>ISBN:&nbsp;&nbsp;&nbsp;</th>
										<td><?php if($page['isbn'] && strlen($page['isbn'])>=10 ) echo $page['isbn'];?></td>
									</tr>
									<tr>
										<th>Summary:</th>
										<td itemprop="description"><?php echo character_limiter( $page['d_summary'], 300 );?></td>
									</tr>
								</tbody>
							</table>
							
							<br clear="all"><br clear="all">
							<div class="form-group">	
								<!-- social sharing buttons -->
								<div class="btn-group">
									<button type="button" class="btn btn-small btn-default">
										<i class="radmin-share-2"></i>&nbsp;&nbsp;Share: </button>
									<?php 
										$url = rawurlencode(current_url());
										$text = rawurlencode($page['name']);
										$desc = rawurlencode($page['summary']);
										$media = rawurlencode( base_url("images/products/{$page['image']}") );
										$btn = array( 'class'=>'btn btn-default btn-small share_buttons', 'target'=>'_blank' );
										
										$fb = $this->config->item('facebook_share');
										$fb1 = $fb.'?u='.$url.'&t='.$text;
										$fb1 = $fb.'?s=100&p[url]='.rawurlencode(current_url()).
										'&p[images][0]='.rawurlencode(base_url('images/products/'.$page['image'])).
										'&p[title]='.rawurlencode($page['name']).
										'&p[summary]='.rawurlencode($page['summary']);
										$fb2 = '<i class="radmin-facebook"></i>';
										$btn['style'] = "color:#3f5c9a";
										//$btn['onclick'] = "share_link(this, '$fb1' )";
										$btn['data-link'] = $fb1;
										echo anchor( $fb1, $fb2, $btn );
										
										$tw = $this->config->item('twitter_share');
										$twn = $this->config->item('twitter');
										$tw1 = $tw."?url=$url&text=$text&via=$twn";
										$tw2 = '<i class="radmin-twitter"></i>';
										$btn['style'] = "color:#55acee";
										//$btn['onclick'] = "share_link(this, '$tw1' )";
										$btn['data-link'] = $tw1;
										echo anchor( $tw1, $tw2, $btn );
										
										$gp = $this->config->item('google_share');
										$gp1 = "$gp?url=$url";
										$gp2 = '<i class="radmin-google"></i>';
										$btn['style'] = "color:#dd4b39";
										//$btn['onclick'] = "share_link(this, '$gp1' )";
										$btn['data-link'] = $gp1;
										echo anchor($gp1,$gp2,$btn);
										
										$li = $this->config->item('linkedin_share');
										$li1 = "$li?url=$url&title=$text&summary=$desc";
										$li2 = '<i class="radmin-linkedin"></i>';
										$btn['style'] = "color:#2387bd";
										//$btn['onclick'] = "share_link(this, '$li1' )";
										$btn['data-link'] = $li1;
										echo anchor($li1,$li2,$btn);
										
										$pi = $this->config->item('pinterest_share');
										$pi1 = "$pi?url=$url&description=$desc&media=$media";
										$pi2 = '<i class="radmin-pinterest"></i>';
										$btn['style'] = "color:#cb2027";
										//$btn['onclick'] = "share_link(this, '$pi1' )";
										$btn['data-link'] = $pi1;
										echo anchor($pi1,$pi2,$btn);
										
									?>
								</div>
							</div>
						</div><!--end product-info-->
						
						
						<div class="product-set">
							<div class="clearfix row">
								<br clear="all">
								<h4>Featured Shops</h4>
							</div><!--end titleHeader-->

							<ul class="featured_shops"> 
								<?php
									$normal = array();
									$feat = array();
									$more = array();
									$time = time();
									if(isset($page['shops'])):
									$shops = $page['shops'];
									foreach( $shops as $shop )
									{
										if( $shop['budget']>0 && $shop['from']<=$time && $shop['to']>$time )
										{
											if( count($feat>3) )
											{
												array_unshift( $more, $shop );
											}
											else $feat[] = $shop;
										}
										else $normal[] = $shop;
									}
									foreach( $more as $m )
									{
										array_unshift( $normal, $m );
									}
						
						
									if( empty( $feat ) ) $feat = $normal;
									if( empty( $normal ) ) $normal = $feat;
									foreach( $feat as $k=>$shop ):
								?>
								<li class="col-xs-12 clearfix">
									<!--
									<input type="radio" class="pull-left" id="radio<?php echo $shop['id'];?>" name="shop" 
										value="<?php echo $shop['id'];?>" style="margin: 18px 5px 0 0;"
										<?php if($k==0) echo 'checked';?> required>
									-->
									<div class="thumbImage" style="width:23%;">
										<?php $img = array( 'src'=>'images/company_profiles/100x75/'.$shop['image'], 
											'title'=>'view offer', 'class'=>'img-responsive' );
											if( $shop['permalink'] ) $l = "{$shop['segment']}/products/{$page['id']}/{$page['segment']}";
											else $l = "shops/{$shop['id']}/{$shop['segment']}/products/{$page['id']}/{$page['segment']}";
											echo anchor($l,cdn($img), 'class="thumbnail"' );
										?>									
									</div>
								
									<div class="thumbSetting" style="width:73%;" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
										<div class="thumbTitle" itemprop="seller" itemscope 
											itemtype="http://schema.org/Organization">
											<span itemprop="name" style="font-weight:600;">
												<?php echo anchor( $l, $shop['name'], 'class="invarseColor" itemprop="url"' );?>
											</span>
										</div>

										<div class="thumbPrice">
											<?php $href = site_url($l);?>
											<a style="font-weight:700;font-size:14px;color:#666;text-decoration:none;
												background:#fff;" href="<?php echo $href;?>">
												<?php if($shop['old_price']>$shop['price']):?>
												<span style="text-decoration:line-through;margin-right:5px;color:#aaa;">
													&nbsp;<?php echo toc($shop['old_price']);?>&nbsp;
												</span>
												<?php endif; echo '<span itemprop="price">'.toc( $shop['price'] )?></span>
											</a>
										</div>
										<br>
										<?php
											if($shop['download']) $txt = 'Download'; else $txt = 'Buy Now';
											$atc = "shopping_cart/add_to_cart?product_id={$page['id']}&pq={$shop['min_order']}&shop={$shop['id']}";
											echo anchor( $href,
												'<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;'.$txt.'&nbsp;',
												'style="float:right;margin-top:0px;" class="btn btn-xs btn-primary"' );
										?>
									
										<?php if( $shop['shipping'] && $shop['shipping_cost']>0 ):?>
											<span class="label label-success" style="float:right;margin:2px 3px 0 0;">
											<span class="glyphicon glyphicon-check"></span>&nbsp;Free Delivery</span>
										<?php endif;?>
									
										<div style="float:left; display: inline-block;padding-top:2px;">
											<div class="rating small"  data-role="rating" data-param-rating="<?php echo $shop['rating'];?>"
											data-param-vote="off"></div>
										</div>
									</div>
								</li>
								<?php endforeach; endif;?>
							</ul>
						</div><!-- product-set-->
						
						
						<!--
						<div class="product-inputs">

								<div class="input-append">
									<input class="col-sm-1" type="text" name="pq" value="" placeholder="QTY">
									<button class="btn btn-primary" type="submit" value="add-to-cart" name="add-to-cart">
										<span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart
									</button>
									<!--
									<button class="btn" rel="tooltip" data-title="+To Wishlist"><span class="glyphicon glyphicon-heart"></span></button>
									<button class="btn" rel="tooltip" data-title="+To Compare"><span class="glyphicon glyphicon-refresh"></span></button>
									-->
						<!--			
								</div>
								<input type="hidden" name="product_id" value="<?php echo $page['id'];?>">		
						</div><!--end product-inputs-->
					</div><!--end product-set-->
				</div><!--end col-sm-6 -->
				
			</div><!--end product-details-->
		</form>
	</div><!-- col-sm-12 -->
</div> <!-- row -->

<div class="row">

	<div class="col-sm-12">
		<div class="product-tab">
				<ul class="nav nav-tabs">
					<li class="active">
					  	<a href="#description" data-toggle="tab">Description</a>
					</li>
					<li>
						<a href="#specifications" data-toggle="tab">Details</a>
					</li>
					<!-- 
						<li>
						<a href="#return-info" data-toggle="tab">Return Info</a>
					</li> -->
					<li><a href="#read-review" data-toggle="tab">Reviews</a></li>
					<li>
						<a href="#shops" data-toggle="tab">More Shops</a>
					</li>
				</ul>
				<div class="tab-content" style="padding:30px 10px;">
					<div class="tab-pane" id="shops">
					
						<ul class="vProductItemsTiny">
							<?php foreach( $normal as $k=>$shop ):?>
								<li class="col-sm-6 clearfix">
									<!--
									<input type="radio" class="pull-left" id="radio<?php echo $shop['id'];?>" name="shop" 
										value="<?php echo $shop['id'];?>" style="margin: 18px 5px 0 0;"
										<?php if($k==0) echo 'checked';?> required>
									-->
									<div class="thumbImage" style="width:23%;float:left;margin-left:0px;margin-right:10px;">
										<?php $img = array( 'src'=>'images/company_profiles/100x75/'.$shop['image'], 'title'=>'view offer' );
										echo anchor("shops/{$shop['id']}/{$shop['segment']}/products/{$page['id']}/{$page['segment']}",cdn($img));
									?>									
								</div>
								<div class="thumbSetting" style="width:66.5%;text-align:left;float:left;">
									<div class="thumbTitle"><strong>
										<?php echo anchor(
											"shops/{$shop['id']}/{$shop['segment']}/products/{$page['id']}/{$page['segment']}",
											$shop['name'], 'class="invarseColor"' );?>
										</strong>
									</div>
									<div class="thumbPrice">
								<?php $href = site_url("shops/{$shop['id']}/{$shop['segment']}/products/{$page['id']}/{$page['segment']}"); ?>
										<a style="font-weight:700;font-size:14px;color:#666;text-decoration:none;
											background:#fff;" href="<?php echo $href;?>">

											<?php if($shop['old_price']>$shop['price']):?>
												<span style="text-decoration:line-through;margin-right:5px;color:#aaa;">
													&nbsp;<?php echo toc($shop['old_price']);?>&nbsp;
												</span>
											<?php endif; echo toc( $shop['price'] )?>
										</a>
									</div>
									<br>
									<?php
								$atc = "shopping_cart/add_to_cart?product_id={$page['id']}&pq={$shop['min_order']}&shop={$shop['id']}";
									 echo anchor( $href,
										'<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Buy Now&nbsp;',
										'style="float:left;margin-top:2px;" class="btn btn-xs btn-primary"' );?>
									
									<?php if( $shop['shipping'] && $shop['shipping_cost']>0 ):?>
									<span class="label label-success" style="float:left;margin:2px 0 0 3px;">
									<span class="glyphicon glyphicon-check"></span>&nbsp;Free Delivery</span>
									<?php endif;?>
									
									<div style="float:right; display: inline-block;padding-top:2px;">
										<div class="rating small"  data-role="rating" data-param-rating="<?php echo $shop['rating'];?>"
										 data-param-vote="off"></div>
									</div>
								</div>
							</li>
						<?php endforeach;?>
						</ul>
					
					
					
					
				</div>

				<div class="tab-pane active" id="description">
					<?php echo html_entity_decode( $page['d_description'], ENT_QUOTES )?>
				</div>

				<div class="tab-pane" id="specifications">
					<table class="table table-condensed table-bordered">
						<?php if(!empty($specifications)):?>
						<thead>
							<tr style="text-align:left;">
								<th style="text-align:left;padding-left:5px;padding-right:5px;">Attribute</th>
								<th style="text-align:left;padding-left:5px;">Value</th>
							</tr>
						</thead>
						<?php endif;?>
						<tbody>
						
						<?php foreach( $specifications as $k=>$v ):?>
						<tr>
							<td style="text-align:left; font-weight:bold;"><?php echo $v['name'];?></td>
							<td style="text-align:left;"><?php echo nl2br($v['value']);?></td>
						</tr>
						<?php endforeach;?>
						</tbody>
					</table>
				</div>
				
				<div class="tab-pane" id="return-info">
				
				</div>
		
				<div class="tab-pane" id="read-review">
					
					<?php if( $this->flexi_auth->is_logged_in() ):
					echo form_open( current_url(), array( 'name'=>'comments', 'class'=>'form-horizontal' ) );?>
						<div class="form-group">
							<label class="control-label col-sm-4">Rate this product:</label>
							<div class="col-sm-8">
								<div class="rating small" data-role="rating" id="rating1" data-param-rating="<?php echo 3;?>" 
								style="margin-top:10px;"></div>
								<input type="hidden" id="my_ratings" value="<?php echo 3;?>" name="rating">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">Name:</label>
							<div class="col-sm-8">
								<h4 class="media-heading" style="margin-top:10px;">
									<?php echo $this->authorize->get_real_name();?>
								</h4>				
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">Your Review *</label>
							<div class="col-sm-8">
								<textarea class="form-control" name="comment" required style="height:70px;" 
								placeholder="Your Review...*"><?php echo $this->input->post('comment');?></textarea>
								<input type="hidden" name="form_type" value="insert">
								<input type="hidden" name="form_name" value="product_review">
								<input type="hidden" name="product_id" value="<?php echo $page['id']?>" required>
								<input type="hidden" name="user_id" value="<?php echo $this->flexi_auth->get_user_id();?>" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-2" style="padding-left: 0;">
								<button class="btn btn-sm btn-default" type="reset" name="reset" 
									onclick="$('#rating1').RatingValue(0)">Cancel</button>
								<button type="submit" class="btn btn-sm btn-primary">Add Review</button>
							</div>
						</div>
					</form><!--end form-->
					<?php else:?>
						<h4>You need to <?php echo anchor( 'account/login', 'login' );?> to make a review</h4>
					<?php endif;?>
					<br clear="all"><br clear="all">
					<table style="width:100%">
					<?php foreach($reviews as $r):?>	
						<tr><td colspan=2><?php echo br(1)?></td></tr>
						<tr class="single-review clearfix">
							<td class="hidden-xs col-sm-1" style="padding:0;vertical-align:top;">
								<div>
									<?php if($r['view_user']) $img = $r['photo'];
										elseif($r['official']) $img = 'zimall-asset.png';
										else $img = 'noimage.png';
										echo cdn( array( 'src'=>"images/users/thumbs/{$img}", 'class'=>'img-thumbnail' ) );
									?>
								</div>
							</td>
							<td style="padding-left:2%;">
								<div class="comment-wrapper">
									<div class="speech-bubble-left hidden-xs">&nbsp;</div>
									<div class="review-header">
										<div class="<?php if($r['official']) echo 'well-sm well';?>">
											<div data-role="rating" data-param-rating="<?php echo $r['rating'];?>" 
												data-param-vote="off" class="rating small" 
												style="float:right;margin-top:3px;"></div>
											<h3>
												<?php if($r['official']) echo 'Official Review ';
													if( $r['official'] && $r['view_user'] ) echo 'by ';
													if($r['view_user']) echo $r['fname'].' '.$r['surname'];?>
												&nbsp;<small><?php echo date( 'd M Y', $r['date'] )?></small>
											</h3>
										</div>
									</div><!--end review-header-->
									
									<div class="review-body"><?php echo html_entity_decode( $r['comment'], ENT_QUOTES );?></div>
								</div><!-- endi of comment-wrapper -->
								<?php echo br(1)?>
							</td>
						</tr><!-- end of single-review -->
					<?php endforeach;?>
					</table>
				</div>
			</div><!--end tab-content-->
		</div><!--end product-tab-->
		<br clear="all">
		<?php $this->load->view("$theme/shop/related-products.tpl")?>
		<br clear="all">
		<?php $this->load->view("$theme/shop/recently-viewed.tpl")?>
	</div>
	
	<div class="col-sm-6">
		<br clear="all">
		<?php //$this->load->view("$theme/shop/main-side.tpl");?>
	</div>

	
<?php endif;?>



