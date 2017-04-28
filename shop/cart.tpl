<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<table class="table" id="shopping-cart">
	<thead>
		<tr>
			<th colspan="2">&nbsp;&nbsp;Item</th>
			<th colspan="2">Shop</th>
			<th class="">Qty / Action</th>
			<th class="tright">Unit Price&nbsp;</th>
			<th class="tright">Tax&nbsp;</th>
			<th class="tright">Total <small>(inc. tax)</small>&nbsp;</th>
		</tr>
	</thead>
	<tbody id="cart_contents">
		<?php $this->load->view( $theme.'/shop/cart_contents.tpl' );?>
	</tbody>
</table>


<div class="container">
<div class="col-sm-7" style="padding-left:0;padding-top:60px;margin-left:0;">

	<div class="panel-group" id="cart-acc">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#discount">
						<i class="icon-caret-right"></i> Apply Discount Coupon
					</a>
				</h4>
			</div>
			
			<div id="discount" class="panel-collapse collapse in">
				<div class="panel-body">
					<?php echo form_open( 'shopping_cart/discount_coupon', 'class="form-horizontal"' )?>
							<div class="form-group">
								<label class="control-label col-sm-4" for="inputDiscount">
									<strong>Coupon Code</strong>
									</label>
								<div class="col-sm-8">
									<input type="text" id="inputDiscount" placeholder="Enter Coupon Code..." name="coupon" 
									class="form-control"  style="text-transform:uppercase;" required>
								</div>
							</div><!--end form-group-->
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-4">
									<?php if($this->session->userdata('cart_coupon'))
											echo anchor( 'shopping_cart/remove_coupon', 'Remove Coupon', 
											'class="btn btn-default btn-sm"' );?>
									<button type="submit" class="btn btn-primary btn-sm pull-right">Apply Coupon</button>
								</div>
							</div><!--end form-group-->
						</form>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#voucher">
						<i class="icon-caret-right"></i> Use Gift Voucher
					</a>
				</h4>
			</div>
			
			<div id="voucher" class="panel-collapse collapse">
				<div class="panel-body">
					<form class="form-horizontal">
							<div class="form-group">
								<label class="control-label col-sm-4" for="inputVoucher">
									<strong>Voucher Code</strong>
									</label>
								<div class="col-sm-8">
									<input type="text" id="inputVoucher" placeholder="Enter Voucher Code..."
									class="form-control">
								</div>
							</div><!--end form-group-->
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<button type="submit" class="btn btn-primary btn-sm pull-right">Apply Voucher </button>
								</div>
							</div><!--end form-group-->
						</form>
				</div>
			</div>
		</div>
	</div>

</div><!--end span6-->
	
<div class="col-sm-5">
	<div class="cart-receipt">
		<?php $this->load->view($theme.'/shop/cart_receipt.tpl');?>
	</div>
</div> <!-- end of span5-->

</div>
<!-- container -->
