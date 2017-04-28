<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-8">
	<article class="block block-info">
		<h2 class="title_block">Swipe on Delivery</h2>
		
		<div class="block_content">
			<div class="col-lg-12">
				<br clear="all">

					<div class="alert alert-info">
						<h3 style="text-transform:capitalize;font-size:18px;">Payment Instructions</h3>
						<div>
							Your order will be delivered to the address you supplied. You are expected to pay the full amount due 
							on your invoice to our sales representative who will make the delivery to you.<br>
							Payment has to be made using your CABS bank card or any bank card that supports <b>Zimswitch</b>, 
							<b>Mastercard</b> or <b>Visa</b>.
							<br clear="all">
						</div>
					</div>
						
					<div class="thumbnail">
						<?php echo img('images/paypoint.jpg');?>
					</div>
					<!-- form -->

							
					<form class="form-horizontal fake">
						<div class="form-group">
							<label class="control-label col-sm-4">Amount:</label>
							<div class="col-sm-8">
								<div><strong>TOTAL on INVOICE</strong></div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">Ref / Invoice Number:</label>
							<div class="col-sm-8">
								<div><strong>INVOICE NUMBER</strong></div>
							</div>
						</div>
					</form>
					<!-- form -->
				<br clear="all">
			</div> <!-- end of blog-content-entry -->
		</div>
	</article>
</section> <!-- end of span9 -->
