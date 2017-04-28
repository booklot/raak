<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<br clear="all"><br clear="all">
<div class="col-sm-9">
	<div class="account-list-outer block block-info">
		<h3 class="title_block">Personal Details</h3>
		<div class="block_content" style="margin-top:20px;">
			<table class="table table-striped table-condensed table-hover">
				<?php
				if( strlen( $user['occupation'] )>3 ) $work = $user['occupation'].' at'; 
				elseif( strlen($user['company'])>3 ) $work = 'Works at';
				else $work = FALSE;
				if( strlen($user['company'])>3 && $work ) $at = $work.' '.$user['company'];
				else $at = FALSE;
				if($at):?>
				<tr>
					<th>Occupation:</th>
					<td><?php echo $at; ?></td>
				</tr>
				<?php endif;?>
				<tr>
					<th>Username:</th>
					<td><?php echo $user['username']; ?></td>
				</tr>
				<tr>
					<th>Email:</th>
					<td><?php echo $user['email']; ?></td>
				</tr>
				<tr>
					<th>Phone:</th>
					<td>
						<?php echo $user['phone']?> 
						<?php if($user['alt_phone']):?> / <?php echo $user['alt_phone']; endif;?>
					</td>
				</tr>
				<tr>
					<th>Facebook:</th>
					<td>
						<?php if($user['fb_connected']):?>connected as <strong><?php echo $user['fb_username']?></strong>
						<?php endif;?>
					</td>
				</tr>
				<tr>
					<th>Account Type:</th>
					<td><?php echo $user['group_name']; ?></td>
				</tr>
				<tr>
					<th>Registered:</th>
					<td><?php echo date( 'd M Y, g:i a', $user['date']); ?></td>
				</tr>
				<tr>
					<th>About:</th>
					<td><?php echo nl2br($user['bio']); ?></td>
				</tr>
			</table>
		</div>
	</div>

	<div class="account-list-outer block block-default">
		<h3 class="title_block">My Account</h3>

		<ul class="account-list block_content">
			<li><?php echo 
				anchor( 'account/update_account', '<i class="icon-caret-right"></i> Edit Account Information', 'class="invarseColor"');?>
			</li>
			<li><?php echo 
				anchor( 'account/change_password', '<i class="icon-caret-right"></i> Change Account Password', 'class="invarseColor"' )?>
			</li>
			<li><?php echo 
				anchor( 'account/address_book', '<i class="icon-caret-right"></i> Manage Address Book Entries', 'class="invarseColor"' )?>
			</li>
			
			<li><?php echo anchor( 'account#balance', 
				'<i class="icon-caret-right"></i> Account Balance ( <strong>'.toc(0).'</strong> )', 'class="invarseColor"' )?>
			</li>
		</ul>
	</div>

	<div class="account-list-outer block block-danger">
		<h3 class="title_block">My Orders</h3>

		<ul class="account-list block_content">
			<li>
				<?php echo anchor( 'account/order_history', '<i class="icon-caret-right"></i> Order History', 'class="invarseColor"' )?>
			</li>
			<li><?php echo anchor( 'account/downloads', '<i class="icon-caret-right"></i> Downloads', 'class="invarseColor"' )?></li>
			<!--
			<li><?php echo anchor( 'account#returns', '<i class="icon-caret-right"></i> Returns', 'class="invarseColor"' )?></li>
			<li><?php echo anchor( 'account#rewards', '<i class="icon-caret-right"></i> Reward Points', 'class="invarseColor"' )?></li>
			-->
		</ul>
	</div>
	
	<div class="account-list-outer block block-info">
		<h3 class="title_block">Subscriptions</h3>
		<form method="#" action="#" class="account-list block_content">
		
			<?php foreach($newsletters as $nl):
				if( in_array( $nl['id'], $subscriptions ) && $nl['locked'] )
					$state = 'checked disabled';
				elseif( in_array( $nl['id'], $subscriptions ) ) $state = 'checked';
				elseif( $nl['locked'] ) $state = 'checked disabled';
				else $state = '';
			?>
			<label class="checkbox">
				<input type="checkbox" name="nl<?php echo $nl['id']?>" class="nl<?php echo $nl['id']?>" value="<?php echo $nl['id']?>" 
				onclick="update_sub_status(<?php echo $nl['id']?>)" <?php echo $state?>>
				<?php echo $nl['name']?> <span style="padding-left:10px;font-style:italic;" class="nln<?php echo $nl['id']?>"></span>
			</label>
			<?php endforeach;?>
		</form><!--end form-->
	</div>
</div> <!-- end of span9 -->
