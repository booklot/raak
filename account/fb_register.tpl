<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="col-sm-9">
	<div class="register block block-info">
		<h3 class="title_block">Create New Account</h3>
				
	<?php echo form_open('account/fb_register', 'class="form-horizontal"'); ?>
		<legend>&nbsp;&nbsp;&nbsp;Personal Details</legend>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="first_name">First Name:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="first_name" name="register_first_name" 
						value="<?php echo $this->input->post('register_first_name');?>" 
						class="form-control input-sm" required>
				</div>
				<?php $ttp = array( 'class'=>'', 'data-toggle'=>'popover', 'title'=>'', 'data-original-title'=>'Note: First Name',
					'data-content'=>'You can also include your Middle Name or initials',
					'style'=>'text-decoration:none; display:inline-block;padding: 5px 2px;' );
					echo anchor( current_url().'#', '<span class="glyphicon glyphicon-info-sign"></span>', $ttp );?>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="last_name">Last Name:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="last_name" name="register_last_name" class="form-control input-sm" 
						value="<?php echo $this->input->post('register_last_name');?>" required>
				</div>
			</div>

		<legend>&nbsp;&nbsp;&nbsp;Contact Details</legend>
			<div class="form-group">
				<label class="control-label col-sm-4" for="phone_number">Cellphone Number:<span class="required">*</span></label>
				<div class="col-sm-6">
					<?php 
						$ccode = $this->input->post('register_ccode');
						$phone = $this->input->post('register_phone_number');
						$c = preg_replace( "/^$ccode/", '', $phone );
					?>
					<div class="input-group">
						<span class="input-group-btn">
							<input class="form-control input-sm" name="register_ccode" 
						style="min-width: 50px; background:white;border-right: 2px solid #ccc;"
						 placeholder="263" required pattern="[0-9]{1,3}" maxLength="3" 
						 value="<?php echo set_value('register_ccode')?>">
						</span>
						<input type="tel" id="phone_number" name="register_phone_number" maxlength="12"
							value="<?php echo $c;?>" class="form-control input-sm" required>
					</div><!-- /input-group -->
				</div>
					<?php $ttp = array( 'class'=>'', 'data-toggle'=>'popover', 'title'=>'', 'data-original-title'=>'Example:',
							'data-content'=>'Country Code | Phone Number e.g. 263 | 772000111',
							'style'=>'text-decoration:none; display:inline-block;padding: 5px 2px;' );
							echo anchor( current_url().'#', '<span class="glyphicon glyphicon-info-sign"></span>', $ttp );?>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="alt_phone_number">Alt. Phone Number:</label>
				<div class="col-sm-6">
					<?php 
						$ccode2 = $this->input->post('register_ccode2');
						$phone2 = $this->input->post('alt_phone_number');
						$c2 = preg_replace( "/^$ccode2/", '', $phone2 );
					?>
				
					<div class="input-group">
						<span class="input-group-btn">
							<input class="form-control input-sm" name="register_ccode2" 
							 style="min-width: 50px;max-width: 65px; background:white;border-right: 2px solid #ccc;"
							 placeholder="263" pattern="[0-9]{1,3}" maxLength="3" 
							 value="<?php echo set_value('register_ccode2');?>">
						</span>
						<input type="tel" id="alt_phone_number" name="alt_phone_number" maxlength="12"
							value="<?php echo $c2;?>" class="form-control input-sm">
					</div>
				</div>
			</div>


		<legend>&nbsp;&nbsp;&nbsp;Login Details</legend>
			<div class="form-group">
				<label class="control-label col-sm-4" for="email_address">Email Address:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="email" id="email_address" name="register_email_address" 
						value="<?php echo $this->input->post('register_email_address');?>" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="username">Username:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="username" name="register_username" class="form-control input-sm" 
						value="<?php echo $this->input->post('register_username');?>" required>
				</div>
				<?php $ttp = array( 'class'=>'', 'data-toggle'=>'popover', 'title'=>'', 'data-original-title'=>'Note: Usernames',
					'data-content'=>'Short name / nickname for easier and faster login',
					'style'=>'text-decoration:none; display:inline-block;padding: 5px 2px;' );
					echo anchor( current_url().'#', '<span class="glyphicon glyphicon-info-sign"></span>', $ttp );?>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="fb_username">Facebook Username:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="text" id="fb_username" name="fb_username" 
						value="<?php echo $this->input->post('fb_username');?>" 
						class="form-control input-sm" required>
				</div>
				<?php $ttp = array( 'data-toggle'=>'popover', 'title'=>'', 'data-original-title'=>'Note: Facebook Username',
					'data-content'=>'Your username as registerd on Facebook. Required for automatic login using facebook',
					'style'=>'text-decoration:none; display:inline-block;padding: 5px 2px;' );
					echo anchor( current_url().'#', '<span class="glyphicon glyphicon-info-sign"></span>', $ttp );?>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="password">Password:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="password" id="password" name="register_password" 
						value="<?php echo $this->input->post('register_password');?>" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="password">Password:<span class="required">*</span></label>
				<div class="col-sm-6">
					<input type="password" id="password" name="register_password" class="form-control input-sm" 
						value="<?php echo $this->input->post('register_password');?>" required>
				</div>
				<?php 
					$security = $this->config->item('security');
					$pl = $security['min_password_length']?$security['min_password_length']:8;
					$ttp = array( 'class'=>'', 'data-toggle'=>'popover', 'title'=>'', 'data-original-title'=>'Note: Passwords',
					'data-content'=>'alpha-numeric (a-z A-Z 0-9), dashes, underscores, periods and commas. Minimum of '.$pl.
					' characters required.', 'style'=>'text-decoration:none; display:inline-block;padding: 5px 2px;' );
					echo anchor( current_url().'#', '<span class="glyphicon glyphicon-info-sign"></span>', $ttp );?>
			</div>
						

		<legend>&nbsp;&nbsp;&nbsp;Register</legend>
			
			<div class="form-group">
				<label class="control-label col-sm-4"><?php echo anchor( 'shop/terms_conditions', 'Terms And Conditions', 
				'target="_blank"' );?></label>
				<div class="col-sm-6">
					<div class="checkbox">
						<label><input type="checkbox" name="register_terms" value="1" required> I Agree to Terms and Conditions
						</label>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-6">
					<?php echo anchor( base_url(), 'Cancel', 'class="btn btn-default"' );?>
					<input type="submit" name="register_user" id="submit" value="Register" class="btn btn-primary">
					<input type="hidden" name="fb_connected" value="1">
					<input type="hidden" name="fb_access_token" value="<?php $this->input->post('fb_access_token');?>">
					<input type="hidden" name="fb_token_expires" value="<?php $this->input->post('fb_token_expires');?>">
				</div>
			</div>
		<?php echo form_close();?>
	</div>
</div>
