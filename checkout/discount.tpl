<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="panel panel-default">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#discount">
				<i class="icon-caret-right"></i> Apply Discount Coupon
			</a>
		</h4>
	</div>
	<div id="discount" class="panel-collapse collapse">
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
		</div><!-- panel-body -->
	</div><!-- discount -->
</div><!-- panel-default -->
