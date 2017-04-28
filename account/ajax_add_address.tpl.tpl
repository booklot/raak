<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<!-- Modal -->
<div class="modal fade" id="guest_address" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<?php echo form_open('account/register', 'class="form-horizontal" id="guest_register"'); ?>
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Guest Checkout</h4>
				</div>
			
				<div class="modal-body">
					<div class="guest_address_error"></div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="company">Company:<small> ( if it's a work address )</small></label>
						<div class="col-sm-6">
							<input type="text" id="company" name="company" value="<?php echo $this->input->post('company');?>" 
							class="form-control input-sm">
						</div>
					</div>
				
					<div class="form-group">
						<label for="country" class="control-label col-sm-4">Country <span class="required">*</span></label>
						<div class="col-sm-6">
							<select name="country" id="country" class="form-control input-sm" required>
								
								<?php foreach($countries as $c):?>
								<option value="<?php echo $c['id']?>" label="<?php echo $c['name']?>"
								 <?php if($this->input->post('country')==$c['id']) echo 'selected'?>><?php echo $c['name']?></option>
								<?php endforeach;?>
							</select>
						</div>
					</div>
				
					<div class="form-group">
						<label for="city" class="control-label col-sm-4">City <span class="required">*</span></label>
						<div class="col-sm-6">
							
							<input type="text" name="city" list="city_list" class="form-control input-sm" required>
							
							<datalist id="city_list"><select name="city_id" id="city">
								<?php foreach( $cities as $c ):?>
								<option label="<?php echo $c['name']?>" value="<?php echo $c['name']?>">
								<?php endforeach;?>
							</select></datalist>
						</div>
					</div>

					<div class="form-group">
						<label for="township" class="control-label col-sm-4">Suburb / Location</label>
						<div class="col-sm-6">
							<input type="text" name="location" list="suburb_list" class="form-control input-sm">
					
							<datalist id="suburb_list"><select name="suburb_id" id="suburb">
								<?php foreach( $locations as $l ):?>
								<option label="<?php echo $l['name']?>" value="<?php echo $l['name']?>">
								<?php endforeach;?>
							</select></datalist>
					
						</div>
					</div>
				
					<div class="form-group">
						<label for="street" class="control-label col-sm-4">
							Street <small>/ nearest road</small> <span class="required">*</span>
						</label>
						<div class="col-sm-6">
							<input type="text" id="street" name="street"  value="<?php echo $this->input->post('street')?>" 
							class="form-control input-sm">
						</div>
					</div>
			
					<div class="form-group">
						<label for="address" class="control-label col-sm-4">
							Address / Stand No. <span class="required">*</span>
						</label>
						<div class="col-sm-6">
							<input type="text" id="address" name="address" value="<?php echo $this->input->post('address')?>" 
							class="form-control input-sm" required>
						</div>
					</div>
				
				</div>
			
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-primary guest_address_btn">Submit</button>
					<input type="hidden" name="form_name" value="address_book">
					<input type="hidden" name="form_type" value="insert">
				</div>

			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
