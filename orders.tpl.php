<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php $this->load->view($theme.'/common/header.tpl');?>
<div class="container">
	<div class="row">
		<?php if( isset($section) ) $this->load->view("$theme/orders/$section.tpl.php");?>
	</div>
</div>
<?php $this->load->view($theme.'/common/footer.tpl');?>
