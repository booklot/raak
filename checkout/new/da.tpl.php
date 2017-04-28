<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$id = isset($da_address['id'])?$da_address['id']:FALSE;
if($id) echo form_hidden( 'da_id', $id );

?>
				<div class="form-group has-feedback">
					<div class="col-xs-12">
						<?php 
							$i0 = $this->input->post('recipient')?$this->input->post('recipient'):
								(isset($da_address['ul_name'])?$da_address['ul_name']:'');
						?>
						<label class="control-label">Full Name</label>
						<input type="text" class="form-control" name="recipient" placeholder="Full Name" 
							value="<?=$i0;?>" data-full_name>
						<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						<div class="help-block with-errors"></div>
					</div>
				</div>
				<div class="form-group has-feedback phone_group" id="delivery_phone_number" data-parent="register_form">
					<div class="col-xs-12">
						<?php 
							$ccode = $this->input->post('register_ccode2');
							$p = $this->input->post('da_phone')?'+'.$this->input->post('register_ccode2').$this->input->post('da_phone'):
								(isset($da_address['ul_phone'])?$da_address['ul_phone']:'');
							
							$phone = split_phone($p,$countries);
							//$c1 = preg_replace( "/^\+$ccode/", '', $phone );
						?>
						<label class="control-label">Phone Number</label>
						<div class="input-group">
							<div class="input-group-btn cc-selecter">
								<button type="button" class="btn btn-default dropdown-toggle f16" data-toggle="dropdown" 
									aria-haspopup="true" aria-expanded="false">
									<span class="flag btn-flag <?=strtolower($phone['iso_code']);?>">&nbsp;</span>
									<span class="btn-cc"><?php echo $phone['code']?'+'.$phone['code']:'country';?></span>
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
								<input type="hidden" class="ccode" name="register_ccode2" value="<?=$phone['code'];?>">
								<input type="hidden" class="iso_code" name="register_isocode2" 
									value="<?=$phone['iso_code'];?>">
							</div>
							<!-- /btn-group -->
							<input type="tel" name="da_phone" class="form-control phone-field" value="<?=$phone['number'];?>">
						</div><!-- /input-group -->
						<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						<div class="help-block with-errors"></div>
					</div>
				</div>


				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i1 = $this->input->post('da_address')?$this->input->post('da_address'):
								(isset($da_address['address'])?$da_address['address']:'');
						?>
						<label class="control-label">Address Line 1</label>
						<input type="text" name="da_address" class="form-control" placeholder="Address Line 1" 
							value="<?=$i1;?>" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i2 = $this->input->post('da_address2')?$this->input->post('da_address2'):
								(isset($da_address['ul_address2'])?$da_address['ul_address2']:'');
						?>
						<label class="control-label">Address Line 2</label>
						<input type="text" name="da_address2" class="form-control" placeholder="Address Line 2" 
							value="<?=$i2;?>">
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i3 = $this->input->post('da_city')?$this->input->post('da_city'):
								(isset($da_address['city_name'])?$da_address['city_name']:'');
						?>
						<label class="control-label">City</label>
						<input type="text" name="da_city" class="form-control" placeholder="Address Line 2" 
							value="<?=$i3;?>" required>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i4 = $this->input->post('da_state')?$this->input->post('da_state'):
								(isset($da_address['ul_state'])?$da_address['ul_state']:'');
						?>
						<label class="control-label">State / Province</label>
						<input type="text" name="da_state" class="form-control" placeholder="State / Province" 
							value="<?=$i4;?>">
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<label class="control-label">Country</label>
						<select name="da_country" class="form-control" required>
							<?php foreach( $countries as $c ):
								//if( isset($da_address['country']) && $da_address['country']==$c['id'] ) $s='selected'; else $s='';
								$s = ( $this->input->post('da_country') && $this->input->post('da_country')==$c['id'] )?'selected': 
									((isset($da_address['country']) && $da_address['country']==$c['id'])?'selected':'');
							?>
								<option value="<?=$c['id'];?>" <?=$s;?>><?=$c['name'];?></option>
							<?php endforeach;?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12">
						<?php 
							$i5 = $this->input->post('da_zip')?$this->input->post('da_zip'):
								(isset($da_address['ul_zip'])?$da_address['ul_zip']:'');
						?>
						<label class="control-label">ZIP Code</label>
						<input type="text" name="da_zip" class="form-control" placeholder="ZIP Code" 
							value="<?=$i5;?>">
					</div>
				</div>
