<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<ul class="dropdown-menu  dropdown-menu-right account-options-menu" role="menu" style="font-size:12px;">

<?php if($this->flexi_auth->is_logged_in()):?>

	<li role="presentation" class="disabled"><a tabindex="-1" href="#">Account Options</a></li>
	<li role="presentation"><?php echo anchor('account/order_history','Orders')?></li>
	<!-- <li role="presentation"><?php echo anchor('account/downloads','My Downloads')?></li> -->
	<li role="presentation"><?php echo anchor('account','Profile')?></li>
	<!-- <li role="presentation"><?php echo anchor('account/update_account', 'Edit Account')?></li> -->
	<!-- <li role="presentation"><?php echo anchor('account/address_book','Address Book')?></li> -->
	<?php if( $this->flexi_auth->is_privileged('admin_panel_login')):?>
		<!-- <li role="presentation"><?php echo anchor( base_url('admin/home'),'Admin Panel')?></li> -->
		<li role="presentation"><?php echo anchor( 'myadmin/orders/pending','Shop Manager')?></li>
	<?php endif; ?>

	<?php if( $this->flexi_auth->is_privileged('run_debug_mode')):?>
		<li role="presentation">
			<a href="?toggle_debug_mode=1"><?php echo $this->pc->debug_status()?></a>
		</li>
	<?php endif; ?>

	<li role="presentation"><?php echo anchor('account/logout', 'Logout')?></li>

	<?php if(count($myprofiles)>0 && 0>1):?>
		<li role="presentation" class="divider"></li>
		<li role="presentation" class="disabled"><a tabindex="-1" href="#">Select Profile</a></li>
		<li role="presentation">
			<div style="max-height:200px;overflow:auto;">
				<ol>
					<?php foreach($myprofiles as $k=>$p):?>
						<li role="presentation">
						<?php echo anchor( base_url().'account/switch_acc/'.$k.'/'.$p['link'], $p['name'] );?></li>
					<?php endforeach;?>
				</ol>
			</div>
		</li>

		<li role="presentation" class="divider"></li>
	<?php endif;?>

<?php else:?>
	<li role="presentation"><?php echo anchor('account/login','Login')?></li>
<?php endif;?>
</ul>
