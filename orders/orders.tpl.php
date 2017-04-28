<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="container">
	<br clear="all"><br clear="all">
	<div class="block block-info">
		<h3 class="title_block">
			Order History
			<span class="btn-toolbar pull-right">
				<?php echo anchor( 'account', 'Back to My Account', 'class="btn btn-xs btn-danger"' );?>
			</span>
		</h3>
		
	<div class="block_content">
		<br clear="all">
		<h3><?php echo '<em><small>Page '.ceil($current_rows/10).' of '.ceil($total_rows/10).'</small></em>';?></h3>
		<table class="table order_history" style="border: 1px solid #ccc;padding:2px;">
			<thead>
				<tr>
					<th>#</th>
					<th style="text-align:left;">Invoice</th>
					<th style="text-align:left;">Details</th>
					<th>Items</th>
					<th>Amount</th>
					<th style="text-align:left;">Status</th>
				</tr>
			</thead>
			<tbody>
		<?php foreach( $orders as $k=>$v ):?>
			<tr style="border-bottom:none;">
				<td style="padding-left:5px;padding-right:5px;padding-bottom:3px"><?php echo $start+$k;?></td>
				<td style="text-align:left;">
					<?php echo anchor('orders/status/'.$v['invoice_num'], $v['invoice_num'] );?><br>
					<?php echo date( 'd M y, g:i a',  $v['date_issued']);?>
				</td>
				<td style="text-align:left;">
				<a href="<?php echo site_url('orders/status/'.$v['invoice_num'])?>" class="invarseColor">
					<span class="single-line"><?php echo character_limiter($v['summary'], 100);?></span>
					<span class="single-line"><?php echo $v['shipping_method']?></span>
				</a>
				</td>
				<td style=""><?php echo $v['cart_items'];?></td>
				<td style="">
					<a href="<?php echo site_url('orders/status/'.$v['invoice_num'])?>" class="invarseColor">
						<?php echo toc($v['total']);?>
						<br><?php echo $v['payment_method']?>
					</a>
				</td>
				<td style="text-align:left;">
					<a href="<?php echo site_url('orders/status/'.$v['invoice_num'])?>" class="invarseColor">
					<?php
						if( $v['status'] == 7 ) $state = 'success';
						elseif( $v['status'] > 7 ) $state = 'danger';
						else $state = 'info active';
						$stage = ($v['status']/7)*100;
						if( $stage>100 ): $stage = 100; echo $v['status_name'];
						else: echo $v['status_name']."<br><em><small>".(int)$stage.'% complete</small></em>';
						endif;
					?>
					<div class="progress progress-striped" style="margin-bottom:0;height:2px;position:relative;">
						<div class="progress-bar progress-bar-<?php echo $state?>" role="progressbar" aria-valuenow="40" 
						aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $stage?>%">	</div>
					</div>
					
					</a>
				</td>
			</tr>
			<?php if(0>1):?>
			<tr class="progress">
				<td colspan="7" style="border-top:none;padding-bottom:10px;padding-top:0px">
					<?php
						if( $v['status'] == 7 ) $state = 'success';
						elseif( $v['status'] > 7 ) $state = 'danger';
						else $state = 'info active';
						$stage = ($v['status']/7)*100;
						if( $stage>100 ) $stage = 100;
					?>
					<div class="progress progress-<?php echo $state?> progress-striped" style="margin-bottom:0;height:2px;">
						<div class="bar" style="width: <?php echo $stage?>%;"></div>
					</div>
				</td>
			</tr>
			<?php endif;?>
		<?php endforeach;?>
			</tbody>
		</table>
		<!-- table -->

	
	<br clear="all"><br clear="all"><br clear="all">
		<div class="col-xs-12">
			<ul class="pagination pull-left">
				<li class="disabled"><a style="border:none;">
				Showing <?php echo $start?> to <?php echo $current_rows?> of <?php echo $total_rows?> orders
				</a></li>
			</ul>
			<ul class="pagination pull-right">
				<?php echo $this->pagination->create_links(); ?>
			</ul>
		</div>
		<!--end col-xs-12-->
	
	<br clear="all"><br clear="all">
	<div class="titleHeader clearfix">
		<div class="pagers">
			<div class="btn-toolbar">
				<?php echo anchor( 'account', 'Back to My Account', 'class="btn btn-default btn-xs"' );?>
			</div>
		</div>
	</div>
	<!--end titleHeader-->
	<br clear="all">
	</div>
</section> <!-- end of span9 -->
