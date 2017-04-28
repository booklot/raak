<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-9">

	<article class="block block-info">
		<h2 class="title_block">Simple and Flexible Payment Methods</h2>

		<div class="block_content">
			<div class="col-lg-12">
				<br clear="all">
				<div>
					<h5>Please note that all our prices are quoted in USD</h5>
					You can make payments to Zimall using the following methods
					<br clear="all">
					<hr>
					<br clear="all">
					<ol>
						<li>
							<?php echo anchor( 'shop/payments/ecocash', '&nbsp;', 'class="ecocash" alt="Ecocash"' )?>
							<br clear="all"><br clear="all">
						</li>
						<!--
						<li>
							<?php echo anchor( 'shop/payments/telecash', '&nbsp;', 'class="telecash" alt="Telecash"' )?>
							<br clear="all"><br clear="all">
						</li>
						-->
						<li>
							<?php echo anchor( 'shop/payments/paynow', '&nbsp;', 'class="paynow" alt="Paynow - Visa, Mastercard, Zimswitch Vpayments"' )?>
							<br clear="all"><br clear="all">
						</li>
						<li>
							<?php echo anchor( 'shop/payments/bank', '&nbsp;', 'class="bank-transfer" alt="Bank Transfer / Deposit"' )?>
							<br clear="all"><br clear="all">
						</li>
						<li>
							<?php echo anchor( 'shop/payments/cash', '&nbsp;', 'class="cash-on-delivery" alt="Cash On Delivery"' )?>
							<br clear="all"><br clear="all">
						</li>
						<li>
							<?php echo anchor( 'shop/payments/swipe-on-delivery', '&nbsp;', 
							'class="swipe-on-delivery" alt="Swipe on Delivery"' )?>
							<br clear="all">
						</li>
					</ol>
					<br clear="all"><br clear="all">
				</div>

			</div> <!-- end of blog-content-entry -->
		</div>
	</article>
</section> <!-- end of span9 -->
