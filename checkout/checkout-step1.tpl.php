<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a class="accordion-toggle" data-toggle="collapse" data-parent="#checkout" href="#step1">
					Step 1: 
					<?php 
						if($this->flexi_auth->is_logged_in())
							echo "Checking out as <strong>".$this->authorize->get_real_name()."</strong>";
						else
							echo "Returning Customer? <small>Login Here</small>";
					?>
				</a>
			</h4>
		</div>
		<div id="step1" class="panel-collapse collapse <?php if( !$this->flexi_auth->is_logged_in() ) echo 'in';?>">
			<div class="panel-body">
				<div class="login">
					<?php if(!$this->flexi_auth->is_logged_in()):?>
					<table>
						<tr>
							<td width="50%">
								<h3>New Customer</h3>
								<p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep 
									track of the orders you have previously made.
								</p>
								<?php echo anchor( site_url('account/register').'#register_modal', lang('register'), 
									'class="btn btn-primary" data-toggle="modal"');?>
								<span class="btn">- or -</span>
								<a href="#guest_reg" data-toggle="modal" class="btn btn-default">
									Guest Checkout
								</a>
								
							</td>
							<td width="50%">
								<h3>Returning Customer</h3>
								<div class="col-sm-12">
								<?php echo form_open( 'account/login', 'class="form-horizontal"' );?>
									<div class="form-group">
										<label for="identity" class="control-label">
											Your E-Mail / Username: <span class="required">*</span></label>
										<div class="col-sm-9 col-sm-offset-1">
											<input type="text" id="identity" name="login_identity" 
											value="<?php echo $this->input->post('login_identity');?>" 
											placeholder="example@example.com" class="form-control input-sm" required>
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="control-label">
											Your Password: <span class="required">*</span></label>
										<div class="col-sm-9 col-sm-offset-1">
											<input type="password" id="password" name="login_password" 
												value="<?php echo $this->input->post('login_password');?>" 
													placeholder="**************" class="form-control input-sm" required>
										</div>
									</div>
									<div class="form-group">
										<div class="checkbox">
											<label><input type="checkbox" name="remember_me" 
												value="1" checked> Remember Me</label>
										</div>
										<?php if (isset($captcha)): 
											echo '<br clear="all"><div id="captcha" style="line-height:0">';
											echo $captcha;
													echo '</div><br clear="all">';
												endif;?>
										</div>
									
									<div class="form-group">
										<div class="col-sm-9 col-sm-offset-2">
											<?php echo anchor( 'account/forgot_password', 'Forgot Password', 
											'class="btn btn-link btn-sm"' );?>
											<button type="submit" class="btn btn-primary btn-sm" name="login_user" 
												value="Login">Login</button>
											<input type="hidden" name="form_name" value="login">
											<input type="hidden" name="form_type" value="select">
										</div>
									</div>
								</form>
								<!--end form-->
								</div>
							</td>
						</tr>
					</table>
					<?php else:?>
						<table class="table">
							<tr>
								<td>
									<h3>
										<?php echo anchor( 'account', $this->authorize->get_real_name() );?>
									</h3>
									<br>
									<p>* If you logout, from this account, you will have to add your items to your shopping cart 
										again
									</p>
								<?php echo anchor( site_url('account/logout'), lang('logout'), 
									'class="btn btn-warning"');?>
							</td>
							</tr>
						</table>
					<?php endif;?>
				</div>
				<!--end login-->
				
			</div> 
			<!-- end of accordion inner -->
		</div> 
		<!-- end of accordion body -->
	</div> 
	<!-- end of checkout outer-->
<!-- end of accordion group -->
