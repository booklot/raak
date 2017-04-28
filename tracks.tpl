<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php $list = array();
			$clip_dir = $this->config->item('clip_dir');
			$dh = $this->config->item('download_helper');
			foreach($tracks as $f):
				if(file_exists( $clip_dir.$f['file'] ))
					$list[] = site_url($dh.'/get_clip/'.$f['file']);
			endforeach;
			$play = implode( '|', $list );?>

<div class="pull-right">

<?php if(0>1):?>

<script type="text/javascript" src="<?php echo base_url();?>scripts/sm/soundmanager2-nodebug-jsmin.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>scripts/sm/mp3-player-button.js"></script>
<?php else:?>

<script type="text/javascript" src="<?php echo base_url();?>scripts/sm/berniecode-animator.js"></script>

<!-- the core stuff -->
<script type="text/javascript" src="<?php echo base_url();?>scripts/sm/soundmanager2-nodebug-jsmin.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>scripts/sm/360player.js"></script>


<?php endif;?>

<script>

soundManager.setup({
  // required: path to directory containing SM2 SWF files
  url: "<?php echo base_url('scripts/sm/swf')?>/"
});
</script>


<?php if(0>1):?>
<script type="text/javascript" src="<?php echo base_url('scripts/dewplayer/swfobject.js');?>"></script>

						<div id="dewplayer_content">
							<object data="<?php echo base_url('scripts/dewplayer/dewplayer.swf');?>" width="200" height="20" 
								name="dewplayer" id="dewplayer" type="application/x-shockwave-flash" style="margin-top:7px;">
								<param name="movie" value="<?php echo base_url('scripts/dewplayer/dewplayer.swf');?>" />
								<param name="flashvars" value="mp3=<?php echo $play;?>&javascript=on" />
								<param name="wmode" value="transparent" />
							</object>
						</div>
<?php endif;?>
</div><br clear="all">
<table class="table table-striped table-condensed table-responsive">

	<thead>
		<tr>
			<th style="text-align:left">Track</th>
			<th style="text-align:left">Title</th>
			<th>
				<?php echo form_open( 'shopping_cart/add_to_cart', array( 'class'=>'form-inline' ) );?>
					<div class="btn-group btn-group-xs">
						<button type="button" class="btn btn-danger">
							<?php if($page['price']==0) echo 'free'; else echo toc($page['price'])?>
						</button>
						<button class="btn btn-danger" type="submit" value="add-to-cart" name="add-to-cart">
							<span class="glyphicon glyphicon-download-alt"></span> Download Album
						</button>
					</div>
					<input type="hidden" name="shop" value="<?php echo $page['company_id'];?>">
					<input type="hidden" name="product_id" value="<?php echo $page['id'];?>">
					<input type="hidden" name="qty" value="1">
				</form>
			</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach($tracks as $track):
		echo form_open( 'shopping_cart/add_to_cart', array( 'class'=>'form-inline' ) );?>
		<tr>
			<td style="text-align:left;padding:0 0 0 5px;"><?php echo $track['track_number']?></td>
			<td style="text-align:left;padding:0;">
				<?php if(file_exists( $clip_dir.$track['file'] ) && is_file( $clip_dir.$track['file'] ) ):?>
				<div class="ui360" style="margin-top:-0.55em">
					<?php echo anchor( base_url($dh.'/get_clip/'.$track['file']), $track['title']).'&nbsp;&nbsp;';?>
				</div>
				<?php else: echo '<p style="margin:0;padding:10px 0;">'.$track['title'].'&nbsp;&nbsp;<small><i>sample not available</i></small></p>';
				endif;?>
			</td>
			<td style="padding:0;">
				<div class="btn-group btn-group-xs">
					<button type="button" class="btn btn-default">
						<?php if($track['price']==0) echo 'free'; else echo toc($track['price'])?>
					</button>
					<button class="btn btn-default" type="submit" value="add-to-cart" name="add-to-cart">
						<span class="glyphicon glyphicon-download-alt"></span> Download
					</button>
				</div>
				<input type="hidden" name="shop" value="<?php echo $page['company_id'];?>">
				<input type="hidden" name="product_id" value="<?php echo $page['id'];?>">
				<input type="hidden" name="qty" value="1">
				<input type="hidden" name="track" value="<?php echo $track['id'];?>">
			</td>
		</tr></form>
		<?php endforeach;?>
	</tbody>
</table>


<div class="hidden">



<?php if(0>1):?>
<script type="text/javascript">
var flashvars = {
  mp3: "<?php echo $play;?>",
  javascript: "on"
};
var params = {
  wmode: "transparent"
};
var attributes = {
  id: "dewplayer",
  style: ""
};
swfobject.embedSWF("<?php echo base_url('scripts/dewplayer/dewplayer-rect.swf');?>", "dewplayer_content", "242", "20", "9.0.0", false, flashvars, params, attributes);
</script>
<?php endif;?>
</div>
