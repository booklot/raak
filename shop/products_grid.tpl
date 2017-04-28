<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php 
	$prd = array();
	foreach( $products as $f )
	{
		$s = $f['shops'];
		$ns = count($s);
		if( $ns>=1 && isset( $s[0]['id'] ) )
			$prd[] = $f;
	}
?>


		<div class="row">
			<ul class="hProductItems clearfix">
			<?php foreach( $prd as $i=>$f ):
				$s = $f['shops'];
				$ns = count($s);
				$n = count($prd);
			if( $ns==1 && isset( $s[0]['id'] ) ):
				$shop = $s[0];
				if($shop['permalink']) $link = $shop['segment']."/products/{$f['id']}/{$f['segment']}";
				else $link = "shops/{$shop['id']}/{$shop['segment']}/products/{$f['id']}/{$f['segment']}";?>
				<?php //if( $i%3==0 ) echo '<div class="row" style="margin-left:0">';?>
				<li class="col-sm-4 clearfix">
					
					<div class="thumbnail" style="position:relative;">
						<?php $img = array( 'src'=>'images/products/210x120/'.$f['image'] );
							echo anchor( $link, img($img) );?>
						<?php if($shop['shipping'] && $shop['shipping_cost']>0):?>
							<span class="free-shipping-red"></span>
						<?php endif;?>
					</div>
					
					<div class="thumbSetting">
						
						<div class="thumbTitle">
							<?php echo anchor( $link, character_limiter($f['name'], 30),
								'class="invarseColor" style="margin-bottom:0;display:block;"');?>
							<small style="line-height:15px;position:relative;top:-5px;">
								<?php echo character_limiter($shop['name'], 50);?>
							</small>
						</div>
						
						<div class="thumbPrice" style="margin-top: -5px;">
							<span>
								<?php if( $shop['old_price'] > $f['price'] ):;?>
									<span class="strike-through"><?php echo toc( $shop['old_price'] )?></span>
								<?php endif;
								if($shop['download'] && $f['price']==0) echo 'FREE';
								else echo toc( $f['price'] );?>
							</span>
						</div>

						<div class="thumbButtons">
							<?php if($shop['download']) $btn='<span class="glyphicon glyphicon-download-alt"></span>&nbsp;Download';
								else $btn='<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Buy&nbsp;Now';
								echo  anchor($link, $btn, 'class="btn btn-primary btn-xs"' );?>
						</div>
						
						<div class="rating_cont">
							<div class="rating small" data-role="rating" data-param-rating="<?php echo $f['rating'];?>" 
								data-param-vote="off"></div>
						</div>
						
					</div><!-- end of thumbSetting-->
				
				</li>
				<?php if( ( ($i+1)>0 && ($i+1)%3==0) || ( $n==($i+1) && ($i+1)%3!=0 ) ) echo '<br clear="all"><!--end of row'.(int)(($i/3)+1).'-->';?>
			<?php else:
				$link = "shop/products/{$f['id']}/{$f['segment']}";?>

				<li class="col-sm-4 clearfix">
				
					<div class="thumbnail">
						<?php $img = array( 'src'=>'images/products/210x120/'.$f['image'] ); echo anchor( $link, img($img) );?>
					</div>
					<div class="thumbSetting">
						
						<div class="thumbTitle">
							<?php echo anchor( $link, character_limiter($f['name'], 30),
								'class="invarseColor" style="margin-bottom:0;display:block;"');?>
							<small style="line-height:15px;position:relative;top:-5px;"><?php echo $ns;?> different shops</small>
						</div>
						
						<div class="thumbPrice" style="margin-top:-5px;">
							<span>from <?php echo toc( $f['price'] )?></span>
						</div>

						<div class="thumbButtons">
							<?php echo anchor( $link, '<span class="glyphicon glyphicon-star"></span>&nbsp;View Offers', 
							'class="btn btn-primary btn-xs"' );?>
						</div>
						
						<div class="rating_cont">
							<div class="rating small" data-role="rating" data-param-rating="<?php echo $f['rating'];?>" 
								data-param-vote="off"></div>
						</div>
						
					</div><!-- end of thumbSetting-->
				
				</li>
			<?php if( ( ($i+1)>0 && ($i+1)%3==0) || ( $n==($i+1) && ($i+1)%3!=0 ) ) echo '<br clear="all"><!--end of row'.(int)(($i/3)+1).'-->';?>
			<?php endif; endforeach;?>
			</ul>
		</div>
		
		
		<br clear="all"><br clear="all"><br clear="all">
		
		<div class="col-xs-12">
			<ul class="pagination pull-left">
				<li class="disabled"><a style="border:none;">
				Showing <?php echo $start?> to <?php echo $current_rows?> of <?php echo $total_rows?> products
				</a></li>
			</ul>
			<ul class="pagination pull-right">
				<?php echo $this->pagination->create_links(); ?>
			</ul>
		</div><!--end pagination-->
