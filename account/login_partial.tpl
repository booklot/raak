<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-9"><!-- Main Content -->
	<div class="block block-info">
		<br clear="all">
		<h3 class="title_block">Registered Users - Login</h3>
		<div class="block_content">
			<?php if (! empty($message)): ?>
				<div class="col-lg-12"><?php echo $message; ?></div>
			<?php endif ?>

			<?php echo form_open(current_url(), 'class="form-horizontal"');
				$user = $this->session->userdata('flexi_auth');
				if( $this->flexi_auth->is_logged_in() && !$this->flexi_auth->is_logged_in_via_password() && 
					isset($user['user_identifier']) ):?>
						<br clear="all">
						<div class="alert alert-info col-lg-10 col-lg-offset-1">
							Hi <?php echo $user['fname'];?>, the page you wish to visit requires you to enter your account password.
						</div>
				
						<div class="form-group">
							<label class="control-label col-sm-3" for="identity">Email or Username:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control input-sm" value="<?php echo $user['user_identifier'];?>" 
								name="login_identity" readonly>
								<input type="hidden" name="login_identity" value="<?php echo $user['user_identifier'];?>">
							</div>
							<div class="col-sm-4">
								<?php echo anchor( 'account/logout', 'logout and login as a different user' );?>
							</div>
						</div>
					<?php else:?>
						<div class="form-group">
							<label class="control-label col-sm-3" for="identity">Email or Username:</label>
							<div class="col-sm-5">
								<input type="text" id="identity" name="login_identity" class="form-control input-sm" 
								value="<?php echo $this->input->post('login_identity');?>">
							</div>
						</div>
			
					<?php endif;?>
					<div class="form-group">
						<label class="control-label col-sm-3" for="password">Password:</label>
						<div class="col-sm-5">
							<input type="password" id="password" name="login_password" class="form-control input-sm" 
							value="<?php echo $this->input->post('login_password');?>">
						</div>
					</div>

					<?php if (isset($captcha)):
							echo '<div class="form-group">';
							echo '<div class="col-sm-6 col-sm-offset-4">';
							echo '<div id="captcha">';
							echo $captcha;
							echo "</div></div></div>";
						endif;
					?>
			
					<div class="form-group">
						<div class="col-sm-5 col-sm-offset-3">
							<div class="checkbox">
								<label><input type="checkbox" id="remember_me" name="remember_me" value="1" checked> Remember Me</label>
							</div>
						</div>
					</div>
				
					<div class="form-group">
						<div class="col-sm-5 col-sm-offset-3">
							<?php echo  anchor( 'account', 'cancel', 'class="btn btn-default"' )?>
							<input type="submit" name="login_user" id="submit" value="continue" class="btn btn-primary">
						</div>
					</div>

					<hr>
				
					<div class="form-group">
						<div class="col-sm-5 col-sm-offset-1">
							<a href="<?php echo base_url();?>account/forgot_password" class="btn btn-link">Forgot Password?</a>
						</div>
					</div>
					<!-- <p>
									<a href="<?php echo base_url();?>auth/resend_activation_token">Resend Account Activation Token</a>
								</p> -->
				</fieldset>
				<input type="hidden" name="form_name" value="login">
				<input type="hidden" name="form_type" value="select">
			<?php echo form_close();?>
		</div>
	</div>
</section>
