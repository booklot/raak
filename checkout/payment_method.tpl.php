<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="panel panel-<?php if($checkout['option']=='payment_method') echo 'primary'; else echo 'default';?>">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#checkout" href="#step5">
				<?php 
					if( isset($express_checkout) && $express_checkout) $stp=2; else $stp=5;
					if($checkout['option']=='payment_method'):
						echo "Step $stp: <strong>Payment Method</strong>";
					else:
						echo "Step $stp: Payment Method";
					endif;
				?>
			</a>
			<?php 
				if( $checkout['step']>$stp ):
					$a = array( 'class'=>"invarseColor pull-right", 'rel'=>"tooltip", 'data-placment'=>"top", 
						'data-title'=>"EDIT", 'style'=>"margin-right:0px; color:#333; font-size:10px;" );
					echo anchor( 'checkout/regress/'.($stp-1), '<i class="glyphicon glyphicon-pencil"></i>', $a );
				endif;
			?>
		</h4>
	</div>

	<div id="step5" class="panel-collapse collapse <?php if($checkout['option']=='payment_method') echo 'in';?>">
		<div class="panel-body">
			<?php if($checkout['option']=='payment_method'):
				echo form_open('checkout', 'id="payment_method_form" class="form-horizontal"');?>
							<table class="table table-receipt table-condensed payment-method" style="margin-top:0;">
								<div class="alert alert-info">
									<h4 style="text-align:right;">
										Total Amount: <strong><?php echo toc( cart_total() )?></strong>&nbsp;&nbsp;&nbsp;
									</h4>
									<p style="font-size:15px">
										Select your preferred payment method to use on this order.
									</p>
								</div>
								<thead>
									<tr>
										<th colspan="2" style="text-align:left;">&nbsp;&nbsp;&nbsp;
											Payment Method
										</th>
										<th></th>
										<th style="text-align:right;padding-right:10px">Transaction Fee</th>
									</tr>
								</thead>
								<tbody>
								<?php if( isset($payment) && !isset($payment['error']) ):
								foreach( $payment as $s ):?>
									<tr>
										<td colspan="1" class="alignLeft" onclick="click_radio(<?php echo $s['id']?>)">
											<div class="radio">
												<label>
													<input type="radio" name="payment_method" id="payment<?php echo $s['id']?>" 
														value="<?php echo $s['id']?>" 
														<?php if($s['cost']===FALSE) echo 'disabled';?>>
													<h4 style="margin-top:1px;">
														<?php echo $s['name'];
															if($s['sandbox']) 
																echo ' <span class="label label-warning">Test Mode</span>';
														?>
													</h4>
												</label>
											</div>
										</td>
										<td onclick="click_radio(<?php echo $s['id']?>)">
											<ul class="payments inline">
												<li class="<?php echo url_title($s['name'], '-', TRUE);?>">&nbsp;</li>
											</ul>
										</td>
										<td onclick="click_radio(<?php echo $s['id']?>)">
											<?php echo $s['description'];?>
										</td>
										<td class="alignRight" onclick="click_radio(<?php echo $s['id']?>)" class="tright">
											<h4><?php if( isset($s['cost'])) echo toc($s['cost']); else echo toc(0);?></h4>
										</td>
									</tr>
									<?php endforeach;endif;?>
								</tbody>
							</table>
							<script>function click_radio(id){document.getElementById("payment"+id).click();}</script>
							<br clear="all"><br clear="all">
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<input type="submit" name="payment_details" id="submit" value="Continue" 
									class="btn btn-primary pull-right">
									<input type="hidden" name="form_name" value="payment_method">
									<input type="hidden" name="step" value="<?php echo $checkout['step']?>">
								</div>
							</div>
							<small><strong>*</strong> We do not charge you for using some of the payment methods above, but the service providers may charge you for using those services</small>
						</form>
			<?php else:
						if( isset($cart_progress) ):
							$cp = '';
							foreach( $cart_progress as $v )
							{
								if( $v['i']==$stp ) $cp = $v['v'];
							}
						?>
							<h4><strong>Payment Method:</strong></h4>
							<h4><?php echo $cp;?></h4>
						<?php endif;?>
			<?php endif;?>
		</div>
		<!-- panel-body -->
	</div>
	<!-- #step2 panel-collapse -->
</div>
<!-- panel -->
