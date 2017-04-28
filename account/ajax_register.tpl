<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<!-- Modal -->
<div class="modal fade" id="register_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<?php echo form_open('account/register', 'class="form-horizontal" id="ajax_register"'); ?>
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Register New Account</h4>
				</div>
			
				<div class="modal-body">
					<div class="ajax_register_error"></div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="company_name">Company Name:</label>
						<div class="col-sm-6">
							<input type="text" id="company_name" name="register_company_name" class="form-control input-sm" 
								value="<?php echo $this->input->post('register_company_name');?>">
						</div>
					</div>
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
					
					<div class="form-group">
						<label class="control-label col-sm-4" for="phone_number">
							Cellphone Number:<span class="required">*</span>
						</label>
						<div class="col-sm-6">
							<?php 
								$ccode = $this->input->post('register_ccode');
								$phone = $this->input->post('register_phone_number');
								$c = preg_replace( "/^$ccode/", '', $phone );
							?>
							<div class="input-group">
								<span class="input-group-addon">+</span>
								<span class="input-group-btn">
									<input class="form-control input-sm" name="register_ccode" 
										style="min-width: 50px; background:white;border-right: 2px solid #ccc;"
										 required pattern="[0-9]{1,3}" maxLength="3" 
										 value="<?php echo set_value('register_ccode')?>" autocomplete="off">
										</span>
									<input type="tel" id="phone_number" name="register_phone_number" maxlength="12"
										value="<?php echo $c;?>" class="form-control input-sm" required>
							</div><!-- /input-group -->
							<small>
								start with country dialing code in first box then your phone number. e.g &nbsp;263&nbsp;&nbsp;779123456
							</small>
						</div>
							<?php $ttp = array( 'class'=>'', 'data-toggle'=>'popover', 'title'=>'', 'data-original-title'=>'Example:',
									'data-content'=>'Country Code | Phone Number e.g. 263 | 772000111',
									'style'=>'text-decoration:none; display:inline-block;padding: 5px 2px;' );
									echo anchor( current_url().'#', '<span class="glyphicon glyphicon-info-sign"></span>', $ttp );?>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-4" for="email_address">
							Email Address:<span class="required">*</span>
						</label>
						<div class="col-sm-6">
							<input type="email" id="email_address" name="register_email_address" 
								value="<?php echo $this->input->post('register_email_address');?>" 
								class="form-control input-sm" required>
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

					<div class="form-group">
						<label class="control-label col-sm-4" for="confirm_password">
							Confirm Password:<span class="required">*</span>
						</label>
						<div class="col-sm-6">
							<input type="password" id="confirm_password" name="register_confirm_password" 
								value="<?php echo $this->input->post('register_confirm_password');?>" 
								class="form-control input-sm" required>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-4"><?php echo anchor( 'shop/terms_conditions', 'Terms And Conditions', 
						'target="_blank"' );?></label>
						<div class="col-sm-6">
							<div class="checkbox">
								<label><input type="checkbox" name="register_terms" value="1" required> 
									I Agree to Terms and Conditions
								</label>
							</div>
						</div>
					</div>
					
				</div>
			
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="submit" name="register_btn" class="btn btn-primary ajax_register_btn">Register</button>
					<input type="hidden" name="register_user" value="register">
					<input type="hidden" name="form_type" value="insert">
				</div>

			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
