<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php $this->load->view($theme.'/common/header.tpl');?>
<div class="container">
	<div class="">
		<br clear="all">
		<div class="titleHeader clearfix hidden-print">
			<div class="btn-toolbar" style="text-align:center;">
				<a class="btn btn-info" style="margin-right:8px!important;" onclick="print()">
					&nbsp;&nbsp;<i class="icon-print"></i> print or create pdf&nbsp;&nbsp;
				</a>
			</div>
			<br clear="all"><br clear="all"><br clear="all">
		</div><!--end titleHeader-->

		<br clear="all">
		
		<div class="invoice col-xs-12" style="border-top:1px solid #ccc;text-align:left;">
			<div class="siteLogo">
				<table class="table">
					<tr>
						<td style="text-align:left;background:none;">
							<h1>
								<?php echo img( $this->config->item('site-logo') );?>
							</h1>
						</td>
						<td style="text-align:left;background:none;">
							<small><?php echo $this->config->item('address');?></small><br>
							<small><?php echo $this->config->item('site-phone');?></small><br>
							<small><?php echo $this->config->item('sales-email');?></small><br>
							<small><?php echo $this->config->item('website')?></small>
						</td>
						<td style="text-align:left;background:none;">
							<h2>DELIVERY NOTE</h2>
						</td>
					</tr>
				</table>
			</div>

			<br clear="all">

			<table class="table">
				<tr>
					<td style="width:49%;text-align:left;" class="controls">
						<div class="well" style="padding:5px 10px;">
							<strong>BILLED TO:</strong><br>
							<div><?php echo $invoice['fname'].' '.$invoice['surname'];?></div>
							<div><?php echo html_entity_decode( $invoice['billing_address'], ENT_QUOTES );?></div>
							<div><?php echo $invoice['phone'] ?></div>
						</div>
					</td>
					<td style="width:2%;"></td>
					<td style="width:49%;text-align:left;" class="controls">
						<div class="well" style="padding:5px 10px;">
							<strong>DELIVER TO:</strong><br clear="all">
							<div>
								<?php if(strlen($invoice['recipient'])>3) echo $invoice['recipient']; 
								//else echo $invoice['fname'].' '.$invoice['surname'];?>
							</div>
							<div><?php echo html_entity_decode( $invoice['delivery_address'], ENT_QUOTES);?></div>
							<br clear="all">
						</div>
					</td>
				</tr>
			</table>
			<br clear="all"><br clear="all">
			
			<table class="table table-striped table-invoice table-responsive">
				<thead>
					<tr>
						<th style="text-align:left;">Invoice Number</th>
						<th style="text-align:left;">Order Date</th>
						<th style="text-align:left;">Delivery Date</th>
						<th style="text-align:left;">Delivery Method</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align:left;"><?php echo $invoice['invoice_num'] ?></td>
						<td style="text-align:left;"><?php echo date( 'd M Y',$invoice['date_issued'] ) ?></td>
						<td></td>
						<td style="text-align:left;"><?php echo $invoice['shipping_method']?></td>
					</tr>
				</tbody>
			</table>
			
			<br clear="all"><br clear="all">
			
			<table class="table table-invoice table-responsive">
				<thead>
					<tr>
						<th>No.</th>
						<th>Qty</th>
						<th style="text-align:left;padding-left:20px;">ISBN/SKU</th>
						<th style="text-align:left;padding-left:20px;">Product Description</th>
					</tr>
				</thead>
				<tbody>
					<?php $items = $invoice['invoice_details'];
					if( is_array( $items ) ):
					$this->load->helper('array');
					$sku_prefix = $this->config->item('sku_prefix');
					foreach( $items as $k=>$item ):?>
					<tr>
						<td rowspan="2"><?php echo $k+1;?></td>
						<td rowspan="2"><?php echo $item['qty'];?></td>
						<td rowspan="2" style="text-align:left;padding-left:20px;">
							<?php echo $item['isbn']?$item['isbn']:( $item['cp_sku']?$sku_prefix.$item['cp_sku']:'' );?>
						</td>
						<td class="no-back" style="text-align:left;padding-left:0!important;border-bottom:none!important;">
							<?php echo $item['name'];?>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:left;padding: 0px 5px 5px 20px;border-top:none;">
							<small><?php echo array_implode( ' : ', ', ', unserialize($item['options']) );?></small>
						</td>
					</tr>
					<?php endforeach;endif;?>
				</tbody>
			</table>
			
			<br clear="all"><br clear="all">
			<br clear="all"><br clear="all">
			
			<div class="col-sm-12">
				
				<table class="table table-responsive" style="width:100%;">
					<tr>
						<td style="text-align:left;width:33%;">
							Print Name:
						</td>
						<td style="text-align:left;width:37%;">
							Customer Signature:
						</td>
						<td style="text-align:left;width:30%;">
							Date:
						</td>
					</tr>
					
				</table><!-- end of form-horizontal-->
				
				<br clear="all">
				
			</div>
			
		</div> <!-- end of invoice-->
		
		<br clear="all"><br clear="all">
		
	</div><!-- end of row-->




</div><!-- end of container-->
<?php $this->load->view($theme.'/common/footer.tpl');?>
