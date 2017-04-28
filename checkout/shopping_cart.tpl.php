<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="col-sm-12">
	<br clear="all">
	<div class="block block-info">
		<h4 class="title_block"><span>My Shopping Cart</span></h4>
		<div class="pull-right clearfix">
			<div class="pagers">
				<div class="btn-toolbar">
					<?php echo anchor( site_url('shop/quotation').'#quotation', 'Quotation', 
						'class="btn btn-default btn-xs" data-toggle="modal"' );
						echo anchor( 'shop/categories', 'Continue Shopping', 'class="btn btn-default btn-xs"' );
					?>
				</div>
			</div>
		</div><!--end clearfix-->

		<br clear="all"><br clear="all">

		<table class="table table-bordered" id="shopping-cart">
			<thead>
				<tr>
					<th colspan="2">&nbsp;&nbsp;Item</th>
					<!-- <th colspan="2">Shop</th> -->
					<th class="">Qty / Action</th>
					<th class="tright">Unit Price&nbsp;</th>
					<th class="tright">Discount&nbsp;</th>
					<th class="tright">Tax&nbsp;</th>
					<th class="tright">Total <small>(inc. tax)</small>&nbsp;</th>
				</tr>
			</thead>
			<tbody id="cart_contents">
				<?php $this->load->view( $theme.'/checkout/cart_contents.tpl.php' );?>
			</tbody>
		</table>
	</div>
	<!-- block info -->
				
</div> <! col-sm-12 -->


<br clear="all">
<div class="" style="background-color:#fff;">
	<div class="col-sm-6" style="padding-top:60px;">
		<div class="panel-group" id="cart-acc">
			<?php 
				//$this->load->view("$theme/checkout/shipping-charges.tpl");
				$this->load->view("$theme/checkout/discount.tpl");
				//$this->load->view("$theme/checkout/voucher.tpl");
			?>
		</div>
	</div>
	<div class="col-sm-1"></div>
	<div class="col-sm-5" style="padding-top:60px;">
		<div class="cart-receipt" id="cart_receipt">
			<?php $this->load->view( $theme.'/checkout/cart_receipt.tpl.php' );?>
		</div>
	</div><!--end span5-->
</div>
<!-- col-sm-12 -->

<div class="modal fade" id="quotation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<?php echo form_open( 'shop/quotation', 'class="form form-horizontal" target="_blank"' );?>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Quotation Details</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="control-label col-sm-3">Company Name</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" name="company">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">Full Name</label>
						<div class="col-sm-8">
							<?php if($this->flexi_auth->is_logged_in()) $name=$this->authorize->get_real_name();
							else $name=$this->input->post('name');?>
							<input class="form-control" type="text" name="name" placeholder="your full name" 
							value="<?php echo $name;?>">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">Phone Number</label>
						<div class="col-sm-8">
							<?php $phone=$this->input->post('phone');?>
							<input class="form-control" type="tel" name="phone" value="<?php echo $phone;?>">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">Email Address <span class="required">*</span></label>
						<div class="col-sm-8">
							<?php if($this->flexi_auth->is_logged_in()) $email=$this->authorize->account_email();
							else $email=$this->input->post('email');?>
							<input class="form-control" type="email" name="email" value="<?php echo $email;?>" required>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">Physical Address</label>
						<div class="col-sm-8">
							<textarea name="address" cols="3" class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">Quotation Notes</label>
						<div class="col-sm-8">
							<textarea name="notes" cols="3" class="form-control"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Print</button>
					<input type="hidden" name="form_name" value="quotation">
					<input type="hidden" name="form_type" value="insert">
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

