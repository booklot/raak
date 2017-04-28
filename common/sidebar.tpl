<nav id="right-bar">

<?php if( isset($rel) ): ?>
	<ul>
	<h2>Related</h2>
	<?php foreach($rel as $key=>$value):
	$attr = array('class'=>'block_links');
	$data = '<li><h4>'.$rel[$key]['name'].'</h4><p>'.$rel[$key]['description'].'</p></li>';
	echo anchor( 'about/'.$rel[$key]['id'].'/'.$rel[$key]['segment'], $data, $attr);
	endforeach ?>
	</ul>

<?php endif ?>

</nav>
