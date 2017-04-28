<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	foreach( $contacts as $p ):
		echo "{$p['name']},{$p['surname']},{$p['email']}\n";
	endforeach;
?>
