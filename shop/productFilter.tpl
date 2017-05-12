<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="productFilter clearfix">
		<?php echo form_open( current_url(), array( 'class'=>'form-inline productsSortForm' ) );?>
			<?php if(2>1):?>
			<div class="compareItem inline pull-left">
				<?php //echo anchor( 'compare', 'Product Compare (0)', 'class="btn"');?>
				<?php echo $page['name']; 
					echo (isset($total_rows) && $total_rows>0)?" ({$total_rows})":'';
				?>
			</div><!--end compareItem-->
			<?php endif;?>

			<div class="displaytBy inline pull-right">
				<?php $class = $this->router->fetch_class();
					$cur = full_url();
					$uris = $this->uri->uri_string();
					$print = str_replace( $class, 'printpage', $uris );
					$print_url = str_replace( $uris, $print, $cur );
					echo anchor( $print_url, '<span class="glyphicon glyphicon-print"></span>', 
						'target="_blank" class="btn btn-default btn-sm" title="print"' );
				?>
			</div>
			<!--end displaytBy-->
			<div class="showItem inline pull-right">
				Show 
				<?php $args = array( 'id'=>'perpage', 'class'=>'btn btn-default btn-sm', 'onchange'=>"this.form.submit()" );
					$c = $this->config->item('items_per_page');
					foreach($c as $v) $options[$v] = $v;
					echo form_dropdown( 'per_page', $options, $per, $args );
				?>
			</div>
			<!--end sortBy-->
			<div class="sortBy inline pull-right">
				Sort By 
				<select class="btn btn-default btn-sm" name="sort" onchange="this.form.submit()">
					<?php $sorts = $this->config->item('product_sort');
						if(!isset($q)) unset($sorts[1]);
						foreach($sorts as $k=>$v):
							if( $k==$sort_id ) $s='selected'; else $s='';
					?>
						<option value="<?php echo $k;?>" <?php echo $s;?>><?php echo $v['n']?></option>
					<?php endforeach;?>
				</select>
			</div>
			
			<!-- <div class="hidden"><input type="submit" name="submit" id="submit"></div> -->
			<?php if( isset($q) ):?>
				<input type="hidden" name="q" value="<?php echo $q;?>">
					<input type="hidden" name="category" value="<?php echo $cat;?>">
			<?php endif;?>
		</form>
</div> <!-- end of productFilter -->

<?php if(0>1):?>
	<br clear="all">
	<div class="well hidden-print" style="background-color:white;border:none;border-radius:0">
		<br clear="all"><br clear="all">
		<div class="layout-slider container hidden">
			<div class="col-lg-2 col-md-2 col-sm-3">Price Range: </div>
			<div class="col-lg-10 col-lg-10 col-sm-9">
				<span style="display: inline-block; width: 100%; padding: 0 5px;">
					<input id="jprice_slider" type="slider" name="price" value="0;<?php echo $max_price?>" />
				</span>
			</div>
		</div>
		<div class="page-loading" id="page-loading"></div>
		<div class="pips-range" id="pips-range"></div>
		<br clear="all"><br clear="all">
		<input type="hidden" id="category_min_price" value="<?php echo 0;?>">
		<input type="hidden" id="category_max_price" value="<?php echo $max_price;?>">
		<input type="hidden" id="min_price" value="<?php echo 0;?>">
		<input type="hidden" id="max_price" value="<?php echo $max_price;?>">
	</div>
<?php endif;?>
