<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<section class="col-sm-9">

	<article class="block block-info">
		<h2 class="title_block">Frequently Asked Questions</h2>
		<div class="block_content">
			<div class="col-lg-12">
				<br clear="all">
				<!-- Place this tag where you want the Live Helper FAQ module to render. -->
				<div id="lhc_faq_embed_container" ></div>

				<!-- Place this tag after the Live Helper FAQ module tag. -->
				<script type="text/javascript">
					var LHCFAQOptions = {url:'replace_me_with_dynamic_url'};
					(function() {
						var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
						po.src = '//www.zimall.co.zw/lhc/index.php/faq/embed';
						var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
					})();
				</script>
			</div>
			<!-- end of blog-content-entry -->
		</div>
	</article>
</section> <!-- end of span9 -->

<?php

