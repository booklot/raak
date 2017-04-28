<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="panel panel-default">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#voucher">
				<i class="icon-caret-right"></i> Use Gift Voucher
			</a>
		</h4>
	</div>

	<div id="voucher" class="panel-collapse collapse">
		<div class="panel-body">
			<form class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-4" for="inputVoucher">
						<strong>Voucher Code</strong>
					</label>
					<div class="col-sm-8">
						<input type="text" id="inputVoucher" placeholder="Enter Voucher Code..."
							class="form-control">
					</div>
				</div><!--end form-group-->
				<div class="form-group">
					<div class="col-sm-8 col-sm-offset-3">
						<button type="submit" class="btn btn-primary btn-sm pull-right">Apply Voucher </button>
					</div>
				</div><!--end form-group-->
			</form>
		</div>
	</div>
</div>
