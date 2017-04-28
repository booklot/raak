<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php if($this->flexi_auth->is_logged_in()):?>
<div class="col-sm-3">
	<div class="block block-danger">
		<h3 class="title_block"><?php echo $this->authorize->get_real_name();?></h3>
		<br clear="all"><br clear="all">
		<div class="block_content">
			<ul class="unstyled my-account">
				<?php if(0>1):?>
				<li>
					<ul class="unstyled">
						<li>
							<div class="thumbnail">
								<?php $nm = $this->authorize->get_real_name();
								echo '<a class="profile_pic" style="padding:0;" title="'.$nm.'"
								href="'.base_url().'images/users/'.$user['photo'].'">'.
								img( 'images/users/250px/'.$user['photo'] ).'</a>' ;?>
							</div>
						</li>
						<li style="border:none;"><?php echo 
							anchor( 'account/edit_profile_pic', '<i class="icon-caret-right"></i> Change Profile Picture', 
								'class="invarseColor"' )?>
						</li>
					</ul>
				</li>
				<br clear="all">
				<?php endif;?>
				<li><?php echo anchor( 'account', 'Account Options' )?>
					<ul class="unstyled">
						<li>
							<?php echo anchor( 'account/update_account', '<i class="icon-caret-right"></i> Edit Account', 
								'class="invarseColor"' )?>
						</li>
						<li>
							<?php echo anchor( 'account/change_password', '<i class="icon-caret-right"></i> Change Account Password', 
								'class="invarseColor"' )?>
						</li>
						<li>
							<?php echo anchor( 'account/address_book', '<i class="icon-caret-right"></i> Address Book', 
								'class="invarseColor"' )?>
						</li>
						<li style="border:none;">
							<?php echo anchor( 'account/logout', '<i class="icon-caret-right"></i> Logout', 'class="invarseColor"' )?>
						</li>
					</ul>
				</li>

				<br clear="all">

				<li>
					<!-- <a>My Orders</a> -->
					<ul class="unstyled">
						<li>
							<?php echo anchor( 'account/order_history', '<i class="icon-caret-right"></i> My Orders', 
								'class="invarseColor"' )?>
						</li>
						<!-- <li style="border:none;">
													<?php echo anchor( 'account/downloads', '<i class="icon-caret-right"></i> Downloads', 'class="invarseColor"' )?>
												</li> -->
					</ul>
				</li>

				<br clear="all">

				<li style="border-bottom:none;">
					<a>Accounts I Manage</a>
					<ol class="" style="max-height: 300px;overflow:auto;">
						<?php foreach($myprofiles as $k=>$p):?>
							<li role="presentation">
								<?php echo anchor( base_url().'account/switch_acc/'.$k.'/'.$p['link'], $p['name'], 
									'class="invarseColor"' );?>
							</li>
						<?php endforeach;?>
					</ol>
				</li>
			</ul>
		</div> <!-- end of span3 -->
	</div>
</div>

<?php endif;?>
