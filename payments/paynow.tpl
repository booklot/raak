<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php $this->load->view($theme.'/common/header.tpl');?>
<div class="container">
	<div class="block block-danger">
		<br clear="all"><br clear="all">
		<div class="clearfix">
			<h3 class="title_block"><?php echo 'Pay with Paynow';?></h3>
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
								You will be redirected to the Paynow Website to complete the payment. Click the button below to make the payment.
							</div>
						</div>
						
						<div class="row">
														
							<div class="col-sm-6">
							<?php if(isset($paynow_data)):
								echo form_open( current_url(), 'class="form-horizontal fake"');?>
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
											<?php echo anchor( $paynow_data['browserurl'], 'Make Payment', 'class="btn btn-success btn-lg"' );?>
										</div>
									</div>
								</form>
								<?php else:?>
									<div class="alert alert-warning">Error initializing the Paynow Gateway.</div>
								<?php endif;?>
							</div>
						</div><!-- end of row-->
					</div>
				</div><!-- end of accordion body-->
			</div><!-- end of accordion group-->
			
		
		</div><!-- end of accordion-->

	</div>
</div>
<?php $this->load->view($theme.'/common/footer.tpl');?>
