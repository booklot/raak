<?php defined('BASEPATH') OR exit('No direct script access allowed');?>

<div class="col-sm-3 side-container">
	<?php $this->load->view("$theme/shop/main-side.tpl")?>
</div>
		
<div class="col-sm-9 main-container">
	<div style="width:100%;background:none;">

	<?php $this->load->view( "$theme/banners/900x375.tpl" );?>


<?php 
if(!empty($shops)):
$n = count($shops);
?>

<br clear="all">
<div class="productFilter clearfix">
	<?php echo form_open( current_url(), array( 'class'=>'form-inline' ) );?>
		<div class="sortBy inline pull-left">
			Sort By
			<select name="sort" id="sort_by" class="btn btn-sm btn-default">
				<option value="shop_ratings.rating desc"
				 <?php if( $this->data['sort']=="shop_ratings.rating desc" ) echo 'selected';?>>Highest Rating</option>
				<option value="shop_ratings.rating asc"
				 <?php if( $this->data['sort']=="shop_ratings.rating asc" ) echo 'selected';?>>Lowest Rating</option>
				<option value="companies.name asc"
				 <?php if( $this->data['sort']=="companies.name asc" ) echo 'selected';?>>Name (A-Z)</option>
				<option value="companies.name desc"
				 <?php if( $this->data['sort']=="companies.name desc" ) echo 'selected';?>>Name (Z-A)</option>
				 <option value="product_categories.name asc"
				 <?php if( $this->data['sort']=="product_categories.name asc" ) echo 'selected';?>>Category (A-Z)</option>
				<option value="product_categories.name desc"
				 <?php if( $this->data['sort']=="product_categories.name desc" ) echo 'selected';?>>Category (Z-A)</option>
				<option value="featured_products.budget asc"
				 <?php if( $this->data['sort']=="featured_products.budget asc" ) echo 'selected';?>>Most Popular</option>
				<option value="featured_products.budget desc"
				 <?php if( $this->data['sort']=="featured_products.budget desc" ) echo 'selected';?>>Less Popular</option>
			</select>
		</div>

		<div class="showItem inline pull-left">
			Show
			<select name="per_page" id="perpage" class="btn btn-sm btn-default">
				<option value="10" <?php if($per==10) echo 'selected';?>>10</option>
				<option value="15" <?php if($per==15) echo 'selected';?>>15</option>
				<option value="20" <?php if($per==20) echo 'selected';?>>20</option>
				<option value="30" <?php if($per==30) echo 'selected';?>>30</option>
				<option value="50" <?php if($per==50) echo 'selected';?>>50</option>
				<option value="75" <?php if($per==75) echo 'selected';?>>75</option>
				<option value="100" <?php if($per==100) echo 'selected';?>>100</option>
			</select>
		</div><!--end sortBy-->
		<!--
		<div class="compareItem inline pull-left">
			<?php echo anchor( 'compare', 'Product Compare (0)', 'class="btn"');?>
		</div><!--end compareItem-->
		<div class="displaytBy inline pull-right">
			Display
			<div class="btn-group" data-toggle="buttons-radio">
				<button type="button" class="btn btn-sm btn-primary active"><i class="icon-th"></i></button>
				<!--<button type="button" class="btn"><i class="icon-list"></i></button>-->
			</div>
		</div><!--end displaytBy-->
		<div class="hidden"><input type="submit" name="submit" id="submit"></div>
	</form>
</div> <!-- end of productFilter -->
	
	
	
	
<div class="featuredItems block block-danger" style="margin-top:15px">
	<h2 class="title_block">Featured Shops</h2>

	<div class="block_content">
		<ul class="hProductItems clearfix">
			<?php foreach($shops as $i=>$f):

			if($f['permalink']) $url = $f['segment'];
			else $url = "shops/{$f['id']}/{$f['segment']}";
		
			if( $i%4==0 ) echo '<div class="">';?>
				<li class="col-sm-3 clearfix">
					<div class="thumbnail">
						<?php $img = array( 'src'=>'images/company_profiles/210x120/'.$f['image'] );
							echo anchor( $url, img($img) );?>
					</div>
					<div class="thumbSetting">
						<div class="thumbTitle">
							<?php echo anchor( $url, character_limiter($f['name'], 30), 
							'class="invarseColor" style="margin-bottom:0;display:block;"')?>
							<small style="line-height:15px;position:relative;top:-5px;"><?php 
								echo character_limiter($f['category_name'], 50);?></small>
						</div>
						<div class="thumbButtons">
							<?php echo anchor( $url,
							'<i class="icon-circle-arrow-right"></i>&nbsp;Enter&nbsp;Shop',
							'class="btn btn-primary btn-xs"');?>
						</div>
						<div class="rating_cont">
							<div class="rating small" data-role="rating" 
								data-param-rating="<?php echo $f['rating'];?>" data-param-vote="off">
							</div>
						</div>
					</div>
				</li>
				<?php if( ( ($i+1)>0 && ($i+1)%4==0) || ( $n==($i+1) && ($i+1)%4!=0 ) ) 
					echo '</div><!--end of row'.(int)(($i/4)+1).'-->';
			endforeach;?>
		</ul>
		<br clear="all"><br clear="all"><br clear="all">

		<div class="col-xs-12">
			<ul class="pagination pull-left">
				<li class="disabled"><a style="border:none;">
				Showing <?php echo $start?> to <?php echo $current_rows?> of <?php echo $total_rows?> shops
				</a></li>
			</ul>
			<ul class="pagination pull-right">
				<?php echo $this->pagination->create_links(); ?>
			</ul>
		</div>
		<!--end pagination-->
	</div>
	<!-- block_content -->
