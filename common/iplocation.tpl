<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if( isset($shipping[$best_shipping]['cost']) && $ip_location['cnt']>0 ):
	if(is_numeric($shipping[$best_shipping]['cost'])) $bsc = $shipping[$best_shipping]['cost']; else $bsc=0;?>
	<span class="shipping-cost" data-value="<?php echo $bsc;?>">
		<?php echo toc($shipping[$best_shipping]['cost']);?>
	</span>
	<span> to </span>
	<a data-toggle="modal" href="#shipping_location">
		<?php echo $ip_location['ctn'];?>
	</a>
	<span> with </span>
	<a data-toggle="modal" href="#shipping_options">
		<?php echo $shipping[$best_shipping]['name'];?>
	</a>
	<span> in <?php echo $shipping[$best_shipping]['time']?></span>
	<br>
	<i>usually dispatched in <?php echo $ptime?> business day<?php 
	if($ptime>1) echo 's';?></i>
	<?php else:?>
		<a data-toggle="modal" href="#shipping_location" class="shipping-cost" data-value="0">
			<i class="disabled">Shipping information not available</i>
		</a>
	<?php endif;?>
