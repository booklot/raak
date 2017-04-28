<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
	
	<br clear="all"><br clear="all">
	
	<div class="col-sm-6" style="padding-left:0">
		<?php $img = array( 'class'=>'img-rounded img-responsive img-thumbnail', 'src'=>"images/shop_banners/{$first['size']}/{$first['image']}" );
		echo anchor( $first['href'], img($img));?>
	</div>
	<div class="col-sm-6" style="padding-right:0">
		<?php $img = array( 'class'=>'img-rounded img-responsive img-thumbnail', 'src'=>"images/shop_banners/{$sec['size']}/{$sec['image']}" );
		echo anchor( $sec['href'], img($img));?>
	</div>
	<br clear="all"><br clear="all">
	
