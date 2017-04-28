<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<div class="col-md-3">
	<div class="sidebar">
		<?php $this->load->view("$theme/shop/category_nav.tpl");?>
		<?php //echo nested_ul($categories, 'children', 'ul', 'nav');?>
	</div>
</div>

<div class="col-md-9">

	<div class="row">
		<div class="col-sm-12">
			<div class="featuredItems">
				<!--  --
				<div class="titleHeader clearfix">
					<h3><?php echo $page['name'];?></h3>
					<div class="pagers">
					</div>
				</div>
				<!--end titleHeader-->
				<?php $this->load->view("$theme/shop/productFilter.tpl");?>

				<?php $this->load->view("$theme/shop/grid2.tpl");?>
				
			</div>
			<!-- featuredItems -->
		</div>
		<!-- col-sm-12 -->
		
		<div class="col-xs-12">
			<ul class="pagination pull-left" style="margin: 0;">
				<li class="disabled">
					<a style="border:none;">
						Showing <?php echo $start?> to <?php echo $current_rows?> of <?php echo $total_rows?> products
					</a>
				</li>
			</ul>
			<ul class="pagination pull-right" style="margin: 0 0 5px 0;">
				<?php echo $this->pagination->create_links(); ?>
			</ul>
		</div>
		<!--end pagination-->
		
	</div>
	<!-- row -->
	
</div>
