<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="col-sm-9">
	<div class="register block block-info">
		<h3 class="title_block">Change Forgotten Password</h3>

		<?php echo form_open(current_url(), 'class="form-horizontal"');	?> 	
			<legend>&nbsp;&nbsp;&nbsp;Enter New Password</legend>
				<div class="form-group">
					<label class="control-label col-sm-4" for="new_password">New Password <span class="required">*</span></label>
					<div class="col-sm-6">
						<input type="password" id="new_password" name="new_password" value="" 
						class="form-control input-sm" required>
					</div>
				</div>
			
				<div class="form-group">
					<label class="control-label col-sm-4" for="confirm_new_password">Confirm New Password <span>*</span></label>
					<div class="col-sm-6">
						<input type="password" id="confirm_new_password" name="confirm_new_password" value="" 
						class="form-control input-sm" required>
					</div>
				</div>
			
				<div class="form-group">
					<div class="col-sm-6 col-sm-offset-4">
						<?php echo anchor( base_url(), 'Cancel', 'class="btn btn-default"' );?>
						<input type="submit" name="change_forgotten_password" id="submit" value="Submit" class="btn btn-primary">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-11 col-sm-offset-1">
						<small>
							Note: Password length must be more than <?php echo $this->flexi_auth->min_password_length(); ?> 
							characters in length.<br/>
							Only alpha-numeric, dashes, underscores, periods and comma characters are allowed.
						</small>
					</div>
				</div>
		<?php echo form_close();?>
	</div>
</div>
