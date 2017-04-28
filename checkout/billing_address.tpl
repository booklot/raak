<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="panel panel-<?php if($checkout['option']=='billing_address') echo 'primary'; else echo 'default';?>">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#checkout" href="#step2">
				<?php 
					if($checkout['option']=='billing_address'):
						echo 'Step 2: <strong>Billing Address</strong>';
					else:
						echo "Step 2: Billing Address";
					endif;
				?>
			</a>
			<?php 
				if( $checkout['step']>2 ):
					$a = array( 'class'=>"invarseColor pull-right", 'rel'=>"tooltip", 'data-placment'=>"top", 
						'data-title'=>"EDIT", 'style'=>"margin-right:0px; color:#333; font-size:10px;" );
					echo anchor( 'checkout/regress/2', '<i class="glyphicon glyphicon-pencil"></i>', $a );
				endif;
			?>
		</h4>
	</div>
		
	<div id="step2" class="panel-collapse collapse <?php if($checkout['option']=='billing_address') echo 'in';?>">
		<div class="panel-body">
			<div class="container">
				<div class="col-sm-10">
					<?php if($checkout['option']=='billing_address'):
						echo form_open('checkout', 'id="billing_address_form" class="form-horizontal"');?>
							<br clear="all">
							<div class="form-group">
								<div class="col-sm-12">
									<?php 
										$op=array('class'=>'btn btn-info','data-toggle'=>'modal');
										echo anchor( site_url('account/add_address').'#guest_address', 'Add New Address', $op );
									?>
								</div>
								<br clear="all"><br clear="all">
								<label class="control-label col-sm-1"> - OR - </label>
							</div>
								
							<div class="form-group">
								<label class="control-label" for="address">Select Existing Address</label>
								<div class="col-sm-11">
									<select id="address" name="existing_add" class="form-control" 
										style="height:100px;" size="5">
										<?php if( !isset($user_locations['error']) ):
											foreach( $user_locations as $k=>$ul ):
												if($k==0) $s = 'selected'; else $s="";	?>
												<option value="<?php echo $ul['id']?>" <?php echo $s;?>><?php 
													echo $ul['full_address']?></option>
										<?php endforeach; endif;?>
									</select>
								</div>
							</div>
								
							<div class="form-group">
								<div class="checkbox">
									<label><input type="checkbox" id="same_delivery_ad" name="same_delivery_ad" 
										value="1"> My delivery address is the same as my billing address</label>
								</div>
							</div>
								
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-3">
									<input type="submit" name="add_address" id="submit" value="Continue" 
										class="btn btn-primary pull-right">
									<input type="hidden" name="form_name" value="my_billing_address">
									<input type="hidden" name="used_add" value="existing">
								</div>
							</div>
						</form>
					<?php else:
						if( isset($cart_progress) ):
							$cp = '';
							foreach( $cart_progress as $v )
							{
								if( $v['i']==2 ) $cp = $v['v'];
							}
						?>
							<h4><strong>Bill To:</strong></h4>
							<h4><?php echo $this->authorize->get_real_name();?></h4>
							<h4><?php echo $cp;?></h4>
						<?php endif;?>
						
					<?php endif;?>
				</div>
			</div>
		</div>
		<!-- panel-body -->
	</div>
	<!-- #step2 panel-collapse -->
</div>
<!-- panel -->
