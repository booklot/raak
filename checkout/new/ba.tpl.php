<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php if(!$this->flexi_auth->is_logged_in()):?>
				<div class="form-group has-feedback">
					<div class="col-xs-12">
						<label class="control-label">Full Name</label>
						<input type="text" class="form-control" name="register_full_name" placeholder="Full Name" 
							value="<?php echo $this->input->post('register_full_name');?>" data-full_name required>
						<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						<div class="help-block with-errors"></div>
					</div>
				</div>
				<div class="form-group has-feedback">
					<div class="col-xs-12">
						<label class="control-label">Email Address</label>
						<input type="email" class="form-control" name="register_email_address" placeholder="Email" 
							value="<?php echo $this->input->post('register_email_address');?>" 
							data-remote="<?php echo site_url('ajax/email_available');?>" required>
						<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						<div class="help-block with-errors track"></div>
					</div>
				</div>
				<div class="form-group has-feedback phone_group" id="phone_number" 
					data-url="<?=base_url('ajax/phone_available');?>" data-parent="register_form">
					<div class="col-xs-12">
						<?php 
							$ccode = $this->input->post('register_ccode');
							$phone = $this->input->post('register_phone_number');
							$c1 = preg_replace( "/^\+$ccode/", '', $phone );
						?>
						<label class="control-label">Phone Number</label>
						<div class="input-group">
							<div class="input-group-btn cc-selecter">
								<button type="button" class="btn btn-default dropdown-toggle f16" data-toggle="dropdown" 
									aria-haspopup="true" aria-expanded="false">
									<span class="flag btn-flag <?=$this->input->post('register_isocode');?>">&nbsp;</span>
									<span class="btn-cc"><?php echo $ccode?'+'.$ccode:'country';?></span>
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu countries">
									<?php foreach($countries as $c):?>
										<li>
											<a class="f16" href="#<?=$c['code'];?>"
												data-iso_code="<?php echo strtolower($c['iso_code']);?>" 
												data-ccode="<?php echo $c['code'];?>" 
												>
												<span class="flag <?php echo strtolower($c['iso_code']);?>"></span> 
												<span><?=$c['name'];?></span>
												<span class="light"><?='+'.$c['code'];?></span>
											</a>
										</li>
									<?php endforeach;?>
								</ul>
								<input type="hidden" class="ccode" name="register_ccode" value="<?=$ccode;?>" required>
								<input type="hidden" class="iso_code" name="register_isocode" 
									value="<?=$this->input->post('register_isocode');?>">
							</div>
							<!-- /btn-group -->
							<input type="tel" name="register_phone_number" class="form-control phone-field" value="<?=$c1;?>" 
								data-remote="<?=base_url('ajax/phone_available/'.$ccode);?>" required>
						</div><!-- /input-group -->
						<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						<div class="help-block with-errors"></div>
					</div>
				</div>
<?php 
	else: 
		$id = isset($address['id'])?$address['id']:FALSE;
		if($id) echo form_hidden( 'id', $id );
		echo form_hidden( 'user_id', $this->flexi_auth->get_user_id() );
	endif;
	echo form_hidden( 'default', 1 );
	echo form_hidden( 'type', 'b' );
	echo form_hidden( 'add_billing_address', 1 );
?>


				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i1 = $this->input->post('address')?$this->input->post('address'):
								(isset($address['address'])?$address['address']:'');
						?>
						<label class="control-label">Address Line 1</label>
						<input type="text" name="address" class="form-control" placeholder="Address Line 1" 
							value="<?=$i1;?>" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i2 = $this->input->post('address2')?$this->input->post('address2'):
								(isset($address['ul_address2'])?$address['ul_address2']:'');
						?>
						<label class="control-label">Address Line 2</label>
						<input type="text" name="address2" class="form-control" placeholder="Address Line 2" 
							value="<?=$i2;?>">
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i3 = $this->input->post('city')?$this->input->post('city'):
								(isset($address['city_name'])?$address['city_name']:'');
						?>
						<label class="control-label">City</label>
						<input type="text" name="city" class="form-control" placeholder="Address Line 2" 
							value="<?=$i3;?>" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i4 = $this->input->post('state')?$this->input->post('state'):
								(isset($address['ul_state'])?$address['ul_state']:'');
						?>
						<label class="control-label">State / Province</label>
						<input type="text" name="state" class="form-control" placeholder="State / Province" 
							value="<?=$i4;?>">
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<label class="control-label">Country</label>
						<select name="country" class="form-control" required>
							<?php foreach( $countries as $c ):
								//if( isset($address['country']) && $address['country']==$c['id'] ) $s='selected'; else $s='';
								$s = ( $this->input->post('country') && $this->input->post('country')==$c['id'] )?'selected': 
									((isset($address['country']) && $address['country']==$c['id'])?'selected':'');
							?>
								<option value="<?=$c['id'];?>" <?=$s;?>><?=$c['name'];?></option>
							<?php endforeach;?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i5 = $this->input->post('zip')?$this->input->post('zip'):
								(isset($address['ul_zip'])?$address['ul_zip']:'');
						?>
						<label class="control-label">ZIP Code</label>
						<input type="text" name="zip" class="form-control" placeholder="ZIP Code" 
							value="<?=$i5;?>">
					</div>
				</div>
