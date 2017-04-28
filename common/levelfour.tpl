<section id="inner-bounds">
<div id="heading">
<h1><?php echo $page['name'] ?></h1>
<?php echo $page['description'] ?>
</div>

<?php if(isset($page['banner'])): ?>
	<div id="banner">
		<img src="<?php echo $page['banner'] ?>" >
	</div>
<? endif ?>

<div id="content">
	<?php echo html_entity_decode($page['content']) ?>
</div>
<div id="categories">
	<ul>
	<?php foreach($sub as $key=>$value):
	$attr = array('class'=>'block_links');
	$data = '<li><h4>'.$sub[$key]['name'].'</h4><p>'.$sub[$key]['description'].'</p></li>';
	echo anchor('about/'.$sub[$key]['id'].'/'.$sub[$key]['segment'], $data, $attr);
	endforeach ?>
	</ul>
</div>





</section> <!-- end of inner bounds-->
