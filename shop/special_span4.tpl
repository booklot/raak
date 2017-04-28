<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="col-sm-4">
		<div id="homeSpecial">
			<div class="titleHeader clearfix">
				<h3>Special</h3>
				<div class="pagers">
					<div class="btn-toolbar">
						<div class="btn-group">
							<button class="btn btn-default btn-xs vNext"><i class="icon-caret-down"></i></button>
							<button class="btn btn-default btn-xs vPrev"><i class="icon-caret-up"></i></button>
							<?php echo anchor( 'shop/special', 'View All', 'class="btn btn-default btn-xs"' );?>
						</div>
					</div>
				</div>
			</div><!--end titleHeader-->

			<ul class="vProductItems cycle-slideshow vertical clearfix" data-cycle-fx="carousel" data-cycle-timeout=0 data-cycle-slides="> li" 
				data-cycle-next=".vPrev" data-cycle-prev=".vNext" data-cycle-carousel-visible="2" data-cycle-carousel-vertical="true">
			<?php foreach($special as $i=>$f):
			$link = "shops/{$f['company_id']}/{$f['company_segment']}/products/{$f['id']}/{$f['segment']}";?>	
				<li class="col-sm-12 clearfix">
					<div class="thumbImage col-sm-4">
						<?php $img = array( 'src'=>'images/products/100x75/'.$f['image'] );
							echo anchor( $link, img($img) );?>
					</div>
					<div class="thumbSetting col-sm-8">
						<div class="thumbTitle" style="margin-bottom:0;">
							<?php echo anchor( $link, $f['name'],
								'class="invarseColor"')?><br>
							<small style="line-height:15px;position:relative;clear:left;top:-5px;">
								<?php echo character_limiter($f['company_name'], 50);?>
							</small>
						</div>
						<div class="thumbPrice" style="margin-bottom:0px;position:relative;top:-3px;">
							<span>
								<span style="text-decoration:line-through;color:#999;"><?php echo toc( $f['old_price'] )?></span>
								<?php echo toc( $f['price'] )?>
							</span>
						</div>
						<div class="thumbButtons">
							<?php echo anchor( $link,
								'<i class="icon-shopping-cart"></i>&nbsp;Buy&nbsp;Now', 'class="btn btn-primary btn-xs"');?>
						</div>
					</div>
				</li>
			<?php endforeach;?>
			</ul>
		</div><!--end special-->
	</div><!--end span4-->
