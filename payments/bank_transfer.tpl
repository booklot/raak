<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php $this->load->view($theme.'/common/header.tpl');?>
<div class="container">
	<div class="block block-danger">
		<br clear="all"><br clear="all">
		<div class="clearfix">
			<h3 class="title_block"><?php echo 'Bank Transfer Details';?></h3>
			<div class="pagers pull-right">
				<div class="btn-toolbar">
					<?php echo anchor( base_url().'account/print_invoice/'.$invoice['invoice_num'].'.pdf', 
						'<i class="icon-print"></i> Print Invoice', 'class="btn btn-xs btn-default" target="_blank"' );?>
					<?php echo anchor( 'account/invoice/'.$invoice['invoice_num'], 'Back to Invoice', 'class="btn btn-xs btn-default"' );?>
				</div>
			</div>
		</div><!--end titleHeader-->
		
		<br clear="all">
		
		<div class="accordion" id="payment">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" data-parent="#payment" href="#instructions">
						<i class="icon-caret-right"></i> Bank Transfer Instructions
					</a>
				</div>
				<div id="instructions" class="accordion-body collapse in">
					<div class="accordion-inner">
						
						<div class="alert alert-block alert-info">
							<h3 style="text-transform:capitalize;font-size:18px;">Transfer Instructions</h3>
							<div>
								Please make a transfer or deposit to our bank, details given below. 
								Note that if your bank provides online banking, you can make the
								transfer from your bank's online portal.
								<br clear="all">
								<p><small class="pull-right">Note: Bank Charges may apply</small></p>
							</div>
						</div>
						
						<div class="row-fluid">
							<div class="span6">
						
								<form class="form-horizontal fake">
									<div class="form-group">
										<label class="control-label col-sm-4">Bank:</label>
										<div class="col-sm-8">
											<div><strong>Standard Chartered Bank</strong></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">Account Name:</label>
										<div class="col-sm-8">
											<div><strong><?php echo $this->config->item('site-name')?></strong></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">Account Number:</label>
										<div class="col-sm-8">
											<div><strong>8700 218304 200</strong></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">Branch:</label>
										<div class="col-sm-8">
											<div><strong>Southerton</strong></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">Swift Code:</label>
										<div class="col-sm-8">
											<div><strong>SCBLZWHXXXX</strong></div>
										</div>
									</div>
									
								</form>
							</div><!-- end of span6-->
							
							<div class="span6">
							
								<form class="form-horizontal fake">
									<div class="form-group">
										<label class="control-label col-sm-4">Amount:</label>
										<div class="col-sm-8">
											<div><strong><?php echo toc($invoice['total']);?></strong></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">Ref / Invoice Number:</label>
										<div class="col-sm-8">
											<div><strong><?php echo $invoice['invoice_num'];?></strong></div>
										</div>
									</div>
								</form>
							</div>
						</div><!-- end of row-->
						
						
						<div class="alert alert-block alert-info">
							<h2 style="text-transform:capitalize;font-size:18px;">Confirm Payment</h2>
							<br clear="all">
							<div>
								When you have successfully made the payment to the bank, please confirm below.
								<br clear="all"><br clear="all">
								<p><small class="pull-left">
									Note: It may take some time for the payment to reflect in our bank accounts and on your invoice.</small>
								</p>
								<br clear="all"><br clear="all">
								<p class="alignRight">
									<a href="#myModal" role="button" class="btn btn-primary btn-large" data-toggle="modal">
										<span style="font-size:16px">Confirm Payment</span>
									</a>
								</p>
							</div>
						</div>
						<div class="row">
							
						
						</div><!-- end of row -->
					</div>
				</div><!-- end of accordion body-->
			</div><!-- end of accordion group-->
			
		
		</div><!-- end of accordion-->
	</div>
</div>




<!-- Modal -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<?php echo form_open( current_url(), 'class="form-horizontal" style="margin-bottom:0;"' );?>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title">Confirm Bank Payment</h3>
				</div>
		
				<div class="modal-body">
			
					<div class="form-group">
						<label class="control-label col-sm-4">Payment Method</label>
						<div class="col-sm-7">
							<select name="method" class="form-control">
								<option value="cash deposit">Cash Deposit</option>
								<option value="transfer" selected>Transfer</option>
							</select>
						</div>
					</div>
			
					<div class="form-group">
						<label class="control-label col-sm-4">Amount Paid</label>
						<div class="col-sm-7">
							<div class="input-group">
								<span class="input-group-addon">$</span>
								<input type="text" name="amount_paid" value="<?php echo $invoice['total'];?>" 
									placeholder="0.00" class="form-control" required>
							</div>
						</div>
					</div>
			
					<div class="form-group">
						<label class="control-label col-sm-4">Bank Name</label>
						<div class="col-sm-7">
							<input type="text" name="bank" value="<?php echo set_value('bank');?>" 
								placeholder="Name of bank where you made the payment" class="form-control" required>
						</div>
					</div>
			
					<div class="form-group">
						<label class="control-label col-sm-4">Ref Number <small>(if given)</small></label>
						<div class="col-sm-7">
							<input name="ref_num" type="text" value="<?php echo set_value('ref_num');?>" 
								placeholder="transaction reference number from bank" class="form-control">
						</div>
					</div>
			
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
					<button type="submit" class="btn btn-primary" name="confirm_payment" value="1">Confirm Payment</button>
					<input type="hidden" name="form_name" value="confirm_payment">
					<input type="hidden" name="form_type" value="update">
					<input type="hidden" name="invoice_num" value="<?php echo $invoice['invoice_num'];?>">
				</div>
			</form>
		</div>
	</div>
</div>








<?php $this->load->view($theme.'/common/footer.tpl');?>
