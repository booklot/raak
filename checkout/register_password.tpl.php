<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="form-group">
				
				<div class="col-xs-12">
					<label class="control-label">Password 
						<?php 
							$security = $this->config->item('security');
							$pl = $security['min_password_length']?$security['min_password_length']:8;
						$t = "alpha-numeric (a-z A-Z 0-9), dashes, underscores, periods and commas. Minimum of {$pl} characters required.";
						?>
						<!--<button type="button" class="btn btn-xs btn-link" data-toggle="popover" title="Note: Passwords" 
							data-content="<?=$t;?>"><span class="glyphicon glyphicon-info-sign"></span></button>
						-->
					</label>
					<input type="password" name="register_password" class="form-control" id="register_password"
						value="<?php echo $this->input->post('register_password')?>" placeholder="Enter New Password"
						data-remote="<?php echo base_url('ajax/validate_password');?>" required>
					<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
					<div class="help-block with-errors track"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12">
					<label class="control-label">Confirm Password</label>
					<input type="password" class="form-control" name="register_confirm_password" placeholder="Repeat Password" 
						value="<?php echo $this->input->post('register_confirm_password');?>" data-match="#register_password" 
						data-match-error="Does't match with the password entered above" required>
					<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
					<div class="help-block with-errors track"></div>
				</div>
			</div>
