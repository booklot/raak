<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<?php 
	$sharelist = array(
		'title' => 'Product Compare List on Zimall',
		'summary' => 'Check out this product comparison list I created on Zimall.',
		'image' => 'images/compare.jpg',
	);
	if( $shared_list ) $sharelist['url'] = site_url( "compare/{$list_id}/$shared_list" );
	else $sharelist['url'] = site_url( "compare/{$list_id}/".$this->flexi_auth->get_user_id() );

?>
<!-- social sharing buttons -->
<br clear="all">
<div class="container">
	<div class="form-group">
		<div class="col-sm-12">
			<div class="btn-group">
				<a class="btn btn-default" href="<?php echo $sharelist['url']?>" target="_blank"
					title="right click and choose copy link">
					<i class="radmin-share-2"></i>&nbsp;&nbsp;Share this list: 
				</a>
				
				<?php 
					$url = rawurlencode( $sharelist['url'] );
					$text = rawurlencode($sharelist['title']);
					$desc = rawurlencode($sharelist['summary']);
					$media = rawurlencode( base_url($sharelist['image']) );
					$btn = array( 'class'=>'btn btn-default share_buttons', 'target'=>'_blank' );
					
					$lk2 = '<i class="radmin-link"></i>';
					$lk = array( 'class'=>'btn btn-default', 'target'=>'_blank', 'title'=>'right click and choose copy link' );
					$btn['style'] = "color:#3f5c9a";
					//$btn['onclick'] = "share_link(this, '$fb1' )";
					echo anchor( $sharelist['url'], $lk2, $lk );
					
					$fb = $this->config->item('facebook_share');
					$fb1 = $fb.'?u='.$url.'&t='.$text;
					$fb1 = $fb.'?s=100&p[url]='.rawurlencode( $sharelist['url'] ).
					'&p[images][0]='.rawurlencode(base_url($sharelist['image'])).
					'&p[title]='.rawurlencode($sharelist['title']).
					'&p[summary]='.rawurlencode($sharelist['summary']);
					$fb2 = '<i class="radmin-facebook"></i>';
					$btn['style'] = "color:#3f5c9a";
					//$btn['onclick'] = "share_link(this, '$fb1' )";
					$btn['data-link'] = $fb1;
					echo anchor( $fb1, $fb2, $btn );
					
					$tw = $this->config->item('twitter_share');
					$twn = $this->config->item('twitter');
					$tw1 = $tw."?url=$url&text=$desc&via=$twn";
					$tw2 = '<i class="radmin-twitter"></i>';
					$btn['style'] = "color:#55acee";
					//$btn['onclick'] = "share_link(this, '$tw1' )";
					$btn['data-link'] = $tw1;
					echo anchor( $tw1, $tw2, $btn );
					
					$gp = $this->config->item('google_share');
					$gp1 = "$gp?url=$url";
					$gp2 = '<i class="radmin-google"></i>';
					$btn['style'] = "color:#dd4b39";
					//$btn['onclick'] = "share_link(this, '$gp1' )";
					$btn['data-link'] = $gp1;
					echo anchor($gp1,$gp2,$btn);
					
					$li = $this->config->item('linkedin_share');
					$li1 = "$li?url=$url&title=$text&summary=$desc";
					$li2 = '<i class="radmin-linkedin"></i>';
					$btn['style'] = "color:#2387bd";
					//$btn['onclick'] = "share_link(this, '$li1' )";
					$btn['data-link'] = $li1;
					echo anchor($li1,$li2,$btn);
					
					$pi = $this->config->item('pinterest_share');
					$pi1 = "$pi?url=$url&description=$desc&media=$media";
					$pi2 = '<i class="radmin-pinterest"></i>';
					$btn['style'] = "color:#cb2027";
					//$btn['onclick'] = "share_link(this, '$pi1' )";
					$btn['data-link'] = $pi1;
					echo anchor($pi1,$pi2,$btn);
				?>
			</div>
		</div>
	</div>
</div>
<br clear="all">
