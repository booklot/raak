<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php $this->load->view($theme.'/common/header.tpl');?>
<div class="container">
	<div class="block block-danger">
		<br clear="all"><br clear="all">
		<div class="clearfix">
			<h3 class="title_block"><?php echo 'Pay with Flocash';?></h3>
			<div class="pagers pull-right">
				<div class="btn-toolbar">
					<?php echo anchor( base_url().'account/print_invoice/'.$invoice['invoice_num'].'.pdf', 
						'<i class="icon-print"></i> Print Invoice', 'class="btn btn-xs btn-default" target="_blank"' );?>
					<?php echo anchor( 'account/invoice/'.$invoice['invoice_num'], 'Back to Invoice','class="btn btn-default btn-xs"');?>
				</div>
			</div>
		</div><!--end titleHeader-->
		
		<br clear="all">
		
		<div class="accordion" id="payment">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#payment" href="#instructions">
						<i class="icon-caret-right"></i> Payment Instructions
					</a>
				</div>
				<div id="instructions" class="accordion-body collapse in">
					<div class="accordion-inner">
						
						<div class="alert alert-block alert-info">
							<h3 style="text-transform:capitalize;">How To Pay</h3>
							<div>
								You will be redirected to the Flocash Website to complete the payment. Click the button below to make the payment.
							</div>
						</div>
						
						<div class="row">
														
							<div class="col-sm-6">
							<?php 
								if($this->config->item('fc_sandbox_mode')):
									$gate = $this->config->item('fc_sandbox');
									$merchant = $this->config->item('fcs_merchant');
								else:
									$gate = $this->config->item('fc_gateway');
									$merchant = $this->config->item('fc_merchant');
								endif;
								$notify = $this->config->item('fc_notify_url');
								echo form_open( $gate, 'class="form-horizontal fake"');?>
									<div class="form-group">
										<label class="control-label col-sm-5">Amount:</label>
										<div class="col-sm-6">
											<div><strong><?php echo toc($invoice['total']);?></strong></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-5">Ref / Invoice Number:</label>
										<div class="col-sm-6">
											<div><strong><?php echo $invoice['invoice_num'];?></strong></div>
										</div>
									</div>
										
									<div class="form-group">
										<div class="col-sm-6 col-sm-offset-5">
											<button type="submit" name="submit" value="Checkout" 
											class="btn btn-success btn-lg">Make Payment</button>
										</div>
									</div>
									
									<?php $items = $invoice['invoice_details'];
										$item_name = '';
										if( is_array( $items ) ):
											foreach( $items as $item ):
												$item_name .= $item['name'].', ';
											endforeach;
											$item_name = character_limiter( rtrim($item_name, ', ' ), 250);
										endif;
										?>
									
									<!--Merchant Information-->
									<input type="hidden" name="merchant" value="<?php echo $merchant?>">
									<input type="hidden" name="merchant_name" value="Zimall">
									<input type="hidden" name="notify_url" value="<?php echo $notify;?>"/>
									<input type="hidden" name="return_url" 
										value="<?php echo base_url('atE9mhwZ/fc/return_url/'.$invoice['invoice_num']);?>"/>
									<input type="hidden" name="cancel_url" 
										value="<?php echo base_url('atE9mhwZ/fc/cancel_order/'.$invoice['invoice_num']);?>"/>
									
									<!--Order Information-->
									<input type="hidden" name="order_id" value="<?php echo $invoice['invoice_num'];?>"/>
									<input type="hidden" name="amount" value="<?php echo $invoice['total'];?>">
									<input type="hidden" name="item_price" value="<?php echo $invoice['total'];?>">
									<input type="hidden" name="item_name" value="<?php echo $item_name;?>">
									<input type="hidden" name="quantity" value="1">
									<input type="hidden" name="currency_code" value="USD"/>
									
									<!--Customer Information-->
									<input type="hidden" name="custom" value="<?php echo $invoice['user_id'];?>"/>
									<input type="hidden" name="user_firstName" value="<?php echo $invoice['fname'];?>">
									<input type="hidden" name="user_lastName" value="<?php echo $invoice['surname'];?>">
									<input type="hidden" name="user_email" value="<?php echo $invoice['email'];?>">
									
								</form>
							</div>
						</div><!-- end of row-->
					</div>
				</div><!-- end of accordion body-->
			</div><!-- end of accordion group-->
			
		
		</div><!-- end of accordion-->

	</div>
</div>
<?php $this->load->view($theme.'/common/footer.tpl');?>
