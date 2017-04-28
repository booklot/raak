<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php $this->load->view($theme.'/common/header.tpl');?>
<div class="container">
	<br clear="all"><br clear="all">
	<div class="block block-info">
		<h3 class="title_block">Invoice <?php echo $invoice['invoice_num']?></h3>
		<div class="btn-toolbar pull-right">
			<div class="btn-toolbar">
				<?php 
					if( $invoice['amount_paid'] < $invoice['total'] && $invoice['status'] < 4 )
						echo anchor('account/make_payment/'.$invoice['invoice_num'],'Make Payment','class="btn btn-xs btn-primary"');
					elseif( $invoice['status'] == 6 )
						echo anchor( 'account/make_payment/'.$invoice['invoice_num'], 'Confirm Delivery', 
						'class="btn btn-xs btn-success"' );
					elseif( $invoice['amount_paid']==$invoice['total'] && $invoice['shipping_method']=='Download' )
						echo anchor( 'account/downloads/', 'Go To My Downloads', 
						'class="btn btn-xs btn-success"' );
					
					echo anchor( base_url().'account/printable_invoice/'.$invoice['invoice_num'], 
						'<i class="icon-print"></i> Print Invoice', 'class="btn btn-xs btn-default" target="_blank"' );
						
					//echo anchor( base_url().'account/print_invoice/'.$invoice['invoice_num'].'.pdf', 
					//	'<i class="icon-print"></i> Print Invoice', 'class="btn btn-xs btn-default" target="_blank"' );
					
					echo anchor( site_url("account/invoice/{$invoice['invoice_num']}").'#addInvoiceNote', 
						'<i class="icon-edit"></i> Add Invoice Note', 
						array( 'class'=>'btn btn-xs btn-default', 'role'=>"button", 'data-toggle'=>"modal" ) );
					
					$ohp = $this->session->userdata('order_history_page');
					if(!$ohp) $ohp = 'account/order_history';
					echo anchor( $ohp, 'Back to Order History', 'class="btn btn-xs btn-default"' );
				?>
			</div>
			<!-- btn-toolbar -->
		</div>
		<!--pull-right-->
		<br clear="all"><br clear="all">
		<?php 
			if( $invoice['status'] == 7 ) $state = 'succes';
			elseif( $invoice['status'] > 7 ) $state = 'danger';
			else $state = 'success active';
			$stage = ($invoice['status']/7)*100;
			if( $stage>100 ) $stage = 100;
		?>
		
		<?php if($invoice['status']>7):?>
		<div class="progress progress-striped" style="margin-bottom:-1px;">
			<div class="progress-bar progress-bar-<?php echo $state?>" role="progressbar" aria-valuenow="40" 
			aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $stage?>%"><?php 
				if($invoice['status']>7) echo '<strong>'.$invoice['status_name'].'</strong>';?></div>
		</div>
		<!-- progress-->
		<?php endif;?>
		<div class="col-xs-12" style="padding:0;background:#fff;margin-bottom:-2px;">
			<ol class="progtrckr" data-progtrckr-steps="7">
				<?php foreach($order_status as $k=>$v):
					if( $v['id'] <=7 && $invoice['status'] <=7 ):
						if( $v['id'] < $invoice['status'] )
							$status = 'done';
						elseif( $v['id'] == $invoice['status'] )
							$status = 'current blink_me';
						else $status = 'todo';
				?>
				<li class="progtrckr-<?php echo $status;?> pull-left"><?php echo character_limiter( $v['name'], 15 );?></li>
				<?php endif; endforeach;?>
			</ol>
		</div>
		<!-- col-sm-12 -->
		<div class="invoice col-xs-12">

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
			</div>
			<!-- end of span5-->
			
			<br clear="all"><br clear="all">
			
			<table class="table table-striped table-invoice">
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
						<td class="no-back"><?php echo $item['name'];?></td>
						<!-- <td class="no-back">
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
						<td colspan="2" style="text-align:left;padding: 0px 5px 5px 20px;">
							<small><?php echo array_implode( ' : ', ', ', unserialize($item['options']) );?></small>
						</td>
					</tr>
					<?php endforeach;endif;?>
				</tbody>
			</table>
			<!-- table -->
			
			<br clear="all"><br clear="all">
			
			<div class="col-sm-7 pull-left">
				
				<h4>Deliver To:</h4>
				<table class="bill-to" style="width:100%;">
					<tr>
						<td class="controls">
							<div>
								<?php if(strlen($invoice['recipient'])>3) echo $invoice['recipient']; 
								else echo $invoice['fname'].' '.$invoice['surname'];?>
							</div>
							<div><?php echo html_entity_decode( $invoice['delivery_address'], ENT_QUOTES);?></div>
						</td>
					</tr>
					
				</table><!-- end of form-horizontal-->
				
				<br clear="all">
				
				<h4><?php echo anchor( site_url("account/invoice/{$invoice['invoice_num']}").'#addInvoiceNote', 'Invoice Notes:', 
				array( 'class'=>'', 'role'=>"button", 'data-toggle'=>"modal" ) );?></h4>
				<p><?php echo nl2br($invoice['notes']);?></p>
			</div>
			<!-- col-sm-7 -->

		
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
				<!-- table -->
			</div>
			
		</div> 
		<!-- end of invoice-->
		
		<br clear="all"><br clear="all">
		
		<div class="titleHeader">
			<!-- <h3><?php echo 'Invoice Details';?></h3> -->
			<div class="pagers">
				<div class="btn-toolbar">
					<?php 
						if( $invoice['status'] < 11 )
						echo anchor( 'account/cancel_order/'.$invoice['invoice_num'], 'Cancel Order', 'class="btn btn-default btn-sm"' );
						if( $invoice['amount_paid'] < $invoice['total'] && $invoice['status'] < 4 )
						echo anchor( 'account/make_payment/'.$invoice['invoice_num'], 'Make Payment', 'class="btn btn-primary btn-sm"' );
						elseif( $invoice['status'] == 6 )
						echo anchor( 'account/make_payment/'.$invoice['invoice_num'], 'Confirm Delivery', 
							'class="btn btn-sm btn-success"' );
					?>
				</div>
			</div>
		</div>
		<!--end titleHeader-->
		
	</div>
	<!-- end of block-->



