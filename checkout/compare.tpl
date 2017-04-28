<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

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
		$attributes = isset($wishlist['attributes'])?$wishlist['attributes']:array();
	}
	$share = array( 'list_id'=>$list_id, 'shared_list'=>$shared_list );
?>
<div class="col-sm-12">
<div class="block block-default">
	<h3 class="title_block">
			<form class="form-inline">
			<label class="control-label" style="color:#fff">Product Compare</label>
			<select class="form-control input-sm" style="padding: 1px 2px;height:25px;line-height:25px;" 
				 onchange="location = this.options[this.selectedIndex].value;">
				 <option value="<?php echo site_url('compare');?>">Compare All Items</option>
				<?php foreach($lists as $k=>$v):
					if($list_id==$k) $s='selected'; else $s='';
				?>
				<option value="<?php echo site_url('compare/'.$k)?>" <?php echo $s?>><?php echo $v['name']?></option>
				<?php endforeach;?>
			</select>
			</form>
	</h3>
	
	<div class="block_content">
		<?php if(is_numeric($list_id) && $list_id>0)
			$this->load->view("$theme/shop/sharelist.tpl", $share);
		
			$n = count($data);
			if($n==0) $n=1;
			$w = (100/($n+1)) + ( ( (100/($n+1))/2 ) / $n );
		?>
		<table border="1" class="table table-bordered table-responsive table-hover compare">
			<thead>
				<tr>
					<tr>
						<td></td>
						<?php foreach($data as $i=>$f):?>
							<td style="width:<?php echo $w?>%;">
								 <?php echo anchor( "shopping_cart/remove_compare_item/{$f['id']}/$list_id", '&times;', 
									'class="close" title="remove"' );?>
							</td>
						<?php endforeach;?>
					</tr>
					<th></th>
					<?php foreach($data as $f):
						if($f['shop_id']>0):
							if($f['permalink']) $link = $f['company_segment']."/products/{$f['product_id']}/{$f['segment']}";
							else $link = "shops/{$f['company_id']}/{$f['company_segment']}/products/{$f['product_id']}/{$f['segment']}";
						else:
							$link = "shop/products/{$f['product_id']}/{$f['segment']}";
						endif;
					?>
						<th>
						<?php 
							$img = array( 'src'=>"images/products/280x160/{$f['image']}", 'class'=>'img-responsive' );
							echo anchor( $link, img($img), 'target="_blank"' );
						?>
						</th>
					<?php endforeach;?>
				</tr>
				<tr>
					<th><?php if($n>0) echo 'Name'; else echo 'You do not have any items in your compare list.';?></th>
					<?php foreach($data as $t):?>
						<th><?php echo anchor( $link, $t['name'], 'class="invarseColor" target="_blank"');?></th>
					<?php endforeach;?>
				</tr>
			</thead>
			<tbody>
				<?php if($n>0):?>
					<tr>
						<th>Price</th>
						<?php foreach($data as $f):?>
							<td>
								<?php if($f['old_price']>$f['price']):?>
								<span class="old-price product-price" style="font-weight:400"><?php echo toc($f['old_price'])?></span>
								<?php endif;?>
								<span class="product-price"><?php echo toc($f['price'])?></span>
							</td>
						<?php endforeach;?>
					</tr>
					<tr>
						<th>Overview</th>
						<?php foreach($data as $f):?>
							<td>
								<?php if(isset($f['summary'])) echo $f['summary']; else echo $f['d_summary'];?>
							</td>
						<?php endforeach;?>
					</tr>
				<?php endif;?>
				<?php foreach($attributes as $k=>$item):?>
					<tr>
						<?php 
							foreach(range(0, $n) as $i):
								if( isset( $item[$i] ) ):
						?>
									<td style="<?php if($i==0) echo 'font-weight:600';?>" 
										title="<?php if($i>0) echo $list[$i-1]['name'];?>">
										<?php echo nl2br($item[$i]['value']);?>
									</td>
							<?php else:?>
									<td title="<?php if($i>0) echo $list[$i-1]['name']?>"></td>
							<?php endif;
							endforeach;
						?>
					</tr>
				<?php endforeach;?>
			</tbody>
		</table>
	
	</div>
</div>
</div>




<br clear="all">
<div class="container">
	<?php $this->load->view( $theme.'/shop/recently-viewed.tpl' );?>
</div><!-- container -->

