<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<br clear="all">
<div class="col-sm-3 side-container">
	<?php $this->load->view("$theme/shop/main-side.tpl")?>
</div>
<div class="col-sm-9 main-container">
	<div style="width:100%;background:none;">
		<?php //echo '<div class="container hidden-xs" style="padding-left:0;padding-right:0;">';
			//$this->load->view("$theme/banners/900x375.tpl");
			//echo '</div>';

		//$this->load->view("$theme/shop/main-recent.tpl");

		//echo br(1);

		if(!empty($categorized)):
			$this->load->helper('banner');
			foreach( $categorized as $k=>$c ):
				$products = $c['products'];
				$data = array();
				$temp = array();
				foreach( $products as $k=>$v )
				{
					if( $k%4 == 0 && $k>0 )
					{
						$data[] = $temp;
						$temp = array();
					}
					$temp[] = $v;
				}
				if(!empty($temp)) $data[] = $temp;
				$c['products'] = $data;
				$c['view'] = 'overview';
				$this->load->view( "$theme/shop/main-featured-categories.tpl", array( 'c'=>$c ) );
			endforeach;
		endif;?> <!-- end of FEATURED ITEMS-->





		<?php $this->data['br'] = 5;
			$this->load->view("$theme/banners/960x160.tpl");?>

		<?php if(!empty($featured_shops)):?>
			<div class="row">
				<div class="col-sm-12">
					<div id="brands">
						<div class="titleHeader clearfix">
							<h3>Top Suppliers</h3>
							<div class="pagers">
								<div class="btn-toolbar">
									<?php echo anchor( 'shops', 'View All', 'class="btn btn-xs btn-default"' );?>
								</div>
							</div>
						</div><!--end titleHeader-->
						<ul class="brandList clearfix">
						<?php foreach( $featured_shops as $k=>$v ):
							if($v['permalink']) $url = $v['segment'];
							else $url = "shops/{$v['company_id']}/{$v['segment']}";
						?>
							<li class="col-sm-3 col-xs-6">
								<?php $img = array( 'src'=>'images/company_profiles/100x75/'.$v['image'], 'alt'=>$v['name'] );
								$a = array( 'title'=>$v['name'], 'data-title'=>$v['name'], 'rel'=>'tooltip' );
								echo anchor( $url, img($img), $a );?>
							</li>
						<?php endforeach;?>
						</ul>
					</div><!--end brands-->
				</div><!--end span12-->
			</div><!-- end of row-->
		<?php endif;?>

		<?php if(0>1):?>
			<script>
				function click_radio(id,l){document.getElementById("company"+id+'_'+l).click();}
				function add_product(id){var sshop = document.getElementById("selected_shop"+id).value;if(sshop>0) document.getElementById("add_to_cart"+id).click();
				else alert('you need to select a shop first');}
				function set_shop(radio,id){var shop = radio.value;var sshop = document.getElementById("selected_shop"+id);sshop.value = shop;}
			</script>
		<?php endif;?>



	</div>
</div>
