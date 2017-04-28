<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="modal fade" id="shipping_method" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Delivery Method</h4>
			</div>
			<!-- modal-header -->

			<div class="modal-body">
				<?php if($checkout['option']=='delivery_method' || $checkout['step']>=4 ):
					echo form_open('checkout', 'id="delivery_method_form" class="form-horizontal"');?>
	
						<div class="alert alert-info">
							<p>
								<span class="glyphicon glyphicon-info-sign pull-left" style="font-size:280%;display:inline-block"></span>
								<span style="display:inline-block;height:42px;">
									&nbsp;&nbsp;&nbsp;&nbsp;
									Cart Weight: <?php echo $this->cart->cart_weight()?> kg
									<br>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<?php echo anchor( 'shop/delivery', 'Delivery Information', 'target="_blank"' );?>
								</span>
							</p>
						</div>
						<!-- alert -->
	
						<table class="table table-condensed table-hover shopping-cart">
							<thead>
								<tr>
									<th colspan="2" style="text-align:left; padding-left:1%;">Delivery Method</th>
									<th style="text-align:left;">Delivery Time</th>
									<th>Cost</th>
								</tr>
							</thead>
							<tbody>
							<?php if( isset($shipping_methods) && !isset($shipping_methods['error']) ):
								foreach( $shipping_methods as $s ):?>
									<tr style="cursor:pointer;">
										<td onclick="click_radio_s(<?php echo $s['id']?>)" 
											style="background:none;text-align:left; padding-left:1%;padding-bottom:0; border-bottom:none;" >
											<div class="radio">
												<label>
													<input type="radio" name="shipping_method" id="shipping<?php echo $s['id']?>" 
														value="<?php echo $s['id']?>" 
														<?php if($s['cost']===FALSE) echo 'disabled';?> 
														<?php if(isset($shipping['id'])&&$shipping['id']==$s['id']) echo ' checked';?>>
													
												</label>
											</div>
										</td>
										<td onclick="click_radio_s(<?php echo $s['id']?>)">
											<h4 style="margin-top:1px;margin-bottom:0px;"><?php echo $s['name'];?></h4>
											<small><?php echo $s['description']?></small>
										</td>
										<td style="text-align:left;" onclick="click_radio_s(<?php echo $s['id']?>)">
											<h4><?php echo $s['time'];?></h4>
										</td>
										<td onclick="click_radio_s(<?php echo $s['id']?>)" style="vertical-align:middle;">
											<h4>
												<?php if($s['cost']===FALSE) 
													echo '<small>not available for your delivery address</small>'; 
												else echo toc( $s['cost'] )?>
											</h4>
										</td>
									</tr>
								<?php endforeach;endif;?>
							</tbody>
						</table>
						<br clear="all">
						<div class="form-group">
							<div class="col-xs-12">
								<span class="pull-right">
									<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
									<button type="submit" name="delivery_details" id="submit" value="Apply" 
										class="btn btn-primary">&nbsp;&nbsp;Apply&nbsp;&nbsp;</button>
									</span>
								<input type="hidden" name="form_name" value="delivery_method">
							</div>
						</div>
						<!-- form-group -->

						<script>function click_radio_s(id){document.getElementById("shipping"+id).click();}</script>
						<br clear="all">
					</form>
				<?php else:?>
					<h4><strong>Delivery Method:</strong></h4>
					<h4><?php echo isset($shipping['name'])?$shipping['name']:'';?></h4>
				<?php endif;?>
			</div>
			<!-- modal-body -->
		</div>
		<!-- modal-content -->
	</div>
	<!-- modal-dialog -->
</div>
<!-- modal -->
