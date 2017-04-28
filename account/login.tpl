<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="col-sm-12"><!-- Main Content -->
	<div class="block block-info">
		<h3 class="title_block">Account Login</h3>

		<div class="login block_content">
			<table>
				<tr>
					<td width="30%">
						<h3>New Customer</h3>
						<p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of 
							the orders you have previously made.
						</p>
						<?php echo anchor('account/register', lang('register'), 'class="btn btn-default"');?>
					</td>

					<td width="40%">
						<h3>Returning Customer</h3>
						<?php echo form_open( current_url() );?>
							<div class="form-group">
								<label for="identity">Your E-Mail / Username: <span class="text-error">*</span></label>
								<input type="text" id="identity" name="login_identity" 
									value="<?php echo $this->input->post('login_identity');?>" placeholder="example@example.com" 
									class="form-control input-sm">
							</div>
							<div class="form-group">
								<label for="password">Your Password: <span class="text-error">*</span></label>
								<input type="password" id="password" name="login_password" 
									value="<?php echo $this->input->post('login_password');?>" placeholder="**************" 
									class="form-control input-sm">
							</div>
							<div class="form-group">
								<div class="checkbox">
									<label><input type="checkbox" name="remember_me" value="1" checked> Remember Me</label>
								</div>
						    
								<?php if (isset($captcha)): 
									echo '<br clear="all"><div id="captcha" style="line-height:0">';
									echo $captcha;
									echo '</div><br clear="all">';
								endif;?>
	
							    <?php echo anchor( 'account/forgot_password', 'Forgot Password', 'class="btn btn-link"' );?>
							    <button type="submit" class="btn btn-primary" name="login_user" value="Login">Login</button>
							    <input type="hidden" name="form_name" value="login">
								<input type="hidden" name="form_type" value="select">
							</div>
						</form><!--end form-->
					</td>
				
					<td width="30%">
						<h3>Facebook Users</h3>
						<p>You can also sign in using your Facebook account.
						</p>
						<button class="btn btn-default" id="facebook_login">
							<img src="<?php echo base_url('images/facebook-login-icon.png');?>">
						</button>
					</td>
				
				</tr>
			</table>
		</div><!--end login-->
	</div>
</div>
