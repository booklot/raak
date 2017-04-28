<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php $this->load->view($theme.'/common/header.tpl');?>
<div class="container">
	<div class="row">
		<?php if( isset($section) ) $this->load->view("$theme/account/$section.tpl");
		if( $section == 'orders' || $section == 'downloads' );
		else $this->load->view($theme.'/account/sidebar.tpl');?>
	</div>
</div>
<?php $this->load->view($theme.'/common/footer.tpl');?>
