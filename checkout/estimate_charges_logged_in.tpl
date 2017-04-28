<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<form class="form-horizontal" id="estimate_shipping">
	<?php $check = $this->session->userdata('cart_progress');?>

		<div class="form-group">
			<label class="control-label col-sm-4" for="billing_address">
				<strong>Billing Address</strong>
			</label>
			<div class="col-sm-8">
				<select class="form-control input-sm" name="billing_address" id="billing_address" required>
					<option value="0">-- select your address --</option>
					<?php 
					if(!isset($user_locations['error'])):
						if( isset($check[2]['billing_address']) )
							$b = $check[2]['billing_address'];
						else $b = 0;
						foreach( $user_locations as $ul ):?>
					<option value="<?php echo $ul['id']?>" <?php if($b==$ul['id']) echo 'selected';?>>
					<?php echo $ul['full_address']?></option>
				<?php endforeach;
			endif;?>
				</select>
			</div>
		</div><!--end form-group-->

		<div class="form-group">
			<label class="control-label col-sm-4" for="delivery_address">
				<strong>Delivery Address</strong>
			</label>
			<div class="col-sm-8">
				<select class="form-control input-sm" name="delivery_address" 
					id="delivery_address" required>
					<option value="0">-- select your address --</option>
					<?php 
					if(!isset($user_locations['error'])):
						if( isset($check[3]['delivery_address']) )
						$c = $check[3]['delivery_address'];
					else $c = 0;
					foreach( $user_locations as $ul ):?>
					<option value="<?php echo $ul['id']?>" <?php if($c==$ul['id']) echo 'selected';?>>
					<?php echo $ul['full_address']?></option>
				<?php endforeach;
			endif;?>
				</select>
			</div>
		</div><!--end form-group-->

		<div class="form-group">
		<label class="control-label col-sm-4">
			<strong>Shipping Method</strong>
			</label>
			<div class="col-sm-8">
				<select class="form-control input-sm" name="shipping_method" id="shipping_method" required>
					<option value="0">-- select shipping method --</option>
					<?php 
					if(!isset($ship['error'])):
						if( isset($check[4]['delivery_method']) && $this->flexi_auth->is_logged_in() )
							$d = $check[4]['delivery_method'];
						else $d = 0;
						foreach( $ship as $s ):?>
					<option value="<?php echo $s['id']?>" <?php if($d==$s['id']) echo 'selected';?>>
				<?php echo $s['name']?></option>
				<?php endforeach;
			endif;?>
				</select>
			</div>
		</div><!--end form-group-->

		<div class="form-group">
			<label class="control-label col-sm-4" for="payment_method">
				<strong>Payment Method</strong>
			</label>
			<div class="col-sm-8">
				<select class="form-control input-sm" name="payment_method" id="payment_method">
					<option value="0">-- select payment method --</option>
					<?php 
					if(!isset($payment['error'])):
						if( isset($check[5]['payment_method']) )
						$e = $check[5]['payment_method'];
						else $e = 0;
						foreach( $payment as $p ):?>
						<option value="<?php echo $p['id']?>" <?php if($e==$p['id']) echo 'selected';?>>
						<?php echo $p['name']?></option>
						<?php endforeach;
					endif;?>
				</select>
			</div>
		</div><!--end form-group-->
		
		<div class="form-group">
			<div class="col-sm-8 col-sm-offset-3">
			<?php if($this->flexi_auth->is_logged_in()):?>
				<input type="hidden" name="user_id" value="<?php echo $this->flexi_auth->get_user_id();?>" 
					id="user_id">
				<button type="button" id="estimate_charges" 
					class="btn btn-primary btn-sm pull-right">Get Quotes</button>
			<?php else: echo anchor( 'account/login', 'Get Quotes', 'class="btn btn-primary btn-sm"' ); endif;?>
			</div>
		</div><!--end form-group-->
</form>
