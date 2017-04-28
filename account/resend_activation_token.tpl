<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="col-sm-9">
	<div class="register block block-info">
		<h3 class="title_block">Resend Account Activation Email</h3>

		<?php echo form_open(current_url(), 'class="form-horizontal"');?>
			<legend>&nbsp;&nbsp;&nbsp;Enter Your Details</legend>
			<div class="form-group">
				<label class="control-label col-sm-4" for="identity">Email or Username:</label>
				<div class="col-sm-6">
					<input type="text" id="identity" name="activation_token_identity" class="form-control input-sm"
					title="Please enter either your email address or username defined during registration." 
					value="<?php echo $this->input->post('activation_token_identity');?>">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-4">
					<?php echo anchor( site_url('account/login'), 'Cancel', 'class="btn btn-default"' );?>
					<input type="submit" name="send_activation_token" id="submit" value="Submit" class="btn btn-primary"/>
				</div>
			</div>
		</form>
	</div>
</div>
