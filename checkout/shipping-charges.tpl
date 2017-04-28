<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="panel panel-default">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" 
				href="#shipping-charges">
				<i class="icon-caret-right"></i> Estimate Shipping / Charges
			</a>
		</h4>
	</div>
	<div id="shipping-charges" class="panel-collapse collapse in">
		<div class="panel-body">
			<?php 
				if($this->flexi_auth->is_logged_in()) 
					$this->load->view("$theme/checkout/estimate_charges_logged_in.tpl");
				else $this->load->view("$theme/checkout/estimate_charges_logged_out.tpl");
			?>
		</div>
	</div>
</div><!-- panel panel-default -->
