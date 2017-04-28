<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<table class="table table-condensed shopping-cart" id="shopping-cart">
	<thead>
		<tr>
			<th colspan="2">&nbsp;&nbsp;Item</th>
			<!-- <th colspan="2">Shop</th> -->
			<th class="">Qty / Action</th>
			<th class="tright">Unit Price&nbsp;</th>
			<th class="tright">Discount&nbsp;</th>
			<th class="tright">Tax&nbsp;</th>
			<th class="tright">Total <small>(inc. tax)</small>&nbsp;</th>
		</tr>
	</thead>
	<tbody id="cart_contents">
		<?php $this->load->view( $theme.'/checkout/cart_contents.tpl.php' );?>
	</tbody>
</table>

<div class="">
	<div class="col-sm-6" style="padding-left:0;padding-top:0px;margin-left:0;">

		<div class="panel-group" id="cart-acc">
			<?php $this->load->view("{$theme}/checkout/new/coupon.tpl.php");
				//$this->load->view("{$theme}/checkout/new/voucher.tpl.php");
			?>
		</div>
		<!-- panel-group cart-acc -->

	</div><!--end col-sm-7-->
	
	<div class="col-sm-5 col-sm-offset-1">
		<div class="cart-receipt">
			<?php $this->load->view($theme.'/checkout/cart_receipt.tpl.php');?>
		</div>
	</div> <!-- end of span5-->

</div>
<!-- container -->
