<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<br clear="all"><br clear="all">
<section class="container">
	<div class="block block-info">
		<h3 class="title_block">Download History</h3>
		
		<div class="block_content">
			<br clear="all">
			<div class="titleHeader clearfix">
				<div class="pagers">
					<div class="btn-toolbar">
						<?php echo anchor( 'account', 'Back to My Account', 'class="btn btn-xs btn-default"' );?>
					</div>
				</div>
			</div><!--end titleHeader-->

			<br clear="all">

			<h3><?php echo '<em><small>Page '.ceil($current_rows/10).' of '.ceil($total_rows/10).'</small></em>';?></h3>

			<table class="table order_history" style="border: 1px solid #ccc;padding:2px;">
				<thead>
					<tr>
						<th>#</th>
						<th style="text-align:left;">Details</th>
						<th style="text-align:left;">File</th>
						<th style="">Download</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach( $downloads as $k=>$v ):?>
						<tr style="border-bottom:none;">
							<td style="padding-left:5px;padding-right:5px;padding-bottom:3px"><?php echo $start+$k;?></td>
							<td style="text-align:left;">
								<?php if($v['track']):?>
								Title: <?php echo $v['title']?><br>
								Artist: <?php echo $v['artist']?><br>
								Album: <?php echo $v['album']?>
								<?php else:?>
								Album Title: <?php echo $v['title']?><br>
								Artist: <?php echo $v['artist']?>
								<?php endif;?>
							</td>
							<td style="text-align:left;">
								<?php if($v['track']):?>
								Playtime: <?php echo $v['playtime_string']?><br>
								File Size: <?php echo $v['filesize']?><br>
								File Type: MP3 Audio
								<?php else:?>
								File Type: ZIP Archive
								<?php endif;?>
							</td>
							<td style="">
								<?php if($v['link']):
									$att = array( 'target'=>'_blank', 'class'=>'btn btn-sm btn-info' );
									echo anchor( $v['link'], '<span class="glyphicon glyphicon-download"></span> Download', $att );
								else: echo '<i>link expired</i>';
								endif;?>
							</td>
						</tr>
					<?php endforeach;?>
				</tbody>
			</table>
		
	
			<br clear="all"><br clear="all"><br clear="all">
				<div class="col-xs-12">
					<ul class="pagination pull-left">
						<li class="disabled"><a style="border:none;">
						Showing <?php echo $start?> to <?php echo $current_rows?> of <?php echo $total_rows?> downloads
						</a></li>
					</ul>
					<ul class="pagination pull-right">
						<?php echo $this->pagination->create_links(); ?>
					</ul>
				</div><!--end pagination-->
	
			<br clear="all"><br clear="all">
			<div class="titleHeader clearfix">
				<div class="pagers">
					<div class="btn-toolbar">
						<?php echo anchor( 'account', 'Back to My Account', 'class="btn btn-default btn-xs"' );?>
					</div>
				</div>
			</div><!--end titleHeader-->
			<br clear="all">
		</div>
		
	</div>
</section> <!-- end of span9 -->
