<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-9">

	<article class="block block-info">
		<h2 class="title_block"><?=$this->config->item('site_name');?> Website Terms And Conditions</h2>
		<div class="block_content">
			<div class="col-lg-12">
				<br clear="all">
				<?php $this->load->view("$theme/about/terms_and_conditions.tpl");?>
			</div> <!-- end of blog-content-entry -->
		</div>
	</article>
	
</section> <!-- end of span9 -->
