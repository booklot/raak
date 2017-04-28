<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="panel panel-<?php if($checkout['option']=='delivery_address') echo 'primary'; else echo 'default';?>">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#checkout" href="#step3">
				<?php 
					if($checkout['option']=='delivery_address'):
						echo 'Step 3: <strong>Delivery Address</strong>';
					else:
						echo "Step 3: Delivery Address";
					endif;
				?>
			</a>
			<?php 
				if( $checkout['step']>3 ):
					$a = array( 'class'=>"invarseColor pull-right", 'rel'=>"tooltip", 'data-placment'=>"top", 
						'data-title'=>"EDIT", 'style'=>"margin-right:0px; color:#333; font-size:10px;" );
					echo anchor( 'checkout/regress/3', '<i class="glyphicon glyphicon-pencil"></i>', $a );
				endif;
			?>
		</h4>
	</div>


	<div id="step3" class="panel-collapse collapse <?php if($checkout['option']=='delivery_address') echo 'in';?>">
		<div class="panel-body">
			<?php if($checkout['option']=='delivery_address'):?>
				<div class="container">
					<div class="col-sm-10">
						<?php echo form_open('checkout', 'id="billing_address_form" class="form-horizontal"');?>

							<div class="form-group">
								<label class="control-label" for="address">Name of recipient</label>
								<div class="col-sm-11">
									<input type="text" class="form-control" name="recipient" 
										value="<?php $this->input->post('recipient');?>">
									<span>If it's not you who is receiving the delivery</span>
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label" for="address">Select Existing Address</label>
								<div class="col-sm-11">
									<select id="address" name="existing_add" class="form-control"
										 style="height:100px;" size="5">
										<?php if( !isset($user_locations['error']) ):
										foreach( $user_locations as $k=>$ul ):
											if($k==0) $s = 'selected'; else $s="";?>
											<option value="<?php echo $ul['id']?>" <?php echo $s;?>><?php 
											echo $ul['full_address']?></option>
										<?php endforeach; endif;?>
									</select>
								</div>
							</div>
								
							<div class="form-group">
								<label class="control-label"> - OR - </label>
								<div class="col-sm-12">
									<?php $op = array('class'=>'btn btn-default','data-toggle'=>'modal');
									echo anchor( site_url('account/add_address').'#delivery_address_modal','Add New Address', $op );?>
								</div>
							</div>

							<br clear="all"><br clear="all">

							<div class="form-group">
								<div class="col-sm-9">
									<input type="submit" name="add_address" id="submit" value="Continue" 
									class="btn btn-primary pull-right">
									<input type="hidden" name="form_name" value="my_delivery_address">
									<input type="hidden" name="used_add" value="existing">
								</div>
							</div>
						</form>
					</div>
				</div>
			<?php else:
						if( isset($cart_progress) ):
							$cp = '';
							foreach( $cart_progress as $v )
							{
								if( $v['i']==3 ) $cp = $v['v'];
							}
						?>
							<h4><strong>Deliver To:</strong></h4>
							<h4><?php echo $cp;?></h4>
						<?php endif;?>
			<?php endif;?>
		</div>
		<!-- panel-body -->
	</div>
	<!-- #step2 panel-collapse -->
</div>
<!-- panel -->
