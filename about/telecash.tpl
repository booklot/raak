<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-9">

	<article class="block block-info">
		<h2 class="title_block">Telecash Payment Method</h2>

		<div class="block_content">
			<div class="col-lg-12">
				<br clear="all">
<p>
<?php 
	$img = array( 'src'=>'images/telecash.png', 'style'=>'float:left;margin-right:5px;', 'class'=>'img-polaroid' );
	echo anchor( 'http://www.telecel.co.zw/telecash/', img($img), 'target="_blank"' );
?>
Telecash is a mobile payment solution that enables Telecel customers to complete simple financial transactions such as sending money, buying prepaid airtime for themselves or other Telecel subscribers and paying for goods and services</p>

<p>You can also pay for your orders on <?php echo lang('site-name')?> using Telecash. <?php echo lang('site-name')?> is a registered Telecash Merchant and to pay using Telecash on <?php echo lang('site-name')?>, you need to have the following:
<ol>
	<li>A registered Telecel(ZW) sim card which is also registered with Telecash.</li>
	<li>A <?php echo lang('site-name')?> invoice number generated after placing an order.</li>
	<li>A minimum balance equivalent to the amount on the <?php echo lang('site-name')?> invoice plus <?php echo toc(1.5);?> in your Telecash account.</li>
</ol>
<ul><li><?php echo lang('site-name')?> Telecash Merchant Code - <strong><?php echo $this->config->item('telecash_merchant')?></strong></li></ul>

</p>

<p>To make a payment using Telecash (use your mobile phone):
	<ol>
		<li>Dial <strong>*888#</strong></li>
		<li>Select <strong>Pay Merchant</strong></li>
		<li>Enter Merchant Code: <strong><?php echo $this->config->item('telecash_merchant');?></strong></li>
		<li>Enter Amount: <strong>as given on invoice</strong></li>
		<li>Enter your telecash password</li>
		<!-- 
		<li>Enter Invoice / Account Number: <strong><?php echo $invoice['invoice_num'];?></strong></li>
		-->
		<li>Select <strong>Confirm</strong> payment to <?php echo $this->config->item('telecash_merchant_name');?></li>
	</ol>
	<!-- 
	<h5>Short Way</h5>
	<ol>
		<li>Dial <strong>*888*4*<?php echo $this->config->item('telecash_merchant');?>#</strong></li>
		<li>Enter Amount: <strong>as given on invoice</strong></li>
		<li>Enter your Telecash password to <strong>Confirm</strong> payment to <?php echo 
			$this->config->item('telecash_merchant_name');?> or <strong>0</strong> to cancel</li>
	</ol>
	 -->
</p>

<p>When transaction is successful, you will immediately receive a message from Telecash with an approval code. Keep the approval code as it may be required by <?php echo lang('site-name')?> to confirm your payment in case we run into any trouble.</p>

<p>
Note that we do not charge you for using Telecash, however Telecash charges may apply.
</p>


			</div> <!-- end of blog-content-entry -->
		</div>
	</article>
	
</section> <!-- end of span9 -->
