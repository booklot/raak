<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="container">
	<div class="block block-danger">
		<div class="clearfix">
			<h3 class="title_block"><?php echo 'Order Placed Successfully';?></h3>
		</div><!--end titleHeader-->
		
		<br clear="all">
		
		<div class="accordion" id="payment">
			<div class="accordion-group">
				<div class="accordion-heading">
					<h3>
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#payment" href="#instructions">
							<i class="icon-caret-right"></i> Before you proceed...
						</a>
					</h3>
				</div>
				<div id="instructions" class="accordion-body collapse in">
					<div class="accordion-inner">
						
						<div class="">
							<h3 style="text-transform:capitalize;"><strong>Payment</strong></h3>
							<p>
								If you already got confirmation from us that the books you ordered are available, please continue 
								to payment.<br> 
								If not, then kindly wait for your order status to be updated to <b><i>awaiting payment</i></b>.<br> 
								An email will also be sent confirming whether the product is available or not.<br> 
								This process usually takes less than 5 minutes during normal working hours.<br><br> 
							</p>
							<?php if(!empty($invoice['shipping_notes'])):?>
							<h3 style="text-transform:capitalize;"><strong>Delivery</strong></h3>
							<p><?php echo nl2br($invoice['shipping_notes'])?></p><br><br>
							<?php endif;?>
						</div>
						
						<div class="row">
							<div class="col-sm-6">
							<div class="alert alert-success">
								<legend>Product availability already confirmed</legend>
								<?php $a = array( 'class'=>"btn btn-warning" );
								echo anchor( "account/make_payment/{$invoice['invoice_num']}", 'Proceed To Payment', $a ) ?>
							</div><!-- end of span6--></div>
							
							<div class="col-sm-6">
							<div class="alert alert-danger">
								<legend>Availability not yet confirmed</legend>
								<?php $a = array( 'class'=>"btn btn-default" );
								echo anchor( "account/invoice/{$invoice['invoice_num']}", 'Pay Later', $a ) ?>
							</div></div>
							
						</div><!-- end of row-->
						<br clear="all"><br clear="all"><br clear="all">
					</div>
				</div><!-- end of accordion body-->
			</div><!-- end of accordion group-->
			
		
		</div><!-- end of accordion-->

	</div>
</div>
