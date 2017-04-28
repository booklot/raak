<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<br clear="all"><br clear="all">
<div class="col-sm-9">
	<div class="register block block-info">
	
		<h3 class="title_block">Update Account</h3>
		<br clear="all"><br clear="all">
		<?php echo form_open(current_url(), 'class="form-horizontal block_content"'); ?>  	
		<legend>&nbsp;&nbsp;&nbsp;&nbsp;1. Personal Details</legend>
			<div class="form-group">
				<label class="control-label col-sm-4" for="first_name">First Name:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="first_name" name="update_first_name" value="<?php echo $user['fname'];?>" 
					class="form-control" required>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="last_name">Last Name:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="last_name" name="update_last_name" value="<?php echo $user['surname'];?>" 
					class="form-control" required>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="occupation">Occupation:</label>
				<div class="col-sm-6">
					<input type="text" id="occupation" name="occupation" value="<?php echo $user['occupation'];?>" 
					class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="company">Company / Organization:</label>
				<div class="col-sm-6">
					<input type="text" id="company" name="company" value="<?php echo $user['company'];?>" 
					class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="bio">About You</label>
				<div class="col-sm-6">
					<textarea id="bio" placeholder="brief info about you" 
					name="update_bio" class="form-control"><?php echo $user['bio']?></textarea>
				</div>
			</div>

		<legend>&nbsp;&nbsp;&nbsp;&nbsp;2. Contact Details</legend>
			<div class="form-group">
				<label class="control-label col-sm-4" for="phone_number">Cellphone Number:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="phone_number" name="update_phone_number" value="<?php echo $user['phone'];?>" 
					class="form-control" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="alt_phone_number">Alt. Phone Number:</label>
				<div class="col-sm-6">
					<input type="text" id="alt_phone_number" name="alt_phone_number" value="<?php echo $user['alt_phone'];?>" 
					class="form-control">
				</div>
			</div>
						
		
		<legend>&nbsp;&nbsp;&nbsp;&nbsp;3. Login Details</legend>
			<div class="form-group">
				<label class="control-label col-sm-4" for="email_address">Email Address:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="email_address" name="update_email" value="<?php echo $user['email'];?>" 
					class="form-control" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="username">Username:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="username" name="update_username" value="<?php echo $user['username'];?>" 
					class="form-control" required>
				</div>
			</div>
			
			<?php if( $this->input->get('fb_username') || $this->input->post('fb_username') ):?>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="fb_username">Facebook Username:<span class="required">*</span></label>				
				<?php $fbu = $this->input->post('fb_username') ? $this->input->get('fb_username') : $this->input->get('fb_username');?>
				<div class="col-sm-6">
					<input type="text" id="fb_username" name="fb_username" value="<?php echo $fbu;?>" 
					class="form-control" required>
				</div>
			</div>
			
			<?php endif;?>
			
			
			<?php if( $this->input->get('fb_connected') || $this->input->post('fb_connected') ):?>
			
			<div class="form-group">
				<div class="col-sm-6">
					<label class="checkbox" for="fb_connected">Connect Facebook Account:
					<?php $con = $this->input->post('fb_connected') ? $this->input->get('fb_connected') : $this->input->get('fb_connected');?>
						<input type="checkbox" id="fb_connected" name="fb_connected" value="1"  <?php if($con) echo 'selected';?>>
					</label>
				</div>
			</div>
			
			<?php endif;?>
			
			
			<?php if( $this->input->get('fb_access_token') || $this->input->post('fb_access_token') ):
				$act = $this->input->post('fb_access_token') ? $this->input->get('fb_access_token') : $this->input->get('fb_access_token');?>
				<input type="hidden" name="fb_access_token" value="<?php echo $act;?>">
			<?php endif;?>
	
		<legend>&nbsp;&nbsp;&nbsp;&nbsp;4. Update</legend>
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-4">
					<?php echo  anchor( 'account', 'Cancel', 'class="btn btn-default"' )?>
					<input type="submit" name="update_account" id="submit" value="Update" class="btn btn-primary">
				</div>
			</div>
		<?php echo form_close();?>
	</div>
</div>
