<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="panel panel-default categories">
	<div class="panel-heading">
		<h2 class="panel-title">
			<i class="glyphicon glyphicon-list"></i> Categories
		</h2>
	</div>
	<div class="accordion panel-body" id="accordion2">
		<ul class="unstyled">
			<?php foreach($categories as $c):
				if(!isset($active_cat)) $active_cat = FALSE;
				if(!isset($active_sub)) $active_sub = FALSE;
			?>
				<div class="accordion-group">
				<li>
					<div class="accordion-heading">
						<?php
						if($active_cat==$c['id'] || $active_sub==$c['id'] || in_array( $c['id'], $parents ) )
							$cls = 'class="accordion-toggle invarseColor active"';
						else $cls = 'class="invarseColor accordion-toggle"';
						//echo anchor( 'shop/categories/'.$c['id'].'/'.$c['segment'], $c['name'], $cls )?>					
	
						<a <?php echo $cls;?> data-toggle="collapse" data-parent="#accordion2" href="#collapse<?php echo $c['id'];?>">
						<?php echo $c['name'];?></a>
					
					</div>
					
					<?php if(isset($sub_categories[$c['id']])): $subs = $sub_categories[$c['id']];?>
					
					
					<?php if($active_cat==$c['id'] || $active_sub==$c['id'] || in_array( $c['id'], $parents ) )
							$cls = 'class="accordion-body collapse in"';
						else $cls = 'class="accordion-body collapse"';?>
					
					<div id="collapse<?php echo $c['id'];?>" <?php echo $cls;?>>
						<div class="accordion-inner">
					<ul class="submenu">
						<?php echo '<small>'.anchor('shop/categories/'.$c['id'].'/'.$c['segment'],
							'view all ...', 'class="invarseColor"').'</small>';?>
						<?php foreach($subs as $sub):
						if($active_cat==$sub['id'] ) $cls = 'class="invarseColor active"'; else $cls = 'class="invarseColor"';
						?>
							<li><?php echo anchor( 'shop/categories/'.$sub['id'].'/'.$sub['segment'], $sub['name'], $cls );?>
								<?php if(
									 ( $active_cat==$sub['id'] || in_array( $sub['id'], $parents ) ) 
									 && !empty($category_subs) 
									):?>
								<ul>
									<?php foreach($category_subs as $cs):
										if( $active_cat==$cs['id'] || in_array( $cs['id'], $parents ) ) $cls = 'class="invarseColor active"'; else $cls = 'class="invarseColor"';
									?>
										<li><?php echo anchor( 'shop/categories/'.$cs['id'].'/'.$cs['segment'], $cs['name'], $cls );?></li>
									<?php endforeach;?>
								</ul>
								<?php endif;?>
							</li>	
						<?php endforeach;
						//if(count($subs)>3)
							?>
					</ul>
					</div></div>
					<?php else:?>
					
					<div id="collapse<?php echo $c['id'];?>" class="accordion-body collapse">
						<div class="accordion-inner">
					<ul class="submenu">
						<?php echo '<small>'.anchor('shop/categories/'.$c['id'].'/'.$c['segment'],
							lang('view-all').'...', 'class="invarseColor"').'</small>';?>
						
					</ul>
					</div></div>
					
					<?php endif?>
				</li></div>
			<?php endforeach;?>
			</ul></div>
			
			
			
			
		</div><!--end categories-->










		
		<?php if(0>1):?>
		<div class="pro-range-slider">
			<div class="titleHeader clearfix">
				<h3>Shop By Price</h3>
			</div><!--end titleHeader-->
			<div class="price-range">
				<p class="clearfix">
				<?php echo form_open( 'shop/categories', array( 'class'=>'form-inline' ) );?>
					<label>Price: $</label>
					<input type="text" id="min_amount" name="min_price"><span class="pull-left">&nbsp; -- $</span>
					<input type="text" id="max_amount" name="max_price">
					<button name="filter_price" type="submit" class="btn btn-mini" 
						data-title="Apply Filter" data-placement="top" rel="tooltip"><span class="glyphicon glyphicon-filter"></span></button>
					<input type="hidden" id="category_max_price" value="<?php echo $max_price;?>">
				</form>
				</p>
				<div id="slider-range"></div>
			</div>
		</div><!--end pro-range-slider-->
		<?php endif;?>
		
		<div class="hidden-xs">
		<?php
			//$this->load->view("$theme/banners/220x300.tpl");
			//echo br(2);
			//$this->load->view("$theme/banners/sidebar-adwords.tpl");
			//echo br(2);
			//$this->load->view("$theme/banners/dfp-sidebar.tpl");
		?>
		</div>


<?php if(!$this->flexi_auth->is_logged_in()):
	$this->load->view("$theme/common/sidebar_newsletter.tpl");
endif;?>
