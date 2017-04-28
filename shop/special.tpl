<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="container"><?php $this->load->view("$theme/banners/960x300.tpl");?></div>
<br clear="all">
<ol class="breadcrumb">
	<span>You are here:&nbsp;&nbsp;</span>
	<?php 
		echo '<li>'.anchor( 'shop', 'Shop' ).'</li>';
		echo '<li>'.anchor( 'shop/special', 'Special Offers' ).'</li>';?>
</ol> <!-- end of breadcrumb -->
	
<?php $n = count($special);?>
<div class="row">
	<div class="col-sm-12">
		<div class="featuredItems">
			<div class="titleHeader clearfix">
				<h3>Special Offers</h3>
			</div><!--end titleHeader-->
			
				<ul class="hProductItems clearfix">
				<?php foreach($special as $i=>$f):
				$link = "shops/{$f['company_id']}/{$f['company_segment']}/products/{$f['id']}/{$f['segment']}";
				if( $i%4==0 ) echo '<div class="row-fluid">';?>
				
					<li class="col-sm-3 clearfix">
						<div class="thumbnail" style="position:relative">
						<span class="discount">
							&nbsp;&nbsp;<?php echo round($f['disc']*100,1)?>%&nbsp;&nbsp;
						</span>
							<?php $img = array( 'src'=>'images/products/210x120/'.$f['image'] );
								echo anchor( $link, img($img) );?>
						<?php if($f['shipping'] && $f['shipping_cost']>0):?>
								<span class="free-shipping-green"></span>
							<?php endif;?>
						</div>
						<div class="thumbSetting">
							<div class="thumbTitle">
								<?php echo anchor( $link, character_limiter($f['name'], 30), 
								'class="invarseColor" style="margin-bottom:0;display:block;"')?>
								<small style="line-height:15px;position:relative;top:-5px;"><?php echo character_limiter($f['company_name'], 50);?></small>
							</div>
							<div class="thumbPrice" style="margin-top:-5px;">
								<span>
									<?php if( $f['old_price'] > $f['price'] ):;?>
										<span class="strike-through"><?php echo toc( $f['old_price'] )?></span>
									<?php endif;?>
									<?php echo toc( $f['price'] )?>
								</span>
							</div>
							
							<div class="thumbButtons">
								<?php echo anchor( $link, '<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Buy&nbsp;Now',
								'class="btn btn-primary btn-sm"');?>
								
								<!--
								<button class="btn btn-small" data-title="Add to WishList" data-placement="top" rel="tooltip">
									<span class="glyphicon glyphicon-heart"></span>
								</button>
								<button class="btn btn-small" data-title="Add to Compare" data-placement="top" rel="tooltip">
									<span class="glyphicon glyphicon-refresh"></span>
								</button>-->
							</div>
							<div class="rating_cont">
								<div class="rating small" data-role="rating" data-param-rating="<?php echo $f['rating'];?>" 
								data-param-vote="off"></div>
							</div>
						</div>
					</li>
				<?php if( ( ($i+1)>0 && ($i+1)%4==0) || ( $n==($i+1) && ($i+1)%4!=0 ) ) echo '</div><!--end of row'.(int)(($i/4)+1).'-->';
				endforeach;?>
				</ul>
				<br clear="all"><br clear="all"><br clear="all">
		<div class="col-xs-12">
			<ul class="pagination pull-left">
				<li class="disabled"><a style="border:none;">
				Showing <?php echo $start?> to <?php echo $current_rows?> of <?php echo $total_rows?> products
				</a></li>
			</ul>
			<ul class="pagination pull-right">
				<?php echo $this->pagination->create_links(); ?>
			</ul>
		</div><!--end pagination-->
		</div><!-- end of featured-items-->
	</div><!-- end of span12-->
</div><!-- end of row-->
