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
				<span class="fa fa-dot-circle-o"></span>
				<span class="accordion-toggle">Order Received</span>
			</h4>
		</li>
	</ol>

	<br clear="all"><br clear="all"><br clear="all">
	<div class="col-sm-4 col-sm-offset-4">
		<h3 class="text-center">Your order is being reviewed</h3>
		<p class="text-center">
			Your order is now being reviewed by our sales team to confirm that all the items you ordered are available in stock. 
		</p>
		
		<br clear="all">
		<p class="text-center">
			<?php echo anchor( "orders/{$invoice_num}", 'View Order', 
				['class'=>"btn btn-block btn-danger center-block", 'style'=>'max-width: 280px;'] );?>
		</p>
		<p class="text-center">
			<?php echo anchor( 'orders', 'Order History', 
				['class'=>"btn btn-block btn-default center-block", 'style'=>'max-width: 280px;'] );?>
		</p>
	</div>



</div>
