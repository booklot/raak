<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$cart_items = $this->cart->contents();	
$this->load->helper('array');
if( !empty($cart_items) ):
	echo form_open( 'shopping_cart/update_cart', array( 'class'=>'form-inline', 'id'=>'shopping_cart_form' ) );
		foreach ( $cart_items as $cart): ?>
			<tr class="">
				<td class=""><?php  
					echo anchor( 'shopping_cart/remove_item/'.$cart['rowid'], '<i class="fa fa-trash" style="color:brown;"></i>', 
						['class'=>"btn btn-xs btn-link", 'data-title'=>"Remove", 'data-placement'=>"top", 'rel'=>"tooltip", 
						'style'=>"font-size:16px" ] );?>
				</td>
				<td class="desc">
					<?php $ttp = [ 'class'=>'invarseColor', 'title'=>$cart['name'], 'data-title'=>$cart['name'], 
						'data-placement'=>'top', 'rel'=>'tooltip' ];?>
					<h5>
						<?php echo anchor( "{$cart['id']}/".url_title($cart['name'],'-',TRUE),
							character_limiter($cart['name'],50), $ttp);?>
					</h5>
				</td>
					
				<td class="quantity">
					<div class="btn-group">
						<button type="button" class="btn btn-default btn-xs" style="min-width:26px" 
							onclick="decrement_qty(<?php echo $cart['id'].','.$cart['min_order'];?>)">
							&nbsp;<i class="glyphicon glyphicon-chevron-left"></i>&nbsp;
						</button>
						<button type="button" class="btn btn-default btn-xs" 
							reset="<?php echo $cart['qty']?>" id="sudo_qty<?php echo $cart['id'];?>" 
							style="min-width:26px;"><?php echo $cart['qty']?>
						</button>
						<button type="button" class="btn btn-default btn-xs" style="min-width:26px" 
							onclick="increment_qty(<?php echo $cart['id'].','.$cart['stock'];?>)">
							&nbsp;<i class="glyphicon glyphicon-chevron-right"></i>&nbsp;
						</button>
					</div>
						
					<input min="<?php echo $cart['min_order'];?>" max="<?php echo $cart['stock'];?>"  
						type="hidden" class="qty_hidden" reset="<?php echo $cart['qty']?>" 
						name="qty[<?php echo $cart['rowid'];?>]" value="<?php echo $cart['qty']?>" 
						id="qty<?php echo $cart['id'];?>">
				</td>
					
				<td class="tright sub-price">
					<h4>&nbsp;
						<?php echo toc( $cart['price']-tax( $cart['tax_rate'], $cart['price'],TRUE) )?>
					</h4>
				</td>
				<td class="tright sub-price">
					<h4>&nbsp;
						<?php $discount = discount_amt( $cart['price'], $cart['dsr_value'], $cart['dsr_percentage'], 
							$cart['tax_rate'] );
						echo toc( $discount );
						$dp = discount_price( $cart['price'], $cart['dsr_value'], TRUE, $cart['dsr_percentage'], 
							$cart['tax_rate'] );
						?>
					</h4>
				</td>
				<td class="tright sub-price">
					<h4>&nbsp;&nbsp;
						<?php echo toc( tax( $cart['tax_rate'], $dp,TRUE) );?>
					</h4>
				</td>
				<td class="tright sub-price">
					<h4>&nbsp;&nbsp;
						<?php //echo toc( tax_price( $cart['tax_rate'], $discounted_unit_price )*$cart['qty'] );
							echo toc( $dp*$cart['qty'] );
						?>
					</h4>
				</td>
			</tr>
			<!-- <tr>
							<td colspan="7" style="padding: 0 0 8px 0;border-top:none;">
							<?php if( is_string($cart['options']) ) $ops = unserialize($cart['options']); else $ops = $cart['options'];?>
								<small><?php echo array_implode( ' : ', ', ', $ops );?></small>
							</td>
						</tr> -->
			<?php endforeach;?>
			
			<?php if( isset($checkout['step']) && $checkout['step']>=50 ):
				if( isset($payment['name']) ) $cp = $payment['name'];
				else $cp = 'select payment method';?>
				<tr>
					<td colspan="3"></td>
					<td colspan="5">
						<div class="form_group">
							<br clear="all">
							<div class="col-xs-12 col-sm-12">
								<label class="control-label">Payment Method</label>
								<div class="input-group">
									<span class="form-control" placeholder="Select payment method" readonly><?php echo $cp;?></span>
									<span class="input-group-btn">
										<button class="btn btn-default" data-target="#payment_method" data-toggle="modal" type="button">
											<?php echo isset($payment['name'])?'Change':'Select';?>
										</button>
									</span>
								</div><!-- /input-group -->
							</div>
							<br clear="all"><br clear="all">
						</div>
					</td>
				</tr>
			<?php endif;?>
				<tr>
					<td colspan="8" style="">
						<br/>
					</td>
				</tr>
				<tr>
					<td colspan=2" class="tleft" style="border:none;">
						<!-- <button type="button" class="btn btn-default btn-sm" onclick="reset_sudo()">Reset</button> -->
						<?php echo anchor( 'shopping_cart/destroy', 'Empty Cart', 'class="btn btn-default btn-sm"' );?>
					</td>
					<td colspan="6" class="tright" style="border:none;">
						<button type="submit" class="btn btn-info btn-sm" name="update_cart">Update Cart</button>
					</td>
				</tr>
			</form>
			<?php endif;?>
