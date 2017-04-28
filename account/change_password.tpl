<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<br clear="all"><br clear="all">
<section class="col-sm-9">
	<div class="register block block-info">
		<h3 class="title_block">Change Account Password</h3>
		<br clear="all"><br clear="all">
		<?php echo form_open(current_url(), 'class="form-horizontal"');?>
			
			<legend>&nbsp;&nbsp;&nbsp;&nbsp;Enter Your Passwords</legend>
			
			<div class="form-group">
				<label class="control-label col-sm-4" for="current_password">Current Password:</label>
				<div class="col-sm-6">
					<input type="password" id="current_password" name="current_password" 
					value="<?php echo set_value('current_password');?>" class="form-control">
				</div>
			</div>
				
			<div class="form-group">
				<label class="control-label col-sm-4" for="new_password">New Password:</label>
				<div class="col-sm-6">
					<input type="password" id="new_password" name="new_password" 
					value="<?php echo set_value('new_password');?>" class="form-control">
				</div>
			</div>
				
			<div class="form-group">
				<label class="control-label col-sm-4" for="confirm_new_password">Confirm New Password:</label>
				<div class="col-sm-6">
					<input type="password" id="confirm_new_password" name="confirm_new_password"
					 value="<?php echo set_value('confirm_new_password');?>" class="form-control">
				</div>
			</div>
				
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-4">
					<?php echo  anchor( 'account', 'Cancel', 'class="btn btn-default"' )?>
					<input type="submit" name="change_password" id="submit" value="Submit" class="btn btn-primary">
				</div>
			</div>
		<?php echo form_close();?>
	</div>
</section> <!-- end of span9 -->
