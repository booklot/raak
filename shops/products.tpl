<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if($store['permalink']) $permalink = $store['segment'];
else $permalink = "shops/{$store['id']}/{$store['segment']}";
?>
	<?php if(isset($view_single)):?>
		<div class="container">
			<ol class="breadcrumb">
				<span>You are here:&nbsp;&nbsp;</span>
				<?php 
				foreach($trail as $k=>$v):
					if($v['l']>1)
						echo '<li>'.anchor( "shop/categories/{$v['id']}/{$v['segment']}", $v['name'] ).'</li>';
				endforeach;
				echo '<li>'.anchor("shop/categories/{$category['id']}/{$category['segment']}", $category['name']).'</li>';
				echo '<li class="active">'.anchor("{$page['id']}/{$page['segment']}", $page['name']).'</li>';?>
			</ol> <!-- end of breadcrumb -->
		</div>
	<?php endif?>



<?php if(isset($view_single)):

	if( isset( $discount['dsr_id'] ) )
	{
		$page['old_price'] = $page['price'];
		if( $discount['dsr_percentage'] ) $d = $page['price']*$discount['dsr_value'];
		else $d = $discount['dsr_value'];
		$page['price'] = ( $page['price'] - $d );
	}

	$this->load->helper('microdata');
	//if($product_data['field1']=='Model')
	if( $product_data['field1']=='Author' ):
		$md = new Microdata\Book();
		$md->setAuthor($product_data['var1']);
		$md->setPublisher($product_data['var2']);
	else:
		$md = new Microdata\Product();
		$md->setBrand($product_data['var2']);
		$md->setManufacturer($product_data['var2']);
		$md->setModel($product_data['var1']);
	//else: echo $product_data['field1'];
	endif;
	
	$md->setName($page['name']);
	$md->setUrl(current_url());
	$md->setDescription( character_limiter( $page['summary'], 300 ) );
	$md->setProductId($page['id']);
	$md->setRatingValue( number_format( $page['rating'], 1 ) );
	$md->setReviewsCount( $page['reviews'] );
	$md->setPrice( toc($page['price']) );
	$md->setCondition(\Microdata\iMicrodata::CONDITION_NEW, "new");
	
	$now = time();
	if( $page['presell'] && $page['presell_date']>$now )
		$presell = date( 'd F Y', $page['presell_date'] );
	else $presell = FALSE;
