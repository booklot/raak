<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

	<?php //$this->load->view($theme.'/common/header.tpl');?>

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
						<?php $img = [ 'src'=>$this->config->item('site-logo'), 'alt'=>$this->config->item('site-name') ];
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
						<tr>
							<td><small><?php echo $this->config->item('website');?></small></td>
						</tr>
					</table>
				</div>
			</div>

			<div class="col-sm-5 pull-right">
				<table class="bill-to" style="width:100%;">
					<tr>
						<td style="vertical-align:top;">
							<label class="control-label"><strong>Quotation to:</strong></label>
						</td>
						<td class="controls">
							<div><?php echo $invoice['company'];?></div>
							<div><?php echo $invoice['name'];?></div>
							<div><?php echo nl2br($invoice['address']);?></div>
							<div><?php echo $invoice['phone'] ?></div>
							<div><?php echo $invoice['email'] ?></div>
						</td>
					</tr>
					
					<tr>
						<td>
							<label class="control-label"><strong>Quote Num:</strong></label>
						</td>
						<td class="controls">
							<div><strong><?php echo time()?></strong></div>
						</td>
					</tr>
					
					<tr>
						<td>
							<label class="control-label"><strong>Date Issued:</strong></label>
						</td>
						<td class="controls">
							<div><?php echo date('d M Y, H:i:s') ?></div>
						</td>
					</tr>
					<tr>
						<td>
							<label class="control-label"><strong>Valid Until:</strong></label>
						</td>
						<td class="controls">
							<div><?php echo date('d M Y', time()+(60*60*24*14)) ?></div>
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
						<th>Tax</th>
						<th>Sub Total</th>
					</tr>
				</thead>
				<tbody>
					<?php $items = $this->cart->contents();
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
						<td class="no-back"><?php echo $item['qty'];?></td>
						<td class="no-back"><?php echo toc( $item['price'] - tax( $item['tax_rate'], $item['price']) );?></td>
						<td class="no-back"><?php echo toc( tax( $item['tax_rate'], $item['price'],TRUE)*$item['qty'] );?></td>
						<td rowspan="2" style="text-align:right;"><?php echo toc($item['price']*$item['qty']);?></td>
					</tr>
					<tr>
						<td colspan="6" style="padding: 0 0 8px 0;">
							<?php if( is_string($item['options']) ) $ops = unserialize($item['options']); 
							else $ops = $item['options'];?><small><?php echo array_implode( ' : ', ', ', $ops );?></small>
						</td>
					</tr>
					<?php endforeach;endif;?>
				</tbody>
			</table>
			</div>
			<br clear="all"><br clear="all">
			<div class="row">
			<div class="col-sm-6 pull-left">
				<h4>Notes</h4>
				<p><?php echo nl2br($invoice['notes']);?></p>
			</div>
			<div class="col-sm-5 pull-right">
				<table class="table table-receipt">
					<tr>
						<td class="alignRight">Sub Total</td>
						<td class="alignLeft"><?php echo toc( $this->cart->subtotal() )?></td>
					</tr>
					<tr>
						<td class="alignRight">Promotion Discount</td>
						<?php $cart_coupon = $this->session->userdata('cart_coupon');
						if( isset( $cart_coupon['save'] ) ) $save = $cart_coupon['save'];
						else $save = 0;	?>
						<td class="alignLeft"><?php if($save>0) echo '-';echo toc($save);?></td>
					</tr>
					<tr>
						<td class="alignRight">Gift Voucher</td>
						<?php $cart_voucher = $this->session->userdata('cart_voucher');
						if( isset( $cart_voucher['save'] ) ) $gift = $cart_voucher['save'];
						else $gift = 0;	?>
						<td class="alignLeft"><?php if($gift>0) echo '-'; echo toc($gift);?></td>
					</tr>
					<tr>
						<td class="alignRight">Tax <small><?php echo $this->cart->tax_names()?></small></td>
						<td class="alignLeft"><?php echo toc( $this->cart->tax_total() )?></td>
					</tr>
					<?php if(isset($shipping['cost'])):?>
				<tr>
					<td class="alignRight">Shipping <small>[ <?php echo $shipping['name']?> ]</small></td>
					<td class="alignLeft"><?php echo toc( $shipping['cost'] )?></td>
				</tr>
				<?php else:?>
					<tr>
						<td class="alignRight">Shipping</td>
						<td class="alignLeft"><?php echo toc( 0.0 );?></td>
					</tr>
				<?php endif;
				if(isset($fees['cost'])):?>
					<tr>
						<td class="alignRight">Transaction Fees <small>[ <?php echo $fees['name']?> ]</small></td>
						<td class="alignLeft"><?php echo toc( $fees['cost']+$this->config->item('transaction_fee') )?></td>
					</tr>
				<?php else:?>
					<tr>
						<td class="alignRight">Transaction Fees</td>
						<td class="alignLeft"><?php echo toc( $this->config->item('transaction_fee') )?></td>
					</tr>
				<?php endif;?>
					<tr>
						<td class="alignRight"><h4>Total</h4></td>
						<?php $total = cart_total();?>
						<td class="alignLeft"><h3><?php echo toc($total);?></h3></td>
					</tr>
				</table>
			</div>
			</div>
		</div> <!-- end of invoice-->
	</div><!-- end of row-->
</div><!-- end of container-->
</div>


<div class="well">
	<h4>Quotation Terms</h4>
	<p><small>
		Prices are subject to change. Any order that can be cancelled and or rescheduled is subject to a price change immediately. 
		Unless otherwise agreed to in writing by the parties, prices quoted here are those current at the date of quotation and shall 
		be subject to variation. Actual prices will be reflected on the official invoice of sale at the time an actual order is 
		placed and confirmed.
	</small></p>
</div>

<div style="display:none">
	<?php //$this->load->view($theme.'/common/footer.tpl');?>
</div>
