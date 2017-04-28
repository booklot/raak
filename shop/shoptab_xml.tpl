<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php echo '<?xml version="1.0" encoding="UTF-8" ?>';?>

	<products type="array">
	<?php
	$this->load->helper('xml');
	foreach( $products as $p ):
		$link = base_url()."shops/{$p['company_id']}/products/{$p['id']}/".url_title($p['name'],'-',TRUE).".html";
		$image = base_url()."images/products/{$p['image']}";
	?>
	<product>
		<title><?php echo xml_convert($p['name']);?></title>
		<price type="float"><?php echo $p['price'];?></price>
		<category><?php echo xml_convert($p['category_name']);?></category>
		<subcategory> </subcategory>
		<condition> </condition>
		<description><?php echo xml_convert($p['summary']);?></description>
		<link><?php echo xml_convert($link);?></link>
		<image><?php echo xml_convert($image);?></image>
	</product>
	<?php endforeach;?>
</products>
