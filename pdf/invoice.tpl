<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<html>
<head>
<style>
*{
	margin: 0 !important;
	padding: 0 !important;
}

header, footer{ display: none!important; }

html, body {
	/*changing width to 100% causes huge overflow and wrap*/
	height:100%; 
	overflow: hidden;
	background: #FFF;
	font-size: 12px;
	line-height: auto;
	font-family: 'Open Sans', Tahoma, Arial sans-serif;
	font-style: normal;
	font-weight: normal;
}

.container{
	width:100%!important;
	float:none;
}

.row{
	margin:0 auto!important;
	float:none;
}


.invoice {
	width: 95%;
	padding: 1% 2%!important;
	color: #000;
	float: left;
	border: 1px solid #ccc!important;
}

table {
	margin: 0 0 !important;
	width: 98%;
}


.table thead {
	border: 1px solid #ddd!important;
	background: #e7e7e7!important;
	background: -moz-linear-gradient(top, #f7f7f7 0%, #e7e7e7 100%)!important;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f7f7f7), color-stop(100%,#e7e7e7))!important;
	background: -webkit-linear-gradient(top, #f7f7f7 0%,#e7e7e7 100%)!important;
	background: -o-linear-gradient(top, #f7f7f7 0%,#e7e7e7 100%)!important;
	background: -ms-linear-gradient(top, #f7f7f7 0%,#e7e7e7 100%)!important;
	background: linear-gradient(to bottom, #f7f7f7 0%,#e7e7e7 100%)!important;
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7f7f7', endColorstr='#e7e7e7',GradientType=0 )!important;
}

.table th{
	padding: 5px 2px!important;
	text-align: left;
	border-collapse: collapse!important;
	border-spacing: 0!important;
	background: transparent;
}


.table td {
	padding: 5px 2px!important;
	text-align: left;
	vertical-align: top;
	border-bottom: 1px dotted #ccc!important;
	border-collapse: collapse;
	border-spacing: 1px;
}

.table td.no-back
{
	border-bottom: none!important;
}

.pull-right{float:right;}
.pull-left{float:left;}
.col-sm-4{width:33.3%}
.col-sm-6{width:50%;}
.col-sm-5{width:41.66%}

.row{
	display: block;
	float: left;
	width: 100%;
	clear:both;
}

.control-group{width:100%;}
.control-label{
	text-align:right;
	font-family: 'Open Sans', Arial sans-serif;
	font-size: 12px;
}
.controls{
	padding-left:3%;
}

table .alignLeft{
	color: #000!important;
	text-align: right!important;
	letter-spacing:2px;
	padding-left:10px!important;
	padding-right:12px!important;
}

table .alignRight{
	text-align: right!important;
	padding-right:15px!important;
}


.table-receipt{
	width:100%;
}
</style>
</head>
<body>
<div>

<div class="container">
	<div class="row">
		<div class="invoice">
		<div class="row">

			<div class="col-sm-6 pull-left">
				<div class="siteLogo pull-left">
					<h1>
						<?php $img = array( 'src'=>'images/logo.png', 'alt'=>$this->config->item('site-name') );
							echo img($img);
						?>
					</h1>
					<table>
						<tr>
							<td><small><?php echo $this->config->item('address');?></small></td>
						</tr>
						<tr>
							<td><small><?php echo $this->config->item('site-phone').', '.$this->config->item('sales-email')?></small></td>
						</tr>
					</table>
				</div>
			</div>

			<div class="col-sm-5 pull-right">
				<table class="bill-to" style="width:100%;">
					<tr>
						<td>
							<label class="control-label"><strong>Bill To:</strong></label>
						</td>
						<td class="controls">
							<div><?php echo $invoice['fname'].' '.$invoice['surname'];?></div>
							<div><?php echo html_entity_decode( $invoice['billing_address'], ENT_QUOTES );?></div>
							<div><?php echo $invoice['phone'] ?></div>
						</td>
					</tr>
					
					<tr>
						<td>
							<label class="control-label"><strong>Invoice / Ref Num:</strong></label>
						</td>
						<td class="controls">
							<div><strong><?php echo $invoice['invoice_num'] ?></strong></div>
						</td>
					</tr>
					
					<tr>
						<td>
							<label class="control-label"><strong>Date Issued:</strong></label>
						</td>
						<td class="controls">
							<div><?php echo date( 'd M Y, H:i:s',$invoice['date_issued'] ) ?></div>
						</td>
					</tr>
					
					<tr>
						<td>
							<label class="control-label"><strong>Status:</strong></label>
						</td>
						<td class="controls">
							<div><?php echo $invoice['status_name'];?></div>
						</td>
					</tr>
					
					<tr>
						<td>
							<label class="control-label"><strong>Amount:</strong></label>
						</td>
						<td class="controls">
							<div><strong><?php echo toc($invoice['total']);?></strong></div>
						</td>
					</tr>
					
				</table><!-- end of form-horizontal-->
			</div><!-- end of span5-->
			</div>
			<br clear="all"><br clear="all">
			<div class="row">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ISBN/SKU</th>
						<th>Name</th>
						<!-- <th>Shop</th> -->
						<th>Qty</th>
						<th>Unit Price</th>
						<th>Discount</th>
						<th>Tax</th>
						<th>Sub Total</th>
					</tr>
				</thead>
				<tbody>
					<?php $items = $invoice['invoice_details'];
					if( is_array( $items ) ):
					$this->load->helper('array');
					$sku_prefix = $this->config->item('sku_prefix');
					foreach( $items as $item ):?>
					<tr>
						<td rowspan="2"><?php 
							//echo $item['cp_id'];
							echo $item['isbn']?$item['isbn']:( $item['cp_sku']?$sku_prefix.$item['cp_sku']:$item['cp_id'] );
						?>
						</td>
						<td class="no-back"><?php echo $item['name'];?></td>
						<!-- <td class="no-back">
							<?php $hidden_shops = $this->config->item('hidden_shops');
							if( !in_array( $item['cid'], $hidden_shops ) ) echo $item['shop'];?>
						</td> -->
						<td rowspan="2"><?php echo $item['qty'];?></td>
						<td rowspan="2"><?php echo toc( $item['price'] - tax( $item['tax_rate'], $item['price']) );?></td>
						<td rowspan="2">
							<?php 
								$discount = discount_amt( $item['price'], $item['dsr_value'], $item['dsr_percentage'],
									$item['tax_rate'] );
								echo toc( $discount );
								$dp = discount_price( $item['price'], $item['dsr_value'], TRUE, $item['dsr_percentage'], 
									$item['tax_rate'] );
								//echo toc( $item['price'] - tax( $item['tax_rate'], $item['price']) );
							?>
						</td>
						<td rowspan="2"><?php echo toc( tax( $item['tax_rate'], $dp,TRUE) );?></td>
						<td rowspan="2"><?php echo toc($dp*$item['qty']);?></td>
					</tr>
					<tr>
						<td colspan="7" style="padding: 0 0 8px 0;">
							<small><?php echo array_implode( ' : ', ', ', unserialize($item['options']) );?></small>
						</td>
					</tr>
					<?php endforeach;endif;?>
				</tbody>
			</table>
			</div>
			<br clear="all"><br clear="all">
			<div class="row">
			<div class="col-sm-6 pull-left">
				
				<h4>Deliver To:</h4>
				<table class="bill-to" style="width:100%;">
					<tr>
						<td class="controls">
							<div>
								<?php if(strlen($invoice['recipient'])>3) echo $invoice['recipient']; 
								else echo $invoice['fname'].' '.$invoice['surname'];?>
							</div>
							<div><?php echo html_entity_decode( $invoice['delivery_address'], ENT_QUOTES );?></div>
						</td>
					</tr>
					
				</table><!-- end of form-horizontal-->
				
				<br clear="all">
				
				<h4>Invoice Notes:</h4>
				<p><?php echo nl2br($invoice['notes']);?></p>
			</div>
			
			<div class="col-sm-4 pull-right">
				<table class="table table-receipt">
					<tr>
						<td class="alignRight">Sub Total</td>
						<td class="alignLeft"><?php echo toc( $invoice['sub_total'] )?></td>
					</tr>
					<tr>
						<td class="alignRight">Discount</td>
						<td class="alignLeft">
							<?php if($invoice['discount']>0) echo '('; 
								echo toc($invoice['discount']); 
								if($invoice['discount']>0) echo ')';
							?>
						</td>
					</tr>
					<tr>
						<td class="alignRight">Gift Voucher</td>
						<td class="alignLeft"><?php if($invoice['gift_voucher']>0) echo '-';echo toc($invoice['gift_voucher']);?></td>
					</tr>
					<tr>
						<td class="alignRight">Tax <small><?php echo $invoice['tax_name'];?></small></td>
						<td class="alignLeft"><?php echo toc( $invoice['tax']);?></td>
					</tr>
					<tr>
						<td class="alignRight">Shipping <small>[ <?php echo $invoice['shipping_method']?> ]</small></td>
						<td class="alignLeft"><?php echo toc( $invoice['shipping'] )?></td>
					</tr>
					<tr>
						<td class="alignRight">
							Transaction Fees <small>[ <?php echo $invoice['payment_method'];?> ]</small>
						</td>
						<td class="alignLeft"><?php echo toc( $invoice['fees'] )?></td>
					</tr>
					<tr>
						<td class="alignRight"><h4>Total</h4></td>
						<td class="alignLeft"><h4><?php echo toc( $invoice['total'] )?></h4></td>
					</tr>
					<tr>
						<td class="alignRight"><h4>Amount Paid</h4></td>
						<td class="alignLeft"><h4><?php echo toc( $invoice['amount_paid'] )?></h4></td>
					</tr>
					<tr>
						<td class="alignRight"><h4>Amount Due</h4></td>
						<td class="alignLeft"><h4><?php echo toc( $invoice['total']-$invoice['amount_paid'] )?></h4></td>
					</tr>
				</table>
			</div>
			</div>
		</div> <!-- end of invoice-->
		


	</div><!-- end of row-->
</div><!-- end of container-->
</div>