</div>
<!-- end of featured-items-->
<?php endif;?> <!-- end of FEATURED ITEMS-->



<?php if(!empty($pb_category)): ?>

		<div id="featuredItems">
			<div class="titleHeader clearfix">
				<h3>Browse by Category</h3>
				<div class="pagers">
					<div class="btn-toolbar">
						<?php echo anchor( 'shops/'.$store['id'].'/categories', lang('view-all'), 'class="btn btn-mini"' );?>
					</div>
				</div>
			</div><!--end titleHeader-->
			
			<div class="container">
				<ul class="hProductItems clearfix">
				<?php foreach($pb_category as $i=>$f):?>
					<li class="col-sm-3 clearfix">
						<div class="thumbnail">
							<?php $img = array( 'src'=>'images/products/210x120/'.$f['image'] );
								echo anchor( 'shops/'.$store['id'].'/products/'.$f['id'].'/'.$f['segment'], img($img) );?>
						</div>
						<div class="thumbSetting">
							<div class="thumbTitle">
								<?php echo anchor( 'shops/'.$store['id'].'/products/'.$f['id'].'/'.$f['segment'], $f['name'], 'class="invarseColor"')?>
							</div>
							<div class="thumbPrice">
								<span><!--<span class="strike-through">$200.00</span> -->
								<small>from</small> 
								<?php echo toc( $f['price'] )?></span>
							</div>
							<div class="thumbButtons dropdown">
								<button class="btn btn-primary btn-small dropdown-toggle" data-toggle="dropdown">
									<i class="icon-shopping-cart"></i>&nbsp;Add&nbsp;to&nbsp;Cart&nbsp;
									<i class="caret shop-caret"></i>
								</button>
								
								<table class="dropdown-menu">
									<tr><th colspan="2"><?php echo lang('select-shop-to-buy-from'); ?></th></tr>
								<?php $s = $f['shops'];
								foreach( $s as $k=>$shop ):?>
									<tr class="available-from">
										<td class="text-left">
										<?php echo anchor( 'shopping_cart/add_to_cart?product_id='.$f['id'].'&shop='.$shop['id'].'&pq='.$shop['min_order'],
											$shop['name']);?></td>
										<td><strong class="text-right">
										<?php echo anchor( 'shopping_cart/add_to_cart?product_id='.$f['id'].'&shop='.$shop['id'].'&pq='.$shop['min_order'],
										toc( $shop['price'] ) );?></strong></td>
									</tr>
								<?php endforeach; ?>
									<tr class="available-from">
										<td colspan="2"><?php echo anchor( 'shops/'.$store['id'].'/products/'.$f['id'].'/'.$f['segment'], lang('view-all').'...' );?></td>
									</tr>
								</table>
								
								<!--
								<button class="btn btn-small" data-title="Add to WishList" data-placement="top" rel="tooltip">
									<i class="icon-heart"></i>
								</button>
								<button class="btn btn-small" data-title="Add to Compare" data-placement="top" rel="tooltip">
									<i class="icon-refresh"></i>
								</button>-->
							</div>
							<div class="rating_cont">
								<div class="rating small" data-role="rating" data-param-rating="<?php echo $f['rating'];?>" 
									data-param-vote="off"></div>
							</div>
						</div>
					</li>
				<?php endforeach;?>
				</ul>
			</div>
		</div>
	
<?php endif;?> <!-- end of FEATURED ITEMS-->

</div></div>
