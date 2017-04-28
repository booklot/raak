<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php if(isset($trail)):;?>
<div class="col-lg-12">
	<ul class="breadcrumb">
		<span>You are here:&nbsp;&nbsp;</span>
		<?php //echo '<li>'.anchor( base_url(), 'Home' ).' <span class="divider">/</span></li>';
			echo '<li>'.anchor('shop', 'Shop').' <span class="divider">/</span></li><li>'.anchor('shop/categories', 
					'Categories').' <span class="divider">/</span></li>';
			foreach($trail as $k=>$v):
				if($v['l']>1) 
					echo '<li>'.anchor( 'shop/categories/'.$v['id'].'/'.$v['segment'], $v['name'] ).' <span class="divider">/</span></li>';
			endforeach;
			if( isset($page['id']) && isset($page['segment']) && isset($page['name']) )
				echo '<li class="active">'.anchor('shop/categories/'.$page['id'].'/'.$page['segment'], $page['name']).' <span class="divider">/</span></li>';?>
		
	</ul> <!-- end of breadcrumb -->
</div>
<?php endif;?>


	<div class="col-sm-3">
		<div class="search block-info">
			<h3 class="title_block">Search Shops</h3>

			<?php $form = array( 'method'=>'get', 'class'=>'form-horizontal block_content' );
			echo form_open( 'shop/shop_search', $form );?>
				
				<div class="form-group"><div class="col-md-12">
					<input name="q" type="text" class="form-control" placeholder="Type Shop Name..." value="<?php echo $q;?>">
				</div></div>
				
				<div class="form-group"><div class="col-md-12">
					<select name="category" class="form-control">
						<option value="1">--Select Category--</option>
						<?php foreach($categories as $c):?>
						<option value="<?php echo $c['id'];?>" <?php if($c['id']==$cat) echo 'selected'?>>
							<?php echo $c['name']?>
						</option>
						<?php endforeach;?>
					</select>
				</div></div>

				<div class="form-group"><div class="col-md-12">
					<button type="submit" class="btn btn-primary pull-right">
						<span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;&nbsp;Shop Search</button>
				</div></div>
			</form><!--end form-->
		</div>
		<!-- block-info -->
			
		<div class="search block block-default">
			<h3 class="title_block">Search Products</h3>

			<?php $form = array( 'method'=>'get', 'class'=>'form-horizontal block_content' );
			echo form_open( 'shop/search', $form ) ?>
				<div class="form-group"><div class="col-md-11">
					<input name="q" type="text" class="form-control" placeholder="Type Search Term..." value="">
				</div></div>
					
				<div class="form-group"><div class="col-sm-12">
					<select name="category" class="form-control">
						<option value="1">--Select Category--</option>
						<?php foreach($categories as $c):?>
						<option value="<?php echo $c['id'];?>">
							<?php echo $c['name']?>
						</option>
						<?php endforeach;?>
					</select>
				</div></div>

				<!--
				<label class="checkbox">
					<input type="checkbox" name="desc" value="<?php echo $desc?>"> Search in product descriptions
				</label>
				-->

				<div class="form-group"><div class="col-sm-12">
					<button type="submit" class="btn btn-primary pull-right">
						<span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;&nbsp;Product Search</button>
				</div></div>
			</form><!--end form-->
		</div>
		<!--end search-->
		
		<?php $this->load->view("$theme/banners/220x300.tpl");?>
		
	</div><!--end col-sm-3-->

	<div class="col-sm-9">
		
		<?php if(empty($shops)):?>
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<h3>Oh, We're So Sorry</h3>
				There is no shops that matches the search criteria.
			</div><!--end alert-->
		<?php endif;?>
		
		<div class="block block-info">
			<h3 class="title_block">Search Results</h3>

			<div class="productFilter clearfix">
				<?php echo form_open( current_url(), array( 'class'=>'form-inline' ) );?>
					<div class="sortBy inline pull-left">
						Sort By
						<select name="sort" id="sort_by" class="btn btn-default btn-sm">
							<option value="company_ratings.rating desc"
							 <?php if( $this->data['sort']=="company_ratings.rating desc" ) echo 'selected';?>>Highest Rating</option>
							<option value="company_ratings.rating asc"
							 <?php if( $this->data['sort']=="company_ratings.rating asc" ) echo 'selected';?>>Lowest Rating</option>
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
						<select name="per_page" id="perpage" class="btn btn-default btn-sm">
							<option value="5" <?php if($per==5) echo 'selected';?>>5</option>
							<option value="15" <?php if($per==15) echo 'selected';?>>15</option>
							<option value="20" <?php if($per==20) echo 'selected';?>>20</option>
							<option value="30" <?php if($per==30) echo 'selected';?>>30</option>
							<option value="50" <?php if($per==50) echo 'selected';?>>50</option>
							<option value="75" <?php if($per==75) echo 'selected';?>>75</option>
							<option value="100" <?php if($per==100) echo 'selected';?>>100</option>
						</select>
					</div><!--end sortBy-->
			
					<div class="displaytBy inline pull-right">
						Display
						<div class="btn-group" data-toggle="buttons-radio">
							<button type="button" class="btn btn-primary active"><span class="glyphicon glyphicon-th"></span></button>
							<button type="button" class="btn"><span class="glyphicon glyphicon-list"></span></button>
						</div>
					</div><!--end displaytBy-->
					<div class="hidden"><input type="submit" name="submit" id="submit"></div>
					<input type="hidden" name="q" value="<?php echo $q;?>">
					<input type="hidden" name="category" value="<?php echo $cat;?>">
					<input type="hidden" name="desc" value="<?php echo $desc;?>">
				</form>
			</div> 
			<!-- end of productFilter -->


			<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid block_content">
			<ul class="hProductItems clearfix">
			<?php 
				$n = count($shops);
				foreach($shops as $i=>$f):
				if( $i%4==0 ) //echo '<div class="row-fluid">';?>
					<li class="col-sm-3 clearfix">
						<div class="thumbnail">
							<?php $img = array( 'src'=>'images/company_profiles/210x120/'.$f['image'] );
								echo anchor( 'shops/'.$f['id'].'/'.$f['segment'], img($img) );?>
						</div>
						<div class="thumbSetting">
							<div class="thumbTitle">
								<?php echo anchor( 'shops/'.$f['id'].'/'.$f['segment'], character_limiter($f['name'], 30), 
								'class="invarseColor" style="margin-bottom:0;display:block;"')?>
								<small style="line-height:15px;position:relative;top:-5px;"><?php echo character_limiter($f['category_name'], 50);?></small>
							</div>							
							<div class="thumbButtons">
							
								<?php echo anchor( 'shops/'.$f['id'].'/'.$f['segment'],
								'<span class="glyphicon glyphicon-circle-arrow-right"></span>&nbsp;Enter&nbsp;Shop',
								'class="btn btn-primary btn-xs"');?>
							</div>
							<div class="rating_cont">
								<div class="rating small" data-role="rating" 
									data-param-rating="<?php echo $f['rating'];?>" data-param-vote="off">
								</div>
							</div>
						</div>
					</li>
				<?php if( ( ($i+1)>0 && ($i+1)%4==0) || ( $n==($i+1) && ($i+1)%4!=0 ) ) echo '';
					//'</div><!--end of row'.(int)(($i/4)+1).'-->';
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
		<!-- block-info -->
	</div> 
	<!-- end of span9-->
