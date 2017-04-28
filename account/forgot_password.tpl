<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="col-sm-9">
	<div class="register block block-info">
		<h3 class="title_block">Forgot Password</h3>

		<?php echo form_open(current_url(), 'class="form-horizontal"');	?> 	
			<legend>&nbsp;&nbsp;&nbsp;Enter Your Details</legend>
				<div class="form-group">
					<label class="control-label col-sm-4" for="identity">Email or Username:</label>
					<div class="col-sm-6">
						<input type="text" id="identity" name="forgot_password_identity" class="form-control input-sm" 
							title="Please enter either your email address or username defined during registration.">
					</div>
				</div>
		
				<div class="form-group">
					<div class="col-sm-6 col-sm-offset-4">
						<?php echo anchor( base_url(), 'Cancel', 'class="btn btn-default"' );?>
						<input type="submit" name="send_forgotten_password" id="submit" value="Submit" class="btn btn-primary"/>
					</div>
				</div>
		
				<div class="form-group">
					<div class="col-sm-11 col-sm-offset-1">
						<small>Note: The password must be reset within 15 minutes of the 'forgotten password' email being sent.</small>
					</div>
				</div>
		<?php echo form_close();?>
	</div>
</div>