?>
<!-- <div itemscope itemtype="https://schema.org/Product" class="row">  -->
<?php echo $md->openSchemaCode( 'div', array('class'=>'product') );?>
	<div class="container">
	<?php echo form_open( 'shopping_cart/add_to_cart', array( 'class'=>'form-horizontal', 'id'=>'add2cart' ) );?>
		<div class="">
			<div class="product-details clearfix">
				<div class="col-sm-6">
					<div class="product-img" style="position:relative;">
					<?php $a = array( 'target'=>'_blank',	'class'=>'fancybox', 'rel'=>'group1', 'title'=>$page['name'] );
						$img = array( 'src'=>'images/products/main/'.$page['image'], 'alt'=>$page['name'] );
						echo anchor( cdn_url('images/products/main/'.$page['image']), cdn($img), $a );
					 ?>
					 
					<?php if($page['shipping'] && $page['shipping_cost']>0):?>
						<span class="free-shipping-red"></span>
					<?php endif;?>
					</div><!--end product-img-->
					<div class="product-img-thumb" style="max-height:250px;overflow-y:auto;">
						<?php if( isset($page['images']) ):
					$images = $page['images'];
					$a = array( 'target'=>'_blank',	'class'=>'fancybox', 'rel'=>'group1', 'title'=>$page['name'] );
					if( is_array($images) ):
					foreach( $images as $image ):
						$img = array( 'src'=>'images/products/100x75/'.$image['image'], 'alt'=>$page['name'] );
						echo anchor( cdn_url().'images/products/main/'.$image['image'], cdn( $img ), $a);
					endforeach;endif;endif;?>
					</div><!--end flexslider-thumb-->
				</div><!--end col-sm-6 -->
				
				<div class="col-sm-6">
					<div class="product-set">
						<div class="product-title"><?php echo $md->getNameCode('h1');?></div>
						<div class="product-info">
							<?php if($page['quantity']<1):?>
								<h4>
									<span class="label label-danger">
										<span class="fa fa-warning"></span> Out of Stock
									</span>
								</h4><br>
							<?php endif;?>
							<table class="table">
								<tbody>
									<tr>
										<th rowspan="2">
											<h3>Price</h3>
										</th>
										<td>
											<?php 
												echo $md->getOffer()->openSchemaCode( 'div', 
													array('class'=>'product-price unit-price') );
												if( $page['old_price'] > $page['price'] ):?>
													<span class="strike-through old-price">
														<?php echo toc($page['old_price'])?>
													</span>
												<?php endif;
												echo $md->getOffer()->getPriceCode( 'span', array('class'=>'current-price') );
												echo $md->getOffer()->closeSchemaCode();
												echo '<!--end product-price-->';
												//print_r($discount);
											?>
										</td>
									</tr>
									<tr>
										<td class="discounts">
											<?php if($page['old_price']>$page['price']):?>
												<span class="label label-success">
														<?php $x = ( 100-( ( $page['price']/$page['old_price'])*100) );
															$x = number_format( $x, 2, '.', ',' );
															echo $x;?>% off
													</span>
													&nbsp;&nbsp;&nbsp;
													<span class="label label-danger">Save
														<?php echo toc( $page['old_price']-$page['price'] );?>
													</span>
												<br clear="all">
											<?php endif;?>
										</td>
									</tr>
									<tr>
										<th rowspan="1">Shipping</th>
										<td class="shipping-options">
										<?php if( isset($shipping[$best_shipping]['cost']) && $ip_location['cnt']>0 ):
											if(is_numeric($shipping[$best_shipping]['cost'])) $bsc = $shipping[$best_shipping]['cost']; else $bsc=0;
										?>
											<span class="shipping-cost" data-value="<?php echo $bsc;?>">
												<?php echo toc($shipping[$best_shipping]['cost']);?>
											</span>
											<span> to </span>
											<a data-toggle="modal" href="#shipping_location">
												<?php echo $ip_location['ctn'];?>
											</a>
											<span> with </span>
											<a data-toggle="modal" href="#shipping_options">
												<?php echo $shipping[$best_shipping]['name'];?>
											</a>
											<!-- <span> in <?php echo $shipping[$best_shipping]['time']?></span> -->
											<br>
											
											<?php $ptime = $page['ptime']?$page['ptime']:$this->config->item('processing_time');?>
											
											<i>usually dispatched in <?php echo $ptime;?> business day<?php 
											if($ptime>1) echo 's';?></i>
										<?php else:?>
											<a data-toggle="modal" href="#shipping_location" class="shipping-cost" data-value="0">
												<i class="disabled">Shipping information not available</i>
											</a>
										<?php endif;?>
										</td>
									</tr>
									<tr>
										<th>Rating:</th>
										<td>
											<?php 
												echo $md->getAggregateRating()->openSchemaCode( 'div', 
													array('class'=>'product-rate clearfix') );?>
												<div class="rating small" data-role="rating" 
													data-param-rating="<?php echo $page['rating'];?>" 
													data-param-vote="off" style="float:left;margin-top:3px;"></div>
												<meta itemprop="ratingValue" content="<?php echo number_format( $page['rating'], 1 );?>">
												<meta itemprop="worstRating" content = "1"/>
												<meta itemprop="bestRating" content = "5"/>
											<?php
												echo '&nbsp;&nbsp;&nbsp;'.$md->getAggregateRating()->getReviewCountCode().' Review';
												if( $page['reviews']>1 || $page['reviews']==0 ) echo 's';
												echo $md->getAggregateRating()->closeSchemaCode();
											?><!--end product-rate-->
										</td>
									</tr>
									<tr>
										<th><?php echo $page['field1']?>:</th>
										<?php echo $md->getModelCode( 'td' );?>
									</tr>
									<tr>
										<th><?php echo $page['field2']?>:</th>
										<?php echo $md->getBrandCode('td');?>
									</tr>
									<?php if(0>1):?>
									<tr>
										<th>Review&nbsp;Points:&nbsp;&nbsp;&nbsp;</th>
										<td><?php if($page['points']>0) echo $page['points']; else echo 0;?> Points</td>
									</tr>
									<?php endif;?>
									<tr>
										<th>ISBN:&nbsp;&nbsp;&nbsp;</th>
										<td><?php if( $page['isbn'] && strlen($page['isbn'])>=10 ) echo $page['isbn'];?></td>
									</tr>
									<tr>
										<th>Summary:</th><?php echo $md->getDescriptionCode('td');?>
									</tr>
								</tbody>
							</table>
							
						</div><!--end product-info-->
						
						<div class="product-inputs" data-price="<?php echo $page['price'];?>">
							<?php foreach($poptions as $k=>$v):
								$op = $v;?>
								<div class="col-sm-12">
									<div class="form-group" >
										<label class="control-label col-xs-4" style="text-align:left;"><?php echo $k;?></label>
										<div class="col-xs-8">
											<select class="input-sm order-options form-control" name="options[]" required>
												<option disabled>-- Select <?php echo $k;?> --</option>
												<?php foreach($op as $i=>$value):
													if($value['atp']) $c = '+'.toc($value['cost']);
													else $c = toc($value['cost']+$page['price']);
												?>
													<option value="<?php echo $value['id']?>" data-cost="<?php echo $value['cost'];?>"
													<?php if($value['qty']<1) echo 'disabled';
														elseif($value['default']==1) echo 'selected';
														//elseif($value['cost']==0 && $value['qty']>0) echo 'selected';
														
													?>>
														<?php echo $value['value']; if($value['qty']<1) echo ' - out of stock'; 
															if( $value['cost']!=0 ) echo ' ( '.$c.' )';
														?>
													</option>
												<?php endforeach;?>
											</select>
										</div>
									</div>
								</div><!--end controls-row-->
							<?php endforeach;?>
								<div class="col-sm-12">
								<div class="form-group">
									<?php if($page['download']):?>
										<input type="hidden" name="pq" value="1">
										<button class="btn btn-primary"type="submit"value="add-to-cart" name="add-to-cart">
											<span class="glyphicon glyphicon-cloud-download"></span> Download Album
										</button>
										<?php if($page['artist']>0 && $page['artist_page'])
											echo anchor( $page['artist_page'], 
												'Artist Page <span class="glyphicon glyphicon-new-window"></span>',
												'class="btn btn-default"' );?>
									<?php else:?>
										<?php if($presell):?>
											<h4>
												Available on Pre-Order. Stock due to arrive on 
												<span style="font-weight:bold;text-decoration:underline;color:#f60;">
													<?php echo $presell;?>
												</span>
											</h4><br>
										<?php elseif($page['quantity']<3 && $page['quantity']>0):?>
											<h4>
												<span class="label label-warning">
													<span class="glyphicon glyphicon-time"></span> Limited Availability
												</span>
											</h4><br>
										<?php endif;?>
									<br clear="all">
									<label class="control-label col-xs-4" style="text-align:left;" 
										title="Estimated total including delivery. You will get the exact total with delivery during checkout.">
										<strong>Total</strong> <small>(estimated)</small>
									</label>
									<div class="col-xs-8">
										<div class="product-price">
											<span class="total-price" 
												title="Estimated total including delivery. You will get the exact total with delivery during checkout.">
												<?php echo toc( $page['price']*$page['min_order'] );?>
											</span>
											<span class="price-loading hidden">
												<?php echo img( array('src'=>"site/views/$theme/img/loader3.gif", 
												'class'=>'img-responsive') );?>
											</span>
											<span class="total-savings">
											<?php 
												if($page['old_price']>$page['price']):?>
													<span class="label label-danger">Total Savings: 
														<?php echo toc( ($page['old_price']-$page['price'])*$page['min_order'] );?>
													</span>
											<?php endif;?>
											</span>
										</div>
									</div>
									<br clear="all"><br clear="all">
									<label class="control-label col-xs-4" style="text-align:left;">Qty</label>
									<div class="col-xs-8">
										<div class="input-group">
											<input class="form-control order-quantity" type="number" name="pq" 
											pattern="[0-9]{1,5}" 
											value="<?php echo $page['min_order'];?>" placeholder="QTY" style="min-width:50px;">
											<span class="input-group-btn">
												<button class="btn btn-primary" type="submit" value="add-to-cart" 
													name="add-to-cart" <?php if($page['quantity']<1) echo 'disabled';?>>
													<span class="glyphicon glyphicon-shopping-cart"></span> <?php 
														if($presell) echo 'Pre-Order'; else echo 'Add To Cart';?>
												</button>
												<?php $wish = site_url("shopping_cart/add_to_wishlist/{$page['id']}/{$store['id']}").
													'?r='.uri_string().$login_link;
													//echo anchor( $wish, '<i class="fa fa-heart"></i>', 
													//	'class="btn btn-danger addToWishlist" title="Add to Wishlist" rel="tooltip" 
													//	style="color:#fff;" 
													//	data-id="'.$page['id'].'" data-shop="'.$store['id'].'" '.$login_option );
													$compare = site_url("shopping_cart/add_to_compare/{$page['id']}/{$store['id']}").'?r='.uri_string().$login_link;
													//echo anchor( $compare, '<i class="fa fa-retweet"></i>', 
													//	'class="btn-default btn add_to_compare" title="Compare" rel="tooltip" 
													//	data-id="'.$page['id'].'" data-shop="'.$store['id'].'" '.$login_option );
												?>
											</span>
										</div><!-- /input-group -->
									</div><!-- /.col-lg-6 -->
									<?php endif;?>
								</div>
								</div>
								<input type="hidden" name="shop" value="<?php echo $page['company_id'];?>">
								<input type="hidden" name="product_id" value="<?php echo $page['id'];?>">
								<input type="hidden" name="min_order" class="min_order" value="<?php echo $page['min_order'];?>">
									<!--
									<button class="btn" rel="tooltip" data-title="+To Wishlist">
										<span class="glyphicon glyphicon-heart"></span></button>
									<button class="btn" rel="tooltip" data-title="+To Compare">
										<span class="glyphicon glyphicon-refresh"></span></button>
									-->
									
								
								<!-- social sharing buttons -->
								<div class="col-sm-11">
								<div class="form-group">
								<div class="col-sm-12">
								<div class="btn-group">
									<button type="button" class="btn btn-default">
										<i class="radmin-share-2"></i>&nbsp;&nbsp;Share: </button>
									<?php 
										$url = rawurlencode(current_url());
										$text = rawurlencode($page['title']);
										$desc = rawurlencode($page['summary']);
										$media = rawurlencode( base_url("images/products/{$page['image']}") );
										$btn = array( 'class'=>'btn btn-default share_buttons', 'target'=>'_blank' );
										
										$fb = $this->config->item('facebook_share');
										$fb1 = $fb.'?u='.$url.'&t='.$text;
										$fb1 = $fb.'?s=100&p[url]='.rawurlencode(current_url()).
										'&p[images][0]='.rawurlencode(base_url('images/products/'.$page['image'])).
										'&p[title]='.rawurlencode($page['title']).
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
							</div></div></div>
						</div><!--end product-inputs-->
					</div><!--end product-set-->
				</div><!--end span4-->
			</div><!--end product-details-->
		</div> <!-- end of row-->
		
	</form>
	</div>
