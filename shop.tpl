<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$this->load->view("$theme/common/header.tpl");?>
<br clear="all">
<div class="mainContainer">
	<div class="row">
		<?php $this->load->view("$theme/shop/$section.tpl");?>
	</div>
</div>

<?php $this->load->view("$theme/common/footer.tpl");?>
