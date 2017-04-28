<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<div class="order-stages">
	<ol class="breadcrumb">
		<li>
			<h4 class="panel-title">
				<span class="fa fa-check-circle green"></span>
				<span class="accordion-toggle light">Customer Information</span>
			</h4>
		</li>
	</ol>
	<ol class="breadcrumb">
		<li>
			<h4 class="panel-title">
				<span class="fa fa-check-circle green"></span>
				<span class="accordion-toggle light">Order Details</span>
			</h4>
		</li>
	</ol>
	<ol class="breadcrumb">
		<li>
			<h4 class="panel-title">
				<span class="accordion-toggle">
					Confirm Order
				</span>
			</h4>
		</li>
	</ol>
	
	
	<div class="col-sm-10 col-sm-offset-1">
		<?php $this->load->view($theme.'/checkout/cart.tpl.php');?>
	</div>
	<!-- col-sm-10 cart.tpl -->

</div>
<!-- order-stages -->
