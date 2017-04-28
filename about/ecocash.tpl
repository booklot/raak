<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-9">
	<article class="block block-info">
		<h2 class="title_block">Ecocash Payment Method</h2>
		<div class="block_content">
			<div class="col-lg-12">
				<br clear="all">
<p>
<?php 
	$img = array( 'src'=>'images/ecocash.png', 'style'=>'float:left;margin-right:5px;', 'class'=>'img-polaroid' );
	echo anchor( 'https://www.econet.co.zw/ecocash/', img($img), 'target="_blank"' );
?>
Ecocash is an innovative mobile payment solution that enables Econet customers to complete simple financial transactions such as sending money to loved ones, buying prepaid airtime for themselves or other Econet subscribers and paying for goods and services</p>

<p>You can also pay for your orders on <?php echo lang('site-name')?> using Ecocash. <?php echo lang('site-name')?> is a registered Ecocash Merchant and to pay using Ecocash on <?php echo lang('site-name')?>, you need to have the following:
<ol>
	<li>A registered Econet(ZW) sim card which is also registered with Ecocash.</li>
	<li>A <?php echo lang('site-name')?> invoice number generated after placing an order.</li>
	<li>A minimum balance equivalent to the amount on the <?php echo lang('site-name')?> invoice plus <?php echo toc(1.5);?> in your Ecocash account.</li>
</ol>
<ul><li><?php echo lang('site-name')?> Ecocash Merchant Code - <strong><?php echo $this->config->item('ecocash_merchant')?></strong></li></ul>

</p>

<p>To make a payment using Ecocash (use your mobile phone):
	<h5>Long Way</h5>
	<ol>
		<li>Dial <strong>*151#</strong></li>
		<li>Enter your ecocash password</li>
		<li>Select <strong>Make Payment</strong></li>
		<li>Select <strong>Pay Merchant</strong></li>
		<li>Enter Merchant Code: <strong><?php echo $this->config->item('ecocash_merchant');?></strong></li>
		<li>Enter Amount: <strong>as given on invoice</strong></li>
		<!-- 
		<li>Enter Invoice / Account Number: <strong><?php echo $invoice['invoice_num'];?></strong></li>
		-->
		<li>Select <strong>Confirm</strong> payment to <?php echo $this->config->item('ecocash_biller_name');?></li>
	</ol>
	<h5>Short Way</h5>
	<ol>
		<li>Dial <strong>*151*3*2*<?php echo $this->config->item('ecocash_merchant');?>#</strong></li>
		<li>Enter Amount: <strong>as given on invoice</strong></li>
		<li>Enter your Ecocash password to <strong>Confirm</strong> payment to <?php echo 
			$this->config->item('ecocash_biller_name');?> or <strong>0</strong> to cancel</li>
	</ol>
</p>

<p>When transaction is successful, you will immediately receive a message from Ecocash with an approval code. Keep the approval code as it may be required by <?php echo lang('site-name')?> to confirm your payment in case we run into any trouble.</p>

<p>
Note that we do not charge you for using Ecocash, however the Ecocash charges below apply, see table below.
</p>
<style>
.ecocash-table td{padding: 5px;}
</style>
<table class="table table-bordered table-striped ecocash-table">

<tr>
<th>Lower Value ($)</th>
<th>Upper Value ($)</th>
<th>Fee ($)</th>
</tr>
<tbody>
<tr>
<td>1</td>
<td>50</td>
<td>2%</td>
</tr>
<tr>
<td>50.01</td>
<td>75</td>
<td>1.25</td>
</tr>
<tr>
<td>75.01</td>
<td>100</td>
<td>1.45</td>
</tr>
<tr>
<td>100.01</td>
<td>150</td>
<td>1.55</td>
</tr>
<tr>
<td>150.01</td>
<td>200</td>
<td>1.65</td>
</tr>
<tr>
<td>200.01</td>
<td>300</td>
<td>1.75</td>
</tr>
<tr>
<td>300.01</td>
<td>400</td>
<td>1.85</td>
</tr>
<tr>
<td>400.01</td>
<td>500</td>
<td>1.95</td>
</tr>
</tbody>
</table>

<br clear="all">

			</div> <!-- end of blog-content-entry -->
		</div>
	</article>
	
</section> <!-- end of span9 -->