<div class="modal fade" id="addInvoiceNote">
	<div class="modal-dialog">
		<div class="modal-content">
		<?php echo form_open( site_url("account/invoice/{$invoice['invoice_num']}"), 
		array( 'class'=>'form-horizontal', 'style'=>'margin:0;' ) );?>
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3 class="modal-title">Invoice Note</h3>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<div class="col-sm-11">
						<textarea name="notes" placeholder="Add invoice / delivery note" class="form-control" 
							style="min-height:100px;" required><?php echo $invoice['notes']?></textarea>
					</div>
				</div>
			</div>
			
			<div class="modal-footer">
				<div class="form-group">
					<input type="hidden" name="invoice_num" value="<?php echo $invoice['invoice_num']?>">
					<a href="#" class="btn btn-default btn-sm" data-dismiss="modal" aria-hidden="true">Close</a>
					<button name="update_invoice_note" value="1" type="submit" 
						class="btn btn-sm btn-primary">Save changes</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</div>


<div class="modal fade" id="cancel_order">
	<div class="modal-dialog">
		<div class="modal-content">
	<?php echo form_open( current_url(), array( 'class'=>'form-horizontal', 'style'=>'margin:0;' ) );?>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 class="modal-title">Cancel Order</h3>
		</div>
		
		<div class="modal-body">
		<?php if(isset($return_order)):?>
			<div class="alert alert-warnig">
				You had already paid for this order. Please read our return policy before proceeding.
			</div>
		<?php endif;?>
			<div class="form-group">
				<label class="control-label">Reason for Cancellation</label>
				<div class="col-sm-11">
					<textarea name="notes" placeholder="reason for cancelling your order" class="form-control" 
					style="min-height:100px;" required></textarea>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<input type="hidden" name="invoice_num" value="<?php echo $invoice['invoice_num']?>">
			<a href="#" class="btn btn-default btn-sm" data-dismiss="modal" aria-hidden="true">Close</a>
			<button name="cancel_order" value="1" type="submit" class="btn btn-sm btn-primary">Cancel Order</button>
		</div>
		</form>
		</div>
	</div>
</div>




</div><!-- end of container-->
<?php $this->load->view($theme.'/common/footer.tpl');?>
