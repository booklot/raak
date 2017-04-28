<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<form class="form-horizontal" id="estimate_shipping">
	<?php $check = $this->session->userdata('cart_progress');?>

		<div class="form-group">
			<label class="control-label col-sm-4" for="billing_address">
				<strong>Country</strong>
			</label>
			<div class="col-sm-8">
				<?php $cnt = $city = array();
				foreach($countries as $c):
					$cnt[] = array( 'id'=>$c['id'], 'name'=>$c['name'] );
				endforeach;
				foreach($cities as $c):
					$city[] = array( 'id'=>$c['id'], 'name'=>$c['name'] );
				endforeach;
				?>
				<input type="hidden" id="countries" value="<?php echo htmlentities(json_encode($cnt))?>">
				<input type="hidden" id="cities" value="<?php echo htmlentities(json_encode($city))?>">
				<div id="magic_country"></div>
			</div>
		</div><!--end form-group-->

		<div class="form-group">
			<label class="control-label col-sm-4" for="delivery_address">
				<strong>City</strong>
			</label>
			<div class="col-sm-8">
				<div id="magic_city"></div>
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
			<div class="col-sm-8 col-sm-offset-3">
					<?php echo anchor( 'account/login', 'Get Quotes', 'class="btn btn-primary btn-sm"' );?>
			</div>
		</div><!--end form-group-->
</form>
