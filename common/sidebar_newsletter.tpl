<?php ?>
<div class="well hidden-xs" style="padding-top:10px;background-color:seagreen;color:#ddd;">
	<div style="text-align:center;background:#fff; height:1px;vertical-align:middle;">
		<a style="position:relative;top:-10px;margin:0;padding: 0 3px 0 4px;background-color: seagreen;text-align:center;color:#fff;font-size:18px;">
			<span class="glyphicon glyphicon-envelope"></span>
		</a>
	</div>
			<?php echo form_open( 'account/subscribe', 'style="margin-top:10px;text-align:center;color:#fff;" class="form-horizontal"' );?>
				<h2 style="color:#fff;">STAY UPDATED</h2>
				<p>
					Never miss out on great deals. Subscribe to our newsletter
				</p>
				<div class="form-group" style="margin-bottom:0">
					<label style="color:#fff;" class="control-label">Name</label>
					<div>
						<input type="text" class="form-control input-sm" placeholder="Your Name..." name="name" required>
					</div>
				</div>

				<div class="form-group">
					<label style="color:#fff;" class="control-label">Email</label>
					<div>
						<input type="email" class="form-control input-sm" name="email" placeholder="Your email address	" required>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-primary"  type="submit" name="subscribe">
						<strong><em>subscribe</em></strong></button>
				</div>
				<input type="hidden" name="subscribe_to_newsletter" value="1">
				<input type="hidden" name="nl_id" value="1">
				<input type="hidden" name="return_url" value="<?php echo current_url();?>">
			</form>
		</div>
