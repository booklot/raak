<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<!-- Modal -->
<div class="modal fade" id="shipping_options" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					Shipping to <?php echo $ip_location['ctn'].', '.$ip_location['cntn'];?>
				</h4>
			</div>
			<div class="modal-body">
				<p>
					You can select any of these shipping methods during checkout
				</p>
				<table class="table table-bordered table-condensed">
					<?php foreach( $shipping as $s ):?>
						<tr>
							<td style="text-align:left;border:1px solid #ccc;">
								<?php echo $s['name']?><br>
								<small><?php echo $s['time'];?></small>
							</td>
							<th style="text-align:left;border:1px solid #ccc;">
								<?php echo toc($s['cost'])?>
							</th>
						</tr>
					<?php endforeach?>
				</table>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade" id="shipping_location" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<?php echo form_open( 'account/sdl', 'class="form form-horizontal"' );?>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						Change Shipping Location
					</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="country" class="control-label col-sm-4">Country <span class="required">*</span></label>
						<div class="col-sm-6">
							<select name="country" id="country" class="form-control input-sm" required>
								
								<?php foreach($countries as $c):?>
								<option value="<?php echo $c['id']?>" label="<?php echo $c['name']?>"
								 <?php if($ip_location['cnt']==$c['id']) echo 'selected'?>><?php echo $c['name']?></option>
								<?php endforeach;?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="city" class="control-label col-sm-4">City <span class="required">*</span></label>
						<div class="col-sm-6">
							
							<input type="text" name="city" list="city_list" class="form-control input-sm" 
								value="<?php if($ip_location['ctn']!='UNKOWN') echo $ip_location['ctn']?>" required>
							
							<datalist id="city_list"><select name="city_id" id="city">
								<?php foreach( $cities as $c ):?>
								<option label="<?php echo $c['name']?>" value="<?php echo $c['name']?>">
								<?php endforeach;?>
							</select></datalist>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-primary">Submit</button>
					<input type="hidden" name="return" value="<?php echo uri_string();?>">
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
