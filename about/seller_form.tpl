<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-4">

	<div class="block block-default">
		<h2 class="title_block">Merchant Registration</h2>

		<?php
		if($this->flexi_auth->is_logged_in()):
				echo form_open( current_url(), array('class'=>'form-horizontal block_content') );
					echo '<div class="container"><div class="col-lg-12">';
		?>
		
							<div class="form-group">
								<label class="control-label">Phone Number <span class="required">*</span></label>
								<div class="col-sm-11 col-sm-offset-1">
									<input type="text" name="phone" value="<?php echo $this->input->post('phone');?>" 
									class="form-control input-sm" required>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">Company Name <span class="required">*</span></label>
								<div class="col-sm-11 col-sm-offset-1">
									<input type="text" name="company_name" value="<?php echo $this->input->post('company_name');?>" 
										class="form-control input-sm" required>
								</div>
							</div>
			
							<div class="form-group">
								<label class="control-label">Company Address <span class="required">*</span></label>
								<div class="col-sm-11 col-sm-offset-1">
									<input type="text" name="company_address" 
										value="<?php echo $this->input->post('company_address');?>" 
										class="form-control input-sm" required>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">Main Product Type (<small>e.g furniture / shoes ...</small>)</label>
								<div class="col-sm-11 col-sm-offset-1">
									<input type="text" name="product_type" value="<?php echo $this->input->post('product_type');?>" 
										class="form-control input-sm">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">Message <small>(optional)</small></label>
								<div class="col-sm-11 col-sm-offset-1">
									<textarea name="message" class="form-control"><?php echo $this->input->post('message');?></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-11 col-sm-offset-1">
									<div class="checkbox">
										<label href="#seller_policy" role="button" data-toggle="modal"><input type="checkbox" 
										name="merchant_policy" value="1" id="agree_to_policy" required> I Agree to the Merchant Policy
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-11 col-sm-offset-1">
									<button type="submit" name="register" value="merchant_register" 
										class="btn btn-primary">Register</button>
								</div>
							</div>
							<input type="hidden" name="user_id" value="<?php echo $this->authorize->account_id();?>">
							<input type="hidden" name="form_name" value="register_merchant">
							<input type="hidden" name="form_type" value="register">
						</div>
						<!-- col-lg-12 -->
						</div>
					</form>
		<?php else:?>
			<div class="container">
				<br clear="all"><br clear="all">
				To get started started, register as a user or login if you already have an account.<br clear="all"><br clear="all">
				<?php echo anchor( 'account/register', 'Register', 'class="btn btn-default"' );?>&nbsp;&nbsp;&nbsp;
				<?php echo anchor( 'account/login', 'Login', 'class="btn btn-default"' );?>
				<br clear="all"><br clear="all">
			</div>
		<?php endif;?>
	</div>
	<!--end block-default-->
	<br clear="all">
	
</section> <!-- end of span4 -->




<!-- Modal -->
<div id="seller_policy" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog"><div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 id="myModalLabel">Zimall Merchant Policy
				<span class="pull-right" style="margin-right:10px;">
					<?php echo anchor( base_url('Merchant Policy - 06 July 2014.pdf'),
					'<span class="glyphicon glyphicon-print"></spann> Print',
					'class="btn btn-default btn-xs" target="_blank"');?>
				</span>
			</h3>
		</div>
		
		<div class="modal-body" style="max-height:430px;overflow-y:auto;">
			<?php $this->load->view($theme.'/about/merchant_policy.tpl')?>
		</div>
		
		<div class="modal-footer">
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true" onclick="disagree()">I Disagree</button>
			<button type="button" data-dismiss="modal" class="btn btn-primary" onclick="agree()">I Agree</button>
		</div>
	</div></div>
</div>

<script>function agree(){document.getElementById('agree_to_policy').checked='checked';}function disagree(){document.getElementById('agree_to_policy').checked=false;}</script>

