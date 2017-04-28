<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="panel panel-<?php if($checkout['option']=='delivery_method') echo 'primary'; else echo 'default';?>">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#checkout" href="#step4">
				<?php 
					if($checkout['option']=='delivery_method'):
						echo 'Step 4: <strong>Delivery Method</strong>';
					else:
						echo "Step 4: Delivery Method";
					endif;
				?>
			</a>
			<?php 
				if( $checkout['step']>4 ):
					$a = array( 'class'=>"invarseColor pull-right", 'rel'=>"tooltip", 'data-placment'=>"top", 
						'data-title'=>"EDIT", 'style'=>"margin-right:0px; color:#333; font-size:10px;" );
					echo anchor( 'checkout/regress/4', '<i class="glyphicon glyphicon-pencil"></i>', $a );
				endif;
			?>
		</h4>
	</div>

	<div id="step4" class="panel-collapse collapse <?php if($checkout['option']=='delivery_method') echo 'in';?>">
		<div class="panel-body">
			<?php if($checkout['option']=='delivery_method'):
				echo form_open('checkout', 'id="delivery_method_form" class="form-horizontal"');?>
	
					<div class="alert alert-info">
						<h4 style="text-align:right">Cart Weight: <?php echo $this->cart->cart_weight()?> kg&nbsp;&nbsp;</h4>
						<p style="font-size:15px;">Select your preferred delivery method to use on this order.</p>
						<p style="text-align:right">
							<?php echo anchor( 'shop/delivery', 
								'<span class="glyphicon glyphicon-info-sign"></span> Delivery Information', 
								'target="_blank"' );
							?>
						</p>
					</div>
	
					<table class="table condensed">
						<thead>
							<tr>
								<th style="text-align:left; padding-left:1%;">Delivery Method</th>
								<th style="text-align:left;">Delivery Time</th>
								<th>Cost</th>
							</tr>
						</thead>
						<tbody>
							<?php if( isset($shipping) && !isset($shipping['error']) ):
								foreach( $shipping as $s ):?>
									<tr style="cursor:pointer;">
										<td colspan="1" onclick="click_radio_s(<?php echo $s['id']?>)" 
											style="background:none;text-align:left; padding-left:1%;padding-bottom:0; border-bottom:none;" >
											<div class="radio">
												<label>
													<input type="radio" name="shipping_method" id="shipping<?php echo $s['id']?>" 
														value="<?php echo $s['id']?>" 
														<?php if($s['cost']===FALSE) echo 'disabled';?>>
													<h4 style="margin-top:1px;"><?php echo $s['name'];?></h4>
												</label>
											</div>
										</td>
										<td style="text-align:left;background:none;padding-bottom:0;" 
											onclick="click_radio_s(<?php echo $s['id']?>)"><?php echo $s['time'];?>
										</td>
										<td onclick="click_radio_s(<?php echo $s['id']?>)" rowspan="2" 
											style="vertical-align:middle;">
											<h4>
												<?php if($s['cost']===FALSE) 
													echo '<small>not available for your delivery address</small>'; 
												else echo toc( $s['cost'] )?>
											</h4>
										</td>
									</tr>
									<tr>
										<td colspan="2" onclick="click_radio_s(<?php echo $s['id']?>)" 
											style="text-align:left;padding-top:0;padding-left:15px;border-top:none;">
											<small><?php echo $s['description']?></small>
										</td>
									</tr>
								<?php endforeach;endif;?>
						</tbody>
					</table>
					<br clear="all">
					<div class="control-group">
						<div class="controls">
							<input type="submit" name="delivery_details" id="submit" value="Continue" 
								class="btn btn-primary pull-right">
							<input type="hidden" name="form_name" value="delivery_method">
						</div>
					</div>

					<script>function click_radio_s(id){document.getElementById("shipping"+id).click();}</script>

					<?php if( isset($map) && !isset($map['error']) ):
						echo $map['headerjs'];echo $map['headermap'];?>
						<div class="row">
							<div class="col-sm-6">
								<?php echo $map['onload'];
								echo $map['map'];?>
							</div>
							<div id="directions" class="col-sm-5" style="max-height:500px;overflow:auto;border:1px solid #ccc;"></div>
						</div> <!-- end of row-->
						<br clear="all">
						<div class="well">
							<?php echo $map['sidebar']; ?>
						</div>
					<?php endif?>
					<br clear="all">
				</form>
			<?php else:
						if( isset($cart_progress) ):
							$cp = '';
							foreach( $cart_progress as $v )
							{
								if( $v['i']==4 ) $cp = $v['v'];
							}
						?>
							<h4><strong>Delivery Method:</strong></h4>
							<h4><?php echo $cp;?></h4>
						<?php endif;?>
			<?php endif;?>
		</div>
		<!-- panel-body -->
	</div>
	<!-- #step2 panel-collapse -->
</div>
<!-- panel -->
