<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="order-stages">
	<br clear="all"><br clear="all">
	<ol class="breadcrumb">
		<li>
			<h4 class="panel-title">
				<span class="fa fa-check-circle green"></span>
				<span class="accordion-toggle light">Customer Information</span>
			</h4>
		</li>
	</ol>
	<ol class="breadcrumb">
		<li>
			<h4 class="panel-title">
				<span class="fa fa-check-circle green"></span>
				<span class="accordion-toggle light">Delivery Method</span>
			</h4>
		</li>
	</ol>
	<ol class="breadcrumb">
		<li>
			<h4 class="panel-title">
				<span class="fa fa-dot-circle-o gold"></span>
				<span class="accordion-toggle">Payment</span>
			</h4>
		</li>
	</ol>

	<br clear="all">
	<div class="col-sm-4 col-sm-offset-4">
		<h3 class="text-center">
			Total Amount: <strong><?php echo toc($invoice['total']);?></strong>
		</h3>
		<?php $hide='';?>
		<div class="row">
				<div class="col-xs-6">
					<span class="order-amounts order-amounts-due pull-right">
							<span class="pull-left">Amount Due</span><br>
							<span class="pull-right danger amount-due">
								<?php echo toc($invoice['total']-$invoice['amount_paid']);?>
							</span>
							&nbsp;
					</span>
				</div>
				<div class="col-xs-6">
						<span class="order-amounts pull-left">
							<span class="pull-left">Amount Paid</span><br>
							<span class="pull-right amount-paid success">
								<?php echo toc($invoice['amount_paid']);?>
							</span>&nbsp;
							<input type="hidden" name="amount_paid" class="amount_paid" value="<?=$invoice['amount_paid'];?>">
						</span>
				</div>
		</div>
		
		<br clear="all">
		
		<?php echo form_open( "orders/make_payment/{$invoice['invoice_num']}", ['class="form form-horizontal"'] );
			echo form_hidden( 'pm_id', $invoice['pm_id'] );
		?>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
					<table class="radio-payments" border="0">
					<?php foreach( $payments as $p ):?>
						<tr class="">
							<td>
								<input type="radio" name="payment_method" value="<?=$p['id'];?>" 
									<?php if($p['id']==$invoice['pm_id']) echo 'checked'?>>
							</td>
							<td>
								<span class="<?php echo url_title($p['name'], '-', TRUE);?>"></span>
							</td>
							<td class="">
								<span><?php echo $p['name'];?></span>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<br clear="all">
							</td>
						</tr>
					<?php endforeach;?>
					</table>
				</div>
			</div>
			<br clear="all"><br clear="all">
			<div class="form-group">
				<p class="text-center">
					<button type="submit" class="btn btn-block btn-danger center-block" style="max-width:280px">
						Make Payment
					</button>
				</p>
			</div>
		</form>
		<p class="text-center">
			<?php echo anchor( "orders/{$invoice['invoice_num']}", 'View Order', 
				['class'=>"btn btn-block btn-default center-block", 'style'=>'max-width: 280px;'] );?>
		</p>
	</div>



</div>
