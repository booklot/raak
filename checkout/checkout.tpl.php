<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="row">
	<div class="container">
		<div class="panel-group" id="checkout">
			<?php 
				if( isset($checkout['step']) && $checkout['step']==4 ):
					$this->load->view($theme.'/checkout/new/delivery.tpl.php');
				elseif( isset($checkout['step']) && $checkout['step']>4 ):
					$this->load->view($theme.'/checkout/new/confirm_order.tpl.php');
					$this->load->view($theme.'/checkout/new/delivery_method.tpl.php');
				else:
					$this->load->view("$theme/checkout/new/step-1.tpl.php");
				endif;
			?>
		</div>
		<!-- #checkout -->
	</div>
	<!-- end of container-->
</div> <!-- end of row -->

<?php 
	if(!$this->flexi_auth->is_logged_in())
	{
		//$this->load->view("$theme/account/guest_reg.tpl");
		//$this->load->view("$theme/account/ajax_register.tpl");
	}
	if(isset($load_ajax_address))
	{
		//$this->load->view("$theme/account/ajax_add_address.tpl");
	}
	//if(isset($load_delivery_address)) $this->load->view("$theme/account/delivery_address.tpl");
?>
