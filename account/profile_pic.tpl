<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<br clear="all"><br clear="all">
<section class="col-sm-9">
	<div class="register block block-info">

		<h3 class="title_block">Change Profile Picture</h3>
		<br clear="all"><br clear="all">

		<?php echo form_open(current_url(), 'class="form-horizontal"');?>
			<legend>&nbsp;&nbsp;&nbsp;<i class="icon-user"></i> Select new photo</legend>
			<div class="form-group">
				<label for="upload" class="control-label col-sm-3">Select Photo:</label>
				<div class="col-sm-6">
					<span id="upload" class="form-control" >no file chosen<span>
				</div>
				<p id="status" ></p>
			</div>
			
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-3">
					<ul class="thumbnails inline">
						<li>
							<a id="profile_picture" class="thumbnail">
								<span>
									<img src="<?php echo base_url().'images/users/250px/'.$user['photo']?>">
								</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
				
			<div class="control-group">
				<div class="controls">
					<?php echo  anchor( 'account', 'Cancel', 'class="btn btn-default"' )?>
					<input type="submit" name="change_password" id="submit" value="Submit" class="btn btn-primary">
					<input type="hidden" name="form_name" value="profile_pic">
					<input type="hidden" name="form_type" value="update">
					<input type="hidden" name="id" value="<?php echo $user['id']?>">
					<input type="hidden" name="update_photo" id="photo" value="<?php echo $user['photo']?>">
					<input type="hidden" name="user" value="<?php echo  base_url().'create_thumb.php?id='.$user['id'] ?>" id="action_string">
					<input type="hidden" name="script" value="create_thumb.php" id="action_file">
				</div>
			</div>
		<?php echo form_close();?>
	</div>
</section> <!-- end of span9 -->