</div><!-- row -->

<br clear="all"><br clear="all">
<div class="container"><hr /></div>
<br clear="all"><br clear="all">

<div class="container">

	<div class="col-sm-12">
		<div class="product-tab" id="product-tabs">
			<ul class="nav nav-tabs">
				<li class="active">
				  	<a href="#description" data-toggle="tab"><?php 
				  		if($product_data['field2']=='Album') echo 'Album Tracks'; else echo 'Description';?>
				  	</a>
				</li>
				<li>
					<a href="#specifications" data-toggle="tab">
						<?php if($product_data['field2']=='Album') echo 'Overview'; else echo 'Details';?>
					</a>
				</li>
				<!-- <li>
					<a href="#return-info" data-toggle="tab">Return Info</a>
				</li> -->
				<li>
					<a href="#read-review" data-toggle="tab">Reviews</a>
				</li>
				<!-- <li>
					<a href="#make-review" data-toggle="tab">Make Review</a>
				</li> -->				
			</ul>
			<div class="tab-content" style="padding:30px 10px;border:1px solid #cdcdcd; border-top:none;">
				<div class="tab-pane active" id="description">
					<?php if($product_data['field2']=='Album' && !empty($tracks)) $this->load->view("$theme/tracks.tpl");
					else echo html_entity_decode( $product_data['description'], ENT_QUOTES );?>
				</div>

				<div class="tab-pane" id="specifications">
				
					<?php if($product_data['field2']=='Album' && !empty($tracks)):
						echo html_entity_decode( $product_data['description'], ENT_QUOTES );
					else:?>
					
					<div>
						<?php if($page['return']):?>
						<p>Can be returned within <?php echo $page['return_time']?> hours of delivery</p>
						<p><?php echo nl2br($page['return_terms']);?></p>
						<?php else:?>
						<p>Cannot be returned once delivered</p>
						<?php endif;?>
					</div>
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
					<?php endif;?>
				</div>
				
				<!-- <div class="tab-pane" id="return-info">
					
				</div> -->
		
				<div class="tab-pane" id="read-review">
					
					<?php if( $this->flexi_auth->is_logged_in() ):
					echo form_open( current_url(), array( 'name'=>'comments', 'class'=>'form-horizontal' ) );?>
						<div class="form-group">
							<label class="control-label col-sm-3">Rate this book:</label>
							<div class="col-sm-8">
								<div class="rating small" data-role="rating" id="rating1" data-param-rating="<?php echo 3;?>" 
								style="margin-top:10px;"></div>
								<input type="hidden" id="my_ratings" value="<?php echo 3;?>" name="rating">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Name:</label>
							<div class="col-sm-8">
								<h4 class="media-heading" style="margin-top:10px;">
									<?php echo $this->authorize->get_real_name();?>
								</h4>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">Your Review *</label>
							<div class="col-sm-8">
								<textarea class="form-control" name="comment" required style="height:70px;" 
								placeholder="Your Review...*"><?php echo $this->input->post('comment');?></textarea>
								<input type="hidden" name="form_type" value="insert">
								<input type="hidden" name="form_name" value="product_review">
								<input type="hidden" name="cp_id" value="<?php echo $page['cp_id']?>" required>
								<input type="hidden" name="product_id" value="<?php echo $page['id']?>" required>
								<input type="hidden" name="user_id" value="<?php echo $this->flexi_auth->get_user_id();?>" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-4" style="padding-left:0;">
								<button class="btn btn-sm btn-default" type="reset" name="reset" 
									onclick="$('#rating1').RatingValue(0)">Cancel</button>
								<button type="submit" class="btn btn-sm btn-primary">Add Review</button>
							</div>
						</div>
					</form><!--end form-->
					<?php else:?>
						<h4>You need to <?php echo anchor( 'account/login', 'login' );?> to make a review</h4>
					<?php endif;?>
					<br clear="all">
					<!-- end-make-review -->
					
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
				<div class="tab-pane" id="make-review">
					
				</div>
			</div><!--end tab-content-->
		</div><!--end product-tab-->

		<br clear="all"><br clear="all"><br clear="all">
		<?php $this->load->view("$theme/shop/related-products.tpl")?>
		<br clear="all">
		<?php $this->load->view("$theme/shop/recently-viewed.tpl");?>
		
	</div> <!-- end of col-sm-12 -->
	
</div> <!-- end of row -->

<?php endif;?>

</div> <!-- end of container (main)-->
<?php $this->load->view("$theme/shipping_options.tpl");?>
<!-- footer should start here -->
