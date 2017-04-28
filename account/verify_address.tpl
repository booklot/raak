<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<br clear="all"><br clear="all">
<section class="col-sm-9">
	<div class="register block block-info">
	
		<h3 class="title_block">Verify Address Book Entry</h3>
		<br clear="all"><br clear="all">
		<?php 
		if( isset( $map ) ) :
			echo form_open(current_url(), 'class="form-horizontal block_content"');?>
		
				<legend>&nbsp;&nbsp;&nbsp;Drag the marker to the correct position</legend>
				
				<div><?php echo $map['js']; ?></div>
				<div><?php echo $map['html']; ?></div>
				<br clear="all">
				<legend>&nbsp;&nbsp;&nbsp;Is the marker correctly positioned in 
					<strong><?php echo $address['street']?></strong> near <strong><?php echo $address['address']?></strong> ? </legend>
				<div class="control-group">
					<div class="controls">
						<?php echo  anchor( 'account/address_book', 'Cancel', 'class="btn btn-default"' )?>
						<input type="submit" name="change_password" id="submit" value="Yes, its correct" class="btn btn-primary">
						<input type="hidden" name="form_name" value="address_book">
						<input type="hidden" name="form_type" value="verify">
						<input type="hidden" name="id" value="<?php echo $address['id']?>">
						<input type="hidden" id="latitude" name="latitude" value="<?php echo $address['lat']?>">
						<input type="hidden" id="longitude" name="longitude" value="<?php echo $address['lon']?>">
					</div>
				</div>
				<br clear="all">
				<legend>&nbsp;&nbsp;&nbsp;Having trouble locating your address / street?</legend>
				<div class="control-group">
					<div class="controls">
						<?php echo  anchor( 'account/address_book/help_verify/'.$address['id'], 
						'Help me verify', 'class="btn btn-default"' )?>
					</div>
				</div>
				
				<legend>&nbsp;&nbsp;&nbsp;<i class="icon-info-sign"></i> Why Verify ?</legend>
				<div class="control-group">
					<p style="padding:1%;">
						<?php echo lang('why-verify-info'); ?>
					</p>
				</div>
				
			<?php echo form_close();
		endif ;?>
	</div>
</section> <!-- end of span9 -->
