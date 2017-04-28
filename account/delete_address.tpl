<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<br clear="all"><br clear="all">
<section class="col-sm-9">
	<div class="register block block-info">
		<h3 class="title_block">Delete Address Book Entry</h3>
		<br clear="all"><br clear="all">
		<?php
			$attr = array('name' => 'delete_article', 'class' => 'form-horizontal block_content');
			echo form_open(current_url(), $attr); ?>
			
			<legend>&nbsp;&nbsp;&nbsp;<i class="icon-trash"></i> Confirm Delete:&nbsp;&nbsp;<span style="color:red">This action cannot be undone!</span></legend>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-1">
				<h5>Are sure you want to delete the address 
					<span style="color:blue"><?php echo $address['address'].' '.$address['street'].', '.$address['township'].', '.$address['city_name']  ?></span> ?
				</h5>
				<br clear="all">
				
					<?php echo anchor( 'account/address_book', 'cancel, wise!', 'class="btn btn-primary"') ?>
					<input type="submit" name="submit" value="yes, i'm sure" class="btn btn-default">
					<input type="hidden" name="form_name" value="address_book">
					<input type="hidden" name="DELETE" value="DELETE">
					<input type="hidden" name="del" value="DELETE">
					<input type="hidden" name="form_type" value="delete">
					<input type="hidden" name="id" value="<?php echo $address['id'] ?>">
				</div>
			</div>
		</form>
	</div>
</section> <!-- end of span9 -->
