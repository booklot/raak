<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php $this->load->view($theme.'/common/header.tpl');?>
<div class="container">
	<div class="block block-danger">
		<br clear="all"><br clear="all">
		<div class="clearfix">
			<h3 class="title_block"><?php echo 'Telecash Details';?></h3>
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
						<i class="icon-caret-right"></i> Telecash Instructions
					</a>
				</div>
				<div id="instructions" class="accordion-body collapse in">
					<div class="accordion-inner">
						
						<div class="alert alert-block alert-info">
							<h3 style="text-transform:capitalize;">Note</h3>
							<div>
								This payment method only works for Telecel (ZW) subscribers only!
								<br><br>
								
								<table border="0" class="blank">
									<tr><td>Merchant Code</td><th><?php echo $this->config->item('telecash_merchant');?></th></tr>
									<tr><td>Invoice / Ref / Account Number</td><th><?php echo $invoice['invoice_num'];?></th></tr>
									<tr><td>Amount</td><th><?php echo toc($invoice['total']);?></th></tr>
								</table>
								<!-- 
								<form class="form-horizontal fake">
									<div class="control-group">
										<label class="control-label">Merchant Code:</label>
										<div class="controls">
											<div><strong><?php echo $this->config->item('telecash_merchant');?></strong></div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Invoice / Ref / Account Number:</label>
										<div class="controls">
											<div><strong><?php echo $invoice['invoice_num'];?></strong></div>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Amount:</label>
										<div class="controls">
											<div><strong><?php echo toc($invoice['total']);?></strong></div>
										</div>
									</div>
								</form>
								 -->
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-6">
							
							<legend>First, on your phone</legend>
								
								<ol>
									<li>Dial <strong>*888#</strong></li>
									<li>Select <strong>Pay Merchant</strong></li>
									<li>Enter Merchant Code: <strong><?php echo $this->config->item('telecash_merchant');?></strong></li>
									<li>Enter Amount: <strong><?php echo toc($invoice['total'],FALSE);?></strong></li>
									<li>Enter your Telecash password</li>
									<!-- 
									<li>Enter Invoice / Account Number: <strong><?php echo $invoice['invoice_num'];?></strong></li>
									-->
									<li>Select <strong>Confirm</strong> payment to Merchant Code <?php echo $this->config->item('telecash_merchant');?></li>
								</ol>
								<!-- 
								<h5>Short Way</h5>
								<ol>
									<li>Dial <strong>*888*4*<?php echo $this->config->item('telecash_merchant');?>#</strong></li>
									<li>Enter Amount: <strong><?php echo toc($invoice['total'],FALSE);?></strong></li>
									<li>Enter your Telecash <strong>password to Confirm</strong> payment to <?php echo 
										$this->config->item('telecash_biller_name');?> or <strong>0</strong> to cancel</li>
								</ol>
								 -->
							</div><!-- end of span6-->
							
							<div class="col-sm-6">
								<legend>then...</legend>
								When you have successfully made the payment using your phone and have received the Telecash Confirmation code, click the button below
								<br clear="all"><br clear="all">
								<?php $a = array( 'role'=>"button", 'class'=>"btn btn-warning", 'data-toggle'=>"modal" );
								echo anchor( current_url().'#telecash', 'Confirm Payment', $a ) ?>
							</div>
							
						</div><!-- end of row-->
						
						
<div class="modal fade" id="telecash">
	<div class="modal-dialog">
		<div class="modal-content">
			<?php echo form_open( current_url(), array( 'class'=>'form-horizontal', 'id'=>'confirm_payment', 'style'=>'margin:0;' ) )?>
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Confirm Telecash Payment</h3>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
						<label class="control-label col-sm-3">Phone Number</label>
						<div class="col-sm-8">
							<div class="input-group">
								<span class="input-group-addon">+263</span>
								<input type="text" pattern="[0-9]{9,10}" maxlength="10" name="phone" 
									placeholder="phone number used to make payment" 
									value="<?php echo $this->input->post('phone');?>" required class="form-control input-sm">
							</div>
						</div>
					</div>
								
					<div class="form-group">
						<label class="control-label col-sm-3">Approval Code</label>
						<div class="col-sm-8">
							<input type="text" name="conf_code" placeholder="MO<?php echo date('ymd.Hi')?>.M08313" 
								value="<?php echo $this->input->post('conf_code');?>" class="form-control input-sm">
						</div>
					</div>
								
					<div class="form-group">
						<label class="control-label col-sm-3">Amount Paid</label>
						<div class="col-sm-8">
							<div class="input-group">
								<span class="input-group-addon">$</span>
								<input type="text" name="amount_paid" 
									placeholder="exaxt amount you paid" 
									value="<?php echo $invoice['total'];?>" required class="input-sm form-control">
							</div>
						</div>
					</div>
								
				</div>		
				
				<div class="modal-footer">
					<input type="hidden" name="invoice_num" value="<?php echo $invoice['invoice_num']?>" required>
					<input type="hidden" name="biller" value="<?php echo $this->config->item('telecash_merchant');?>">
					<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
					<button type="submit" class="btn btn-primary" name="confirm_payment" value="1">Confirm</button>
				</div>
			</form>
		</div>
	</div>
</div><!-- end of modal-->
						
						
					</div>
				</div><!-- end of accordion body-->
			</div><!-- end of accordion group-->
			
		
		</div><!-- end of accordion-->

	</div>
</div>
<?php $this->load->view($theme.'/common/footer.tpl');?>
