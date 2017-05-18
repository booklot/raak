<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

			
<div id="discount" class="col-xs-12">
	<?php echo form_open( 'shopping_cart/discount_coupon', 'class="form-horizontal"' )?>
		<div class="form-group">
			<label class="control-label">Discount Coupon</label>
			<div class="input-group">
				<input type="text" id="inputDiscount" placeholder="Enter Coupon Code..." name="coupon" 
					class="form-control"  style="text-transform:uppercase;" required>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="submit">Apply Coupon</button>
				</span>
			</div>
			<!-- /input-group -->
			<?php if($this->session->userdata('cart_coupon'))
				echo anchor( 'shopping_cart/remove_coupon', 'Remove Coupon', 'class="btn btn-default btn-sm"' );?>
		</div>
		<!--end form-group-->
	</form>
</div>
