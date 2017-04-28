<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if( !empty($b_900x375) ):?>
	<?php if(isset($this->data['br'])) echo br($this->data['br'],1);?>
	<div class="col-sm-12" style="padding-left:0;padding-right:0; margin-bottom:20px;">
		<div class="flexslider">
			<ul class="slides"><?php
			foreach($b_900x375 as $i=>$f):
				$att = array( 'target'=>$f['target'] );
				$img = array( 'src'=>'images/shop_banners/'.$f['size'].'/'.$f['image'], 
					'style'=>'max-width:1000px', 'alt'=>$f['description'], 'class'=>'img-responsive' );?>	
				<li style="max-height:367px;"><?php echo anchor( $f['href'], img($img), $att );?></li>
			<?php endforeach;?>
			</ul>
		</div><!--end flexslider-->
	</div><!--end span12-->
	
<?php 

	$main = array();
	if( !empty($b_490x100) )
	{
		foreach($b_490x100 as $k=>$b)
		{
			if(isset($b['category']))
			{
				$nc = count( $b['category'] );
				if( $nc==1 && $b['category'][0]==1 )
					$main[] = $b;
			}
		}
		if( count($main) < 2 )
		{
			foreach($b_490x100 as $k=>$b)
			{
				if(isset($b['category']))
				{
					if( in_array( 1, $b['category'] ) )
						$main[] = $b;
				}
			}
		}
		if( count($main) < 2 )
		{
			foreach($b_490x100 as $k=>$b)
				$main[] = $b;
		}
	}
	$nm = count($main);
	if( $nm == 1 )
	{
		$first = $sec = $main[0];
	}
	elseif($nm==2)
	{
		$first = $main[0];
		$sec = $main[1];
	}
	elseif($nm>2)
	{
		shuffle($main);
		$first = $main[0];
		$sec = $main[1];
	}
	else
	{
		$first = $sec = FALSE;
	}

?>

	<?php if($first):?>
		<br clear="all"><br clear="all">
		<div class="col-sm-6" style="padding-left:0;padding-right:7px;">
			<?php $img = array( 'class'=>'img-rounded img-responsive', 'src'=>"images/shop_banners/{$first['size']}/{$first['image']}" );
			echo anchor( $first['href'], img($img), 'class="thumbnail"');?>
		</div>
		<div class="col-sm-6" style="padding-right:0;padding-left:7px;">
			<?php $img = array( 'class'=>'img-rounded img-responsive', 'src'=>"images/shop_banners/{$sec['size']}/{$sec['image']}" );
			echo anchor( $sec['href'], img($img), 'class="thumbnail"');?>
		</div>
	<?php endif;?>
<?php endif;?>
