<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<div class="panel panel-<?php if($checkout['option']=='confirm_order') echo 'primary'; else echo 'default';?>">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#checkout" href="#step6">
				<?php 
					if( isset($express_checkout) && $express_checkout) $stp=3; else $stp=6;
					if($checkout['option']=='confirm_order'):
						echo "<strong>Confirm Order</strong>";
					else:
						echo "Confirm Order";
					endif;
				?>
			</a>
		</h4>
	</div>

	<div id="step6" class="panel-collapse collapse <?php if($checkout['option']=='confirm_order' || $checkout['step']>=4) echo 'in';?>">
		<div class="panel-body">
			<?php $this->load->view($theme.'/checkout/cart.tpl.php');?>
		</div>
		<!-- panel-body -->
	</div>
	<!-- #step2 panel-collapse -->
</div>
<!-- panel -->
