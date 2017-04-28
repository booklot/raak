<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<br clear="all"><br clear="all">
<section class="col-sm-9">
	<div class="register block block-info">
	
		<h3 class="title_block"><?php echo 'Add Address Book Entry';?></h3>
		<br clear="all"><br clear="all">

		<?php echo form_open(current_url(), 'class="form-horizontal block_content"');?>
			
			<legend>&nbsp;&nbsp;&nbsp;Enter Address</legend>
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
						<option label="<?php echo $c['name']?>" value="<?php echo $c['name']?>" />
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
						<option label="<?php echo $l['name']?>" value="<?php echo $l['name']?>" />
						<?php endforeach;?>
					</select></datalist>
					
				</div>
			</div>
				
			<div class="form-group">
				<label for="street" class="control-label col-sm-4">Street <small>/ nearest road</small> <span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="street" name="street"  value="<?php echo $this->input->post('street')?>" 
					class="form-control input-sm">
				</div>
			</div>
			
			<div class="form-group">
				<label for="address" class="control-label col-sm-4">Address / Stand No. <span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="address" name="address" value="<?php echo $this->input->post('address')?>" 
					class="form-control input-sm" required>
				</div>
			</div>
				
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-4">
					<?php echo  anchor( 'account/address_book', 'Cancel', 'class="btn btn-default"' )?>
					<input type="submit" name="add_address" id="submit" value="Submit" class="btn btn-primary">
				</div>
					<input type="hidden" name="form_name" value="address_book">
					<input type="hidden" name="form_type" value="insert">
			</div>
		<?php echo form_close();?>
		<!-- form -->
	</div>
</section> <!-- end of span9 -->
