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
				<?php
					echo anchor( base_url().'account/print_invoice/'.$invoice['invoice_num'].'.pdf', 
					'&nbsp;&nbsp;<i class="icon-download-alt"></i>&nbsp;download system generated PDF&nbsp;&nbsp;', 
					'class="btn btn-default" style="margin-right:8px!important;"' );?>
			</div>
			<br clear="all"><br clear="all"><br clear="all">
		</div><!--end titleHeader-->

		<br clear="all">
		
		<div class="invoice col-xs-12" style="border-top:1px solid #ccc;">
			<div class="col-sm-6">
				<div class="siteLogo pull-left">
					<h1>
						<?php $img = array( 'src'=>'images/logo.png', 'alt'=>$this->config->item('site-name') );
							echo img($img);
						?>
					</h1>
					<br clear="all">
					<table>
						<tr>
							<td><small><?php echo $this->config->item('address');?></small></td>
						</tr>
						<tr>
							<td><small><?php echo lang('site-phone').', '.lang('sales-email')?></small></td>
						</tr>
					</table>
				</div>
			</div>

			<div class="col-sm-5 pull-right">
				<table class="bill-to table-responsive" style="width:100%;">
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
			
			<br clear="all"><br clear="all">
			
			<table class="table table-striped table-invoice table-responsive">
				<thead>
					<tr>
						<th>ID</th>
						<th style="text-align:left;padding-left:20px;">Name</th>
						<!-- <th style="text-align:left;padding-left:20px;">Shop</th> -->
						<th>Unit Price</th>
						<th>Discount</th>
						<th>Tax</th>
						<th>Qty</th>
						<th>Sub Total</th>
					</tr>
				</thead>
				<tbody>
					<?php $items = $invoice['invoice_details'];
					if( is_array( $items ) ):
					$this->load->helper('array');
					foreach( $items as $item ):?>
					<tr>
						<td rowspan="2"><?php echo $item['cp_id'];?></td>
						<td class="no-back" style="text-align:left;border-bottom:none;"><?php echo $item['name'];?></td>
						<!-- <td class="no-back" style="text-align:left;border-bottom:none;">
							<?php $hidden_shops = $this->config->item('hidden_shops');
							if( !in_array( $item['cid'], $hidden_shops ) ) echo $item['shop'];?>
						</td> -->
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
						<td rowspan="2"><?php echo $item['qty'];?></td>
						<td rowspan="2"><?php echo toc($dp*$item['qty']);?></td>
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
			
			<div class="col-sm-7 pull-left">
				
				<h4>Deliver To:</h4>
				<table class="bill-to table-responsive" style="width:100%;">
					<tr>
						<td class="controls">
							<div><?php echo $invoice['fname'].' '.$invoice['surname'];?></div>
							<div><?php echo html_entity_decode( $invoice['delivery_address'], ENT_QUOTES);?></div>
						</td>
					</tr>
					
				</table><!-- end of form-horizontal-->
				
				<br clear="all">
				
				<h4><?php echo anchor( site_url("account/invoice/{$invoice['invoice_num']}").'#addInvoiceNote', 'Invoice Notes:', 
				array( 'class'=>'', 'role'=>"button", 'data-toggle'=>"modal" ) );?></h4>
				<p><?php echo nl2br($invoice['notes']);?></p>
			</div>

		
			<div class="col-sm-4 pull-right">
				<table class="table table-receipt table-responsive">
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
							Transaction Fees <small>[ <?php echo $invoice['payment_method']?> ]</small>
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
			
		</div> <!-- end of invoice-->
		
		<br clear="all"><br clear="all">
		
	</div><!-- end of row-->




</div><!-- end of container-->
<?php $this->load->view($theme.'/common/footer.tpl');?>
