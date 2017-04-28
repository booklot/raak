<section class="twenty_five">
	<?php if(isset($view_single)):?>
	<div class="breadcrumb">
		<span>You are here: 
		<?php echo anchor( base_url(), 'Home' ).' :: ';
			foreach($trail as $k=>$v):
				if($v['l']==1) echo anchor('shop', 'Shop').' :: ';
				else echo anchor( 'shop/categories/'.$v['id'].'/'.$v['segment'], $v['name'] ).' :: ';
			endforeach;
			echo anchor('shop/categories/'.$page['id'].'/'.$page['segment'], $page['name']);?>
		</span>
	</div> <!-- end of breadcrumb -->
	<?php endif?>

	<?php if(isset($view_single)):?>

	<div class="product_categories">
		<h2><?php echo $page['name']?></h2>
		<?php if(!isset($products['error'])):
		foreach( $products as $p ):?>
			<p>
				<span style="float:left"><?php echo anchor( 'shop/products/'.$p['id'].'/'.$p['segment'] ,img( 'images/products/210x120/'.$p['image'] ));?></span>
				<strong><?php echo $p['name']?></strong>
			</p>
		<?php endforeach;
		endif;?>
	</div> <!-- end of product_categories -->

	<?php else:?>
	<div class="clear"></div>
	<div class="bcolumn">
		<h1 class="cbc">Categories</h1>

		<?php foreach($categories as $c):?>
			<div class="product_categories lg">
				<h2><?php echo anchor( 'shop/categories/'.$c['id'].'/'.$c['segment'], $c['name'] )?></h2>
				<ul>
				<?php if(isset($sub_categories[$c['id']])):
				$subs = $sub_categories[$c['id']];
				foreach($subs as $sub):?>
					<li><?php echo anchor( 'shop/categories/'.$sub['id'].'/'.$sub['segment'], $sub['name'] )?></li>	
				<?php endforeach;
				if(count($subs)>3)
					echo '<small style="margin-right:30%">'.anchor('shop/categories/'.$c['id'].'/'.$c['segment'],'more ...','style="color:#38B0E3;"').'</small>';
				endif?>
				</ul>
	
			</div>

		<?php endforeach; endif;?>
	</div> <!-- end of bcolumn -->
</section> <!-- end of seventy_five -->


<div class="seventy_five">
	<div id="product_search">
		<div class="bcolumn">
			<h1 class="cbl">Search</h1>
			<?php $attr = array('name'=>'search', 'id'=>'product_search_form', 'method'=>'get');
			echo form_open('shop/search',$attr);?>
				<p>
					<input type="search" name="q" placeholder="search for products" value="<?php echo $this->input->get('q')?>"
					class="search_input" required>
					<input type="submit" name="why" value="search" class="btn-blue search_submit">
					<input type="hidden" name="search" value="products">
				</p>
			</form>
		</div>
	</div> <!-- end of product search -->

	<br clear="all"><br clear="all">
	
	<div class="bcolumn">
		<?php if(!isset($featured['error'])):?>
		<h1 class="cbl">Featured Products</h1>
		<div class="pcolumn">
			<?php foreach($featured as $f):?>
			<article class="featured_product">
				<span><?php echo anchor( 'shop/products/'.$f['id'].'/'.$f['segment'], img('images/products/100x75/'.$f['image']) )?></span>
				<div class="fifty lb">
					<h4><?php echo anchor( 'shop/products/'.$f['id'].'/'.$f['segment'], $f['name'])?></h4><br clear="all">
					<p><?php echo character_limiter($f['overview'],200);?></p>
					
				</div> <!-- end of left -->
				<div class="fifteen tright" style="float:right;">
					<div class="pcolumn shop_options">
					<?php if( $f['price']>0 && $f['num_shops']>0 ):
						if($f['num_shops']>0): $s = $f['shops'];endif;
						echo form_open('shopping_cart/add_to_cart');?>
						<input type="submit" name="add_to_cart" value="Add to Cart" class="add_to_cart">
						<p class="cart_q">
						<input type="number" name="pq" value="1"><label>Qty:</label>
						</p>
						<input type="hidden" name="product_id" value="<?php echo $f['id']?>">
						<input type="hidden" name="form_name" value="add_to_cart">
						<input type="hidden" name="shop" value="<?php if($f['num_shops']==1) echo $s[0]['id']; else echo 0;?>">
						</form>
						<?php
						echo '<small>'.anchor( current_url().'?atcl='.$f['id'], 'Add to Compare List', 'style="padding:0;height:15px;"' ).'</small>';
						echo '<small>'.anchor( current_url().'?atwl='.$f['id'], 'Add to Wish List', 'style="padding:0;height:15px;"' ).'</small>';
					endif;?>
					</div>
				</div>
				<div class="fifteen tright" style="float: right;">
					<div class="pcolumn">
					<?php if( $f['price']>0 ):?>
					<p><small>from</small> <strong style="display: inline-block;"><?php echo toc( tax_price( $f['tax_rate'], $f['price'] ) );?></strong> <small>(inc. tax)</small><br>
					<span style="color: #777; cursor:default;"><strong><?php echo toc( $f['price'] );?></strong> <small>(exc. tax)</small></span><br>
						<?php if($f['num_shops']>0):
						$s = $f['shops'];?>
						<span style="color: #777; cursor:default;" title="<?php if($f['num_shops']==1) echo $s[0]['name'];?>" >
							available in <?php if($f['num_shops']==1) echo ' 1 shop'; else echo $f['num_shops'].' shops '; ?>
						</span>
						<?php endif;?>
					</p>
					<?php endif;?>
					</div>
				</div>
			</article>
		<?php endforeach; endif;?>
		</div> <!-- end of pcolumn [ padded column ] -->
	</div> <!-- end of bcolumn [ bordered column ]-->

</div> <!-- end of seventy_five -->


