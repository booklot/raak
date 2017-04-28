<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
			<table class="table table-receipt table-condensed">
				<tr>
					<td class="alignRight">Sub Total</td>
					<td class="alignLeft"><?php echo toc( $this->cart->subtotal() )?></td>
				</tr>
				<tr>
					<td class="alignRight">Discount</td>
					<?php $cart_coupon = $this->session->userdata('cart_coupon');
						if( isset( $cart_coupon['save'] ) ) $save = $cart_coupon['save'];
						else $save = $this->cart->discount_total();	?>
					<td class="alignLeft">
						<?php if($save>0) echo '('; echo toc($save); if($save>0) echo ')';?>
					</td>
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
				
				<?php endif;?>
				
				<?php if(isset($fees['cost'])):?>
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
					<td class="alignRight"><h3>Total</h3></td>
					<?php $total = cart_total();?>
					<td class="alignLeft"><h3><?php echo toc($total);?></h3></td>
				</tr>
				<tr>
					<td class="alignRight"><?php //echo  anchor( 'shop', 'Continue Shopping','class="btn btn-default"' );?></td>
					<?php if( isset( $checkout['option'] ) ):
					if( $checkout['option'] == 'confirm_order' ):?>
					<td class="alignLeft">
						<?php echo anchor( 'checkout/place_order', 'Confirm Order', ['class'=>"btn btn-primary"] );?>
					</td>
					<!-- &nbsp;&nbsp;Submit&nbsp;&nbsp; -->
					<?php else:?>
					<td class="alignLeft"><?php echo anchor( 'checkout', lang('checkout'), 'class="btn btn-primary"' );?></td>
					<?php endif; else:?>
					<td class="alignLeft"><?php echo anchor( 'checkout', lang('checkout'), 'class="btn btn-primary"' );?></td>
					<?php endif;?>
				</tr>
			</table>
