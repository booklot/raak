<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-9">

	<article class="block block-info">
		<h2 class="title_block">Paynow</h2>
		<div class="block_content">
			<div class="col-lg-12">
				<br clear="all">
<p>
<?php 
	$img = array( 'src'=>'images/payment_types_badge.png', 'style'=>'float:left;margin-right:5px;', 'class'=>'img-polaroid' );
	echo anchor( 'http://www.paynow.co.zw', img($img), 'target="_blank"' );
?>
<br clear="all">
<p>
	You can make payments on <?php echo $this->config->item('site-name');?> using Paynow which accepts the following payment methods:
	<ul>
		<li><strong>ZimSwitch Vpayments:</strong><br>
			Vpayments is an online payments platform run by ZimSwitch and is currently accepting payments from customers banked at CABS, CBZ, FBC Bank, POSB and 
			ZB Bank. When you check out on Paynow you will be redirected to Vpayments to create an account or login to an existing account. In order to make payment 
			you will need a Zimbabwe ZimSwitch Card issued by one of the supported banks. Any normal bank card will work, it does not need to be a Credit Card or other 
			specially issued card.
		</li>
		<li><strong>Visa / MasterCard:</strong><br> 
			Both locally issued Visa / MasterCard cards and international Visa / MasterCard Debit and Credit cards will work on Paynow. Zimbabwean banks with Visa / 
			MasterCard support include Barclays, EcoBank, FBC Bank, Kingdom, NMB, Standbic, Standard Chartered, Steward Bank and others. Using the Visa / MasterCard 
			option does not require you to create an account, you only need your card details, as if you were making a payment on an international site.
		</li>
		<li><strong>EcoCash:</strong><br> 
			Paynow will accept payment from any registered EcoCash line. You do not need to make any other accounts or setup anything with EcoCash once you are 
			registered on the EcoCash platform. Please visit your nearest Econet shop to register for EcoCash if you are not already registered.
		</li>
		<li><strong>TeleCash:</strong><br> 
			Any registered TeleCash customer can make payment on Paynow. To register for TeleCash please visit your nearest TeleCel offices or agent.
		</li>
	</ul>
</p>
<br clear="all">


			</div> <!-- end of blog-content-entry -->
		</div>
	</article>
	
</section> <!-- end of span9 -->
