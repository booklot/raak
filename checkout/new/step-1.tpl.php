<?php defined('BASEPATH') OR exit('No direct script access allowed');?>

<div class="order-stages">

	<ol class="breadcrumb">
		<li>
			<h4 class="panel-title">
				<span class="fa fa-dot-circle-o gold"></span>
				<span class="accordion-toggle">Customer Information</span>
			</h4>
		</li>
	</ol>


	<div class="col-sm-offset-1 col-sm-10 login-section">

		<?php if(!$this->flexi_auth->is_logged_in()):?>
			<?php echo form_open( 'account/login', ['class'=>'form form-horizontal'] );?>
				<h4>Quick Login</h4>
				<p class="light">Do you already have an account? You can login.</p>
				<div class="form-group">
					<div class="col-sm-5">
						<label class="control-label">Email Address</label>
						<input type="text" class="form-control" name="login_identity" placeholder="Email Address" 
							value="<?php echo $this->input->post('login_identity');?>">
					</div>
					<div class="col-sm-5 col-sm-offset-2">
						<label class="control-label">Password</label>
						<input type="password" class="form-control" name="login_password" placeholder="Password" 
							value="<?php echo $this->input->post('login_password');?>">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-5">
						<?php echo anchor( 'account/forgot_password', 'Forgot Password?' );?>
					</div>
					<div class="col-sm-5 col-sm-offset-2">
						<button type="submit" class="btn btn-primary pull-right" name="login_user" value="Login">Log In</button>
					</div>
					<div class="col-xs-12">
						<p class="light">Sign in with your other accounts:</p>
						<?php if( $href=$this->open_auth->login_url('facebook') )
							echo anchor( $href, '<span class="fa fa-facebook"></span>&nbsp;&nbsp;&nbsp; Facebook', 
								['class'=>'btn btn-xs btn-primary', 'target'=>'_self'] );?>
						<?php if( $href=$this->open_auth->login_url('google') )
							echo anchor( $href, '<span class="fa fa-google"></span>&nbsp;&nbsp;&nbsp; Google&nbsp;&nbsp;&nbsp;&nbsp;', 
								['class'=>'btn btn-xs btn-danger', 'target'=>'_self'] );?>
					</div>
				</div>
			</form>
			<br clear="all">
			<hr>
		<?php else:?>
		
			<h4>You are checking out as <strong><?php echo $this->authorize->get_active_name();?></strong></h4>
		
		<?php endif;?>
	</div>
	
	<div class="col-sm-offset-1 col-sm-10 address-section">
		<div class="row">
			<br clear="all">
			<?php echo form_open( current_url(), 
				['class'=>'form form-horizontal', 'data-toggle'=>'validator', 'role'=>'form', 'id'=>'register_form' ] );
				echo form_hidden( 'form_name', 'new_checkout' );
			?>
				<div class="col-sm-5">
					<h4>Billing Address</h4>
					<?php $this->load->view("{$theme}/checkout/new/ba.tpl.php");
						if( !$this->flexi_auth->is_logged_in() ):
							$p = $this->input->post('register_password');
							$c = $p?'checked':'';
							$dc = $p?1:0;
					?>
						<div class="form-group">
							<div class="col-xs-12">
								<div class="checkbox">
									<?php echo form_hidden('remember_me', 0);?>
									<label>
										<input class="create_account" type="checkbox" name="remember_me" value="1" 
											data-checked="<?=$dc;?>" <?=$c;?>>
										Create Account
									</label>
								</div>
							</div>
						</div>
						<div class="passwords"><?php if($p) $this->load->view("{$theme}/checkout/register_password.tpl.php");?></div>
					<?php endif;?>
						
				</div>
				<!-- col-sm-5 billing address -->
				<div class="col-sm-5 col-sm-offset-2">
					<h4>Delivery Address</h4>
					
					<div class="form-group">
						<div class="col-xs-12">
							<?php $da = $this->input->post('same_delivery_address');
								$s = (!is_null($da))?$da:1;
								if($s) $c = 'checked'; else $c = '';
							?>
							<div class="checkbox">
								<label class="control-label">
									<input name="same_delivery_address" type="hidden" value="0">
									<input type="checkbox" class="set_delivery_address" name="same_delivery_address" value="1" 
										data-checked="<?=$s;?>" <?=$c;?>> Same as Billing Address
								</label>
							</div>
							<br clear="all">
							<div class="delivery_address"><?php if(!$s) $this->load->view("{$theme}/checkout/new/da.tpl.php");?></div>
						</div>
					</div>
					
				</div>
				<!-- col-sm-5 delivery address -->
				
				<div class="col-sm-12">
					<div class="form-group">
						<div class="col-sm-12">
							<span class="pull-right">
								<button type="submit" name="billing_address" class="btn btn-primary">Continue</button>
							</span>
						</div>
					</div>
				</div>
				
			</form>
			<!-- addresses -->
			<div class="delivery_address_stash hidden"><?php if($s) $this->load->view("{$theme}/checkout/new/da.tpl.php");?></div>
			<div class="password_stash hidden"><?php $this->load->view("{$theme}/checkout/register_password.tpl.php")?></div>
		</div>
	</div>

	<br clear="all"><br clear="all">
	<ol class="breadcrumb">
		<li>
			<h4 class="panel-title">
				<span class="fa fa-circle-o light"></span>
				<span class="accordion-toggle light">
					Delivery Method
				</span>
			</h4>
		</li>
	</ol>
	<ol class="breadcrumb">
		<li>
			<h4 class="panel-title">
				<span class="fa fa-circle-o light"></span>
				<span class="accordion-toggle light">
					Confirm Order
				</span>
			</h4>
		</li>
	</ol>


</div>
<!-- order-stages -->
