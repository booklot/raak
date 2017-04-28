<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
$this->load->view($theme.'/common/header.tpl');?>

<div class="container" id="main_container">
	<div class="row" style="margin-top: 30px">
	<?php $this->load->view($theme.'/about/'.$section.'.tpl');
	if($section=="seller");
		//$this->load->view($theme.'/about/seller_form.tpl');
	else;
		//$this->load->view($theme.'/about/sidebar.tpl'); ?>
	</div>
</div> <!-- end of container (main)-->

<!-- footer should start here -->
<?php $this->load->view($theme.'/common/footer.tpl');?>
