<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>


<?php if(isset($trail)):;?>
<div class="col-lg-12">
	<ul class="breadcrumb">
		<span>You are here:&nbsp;&nbsp;</span>
		<?php //echo '<li>'.anchor( base_url(), 'Home' ).' </li>';
			echo '<li>'.anchor('shop', 'Shop').' </li><li>'.anchor('shop/categories', 
					'Categories').' </li>';
			foreach($trail as $k=>$v):
				if($v['l']>1) 
					echo '<li>'.anchor( 'shop/categories/'.$v['id'].'/'.$v['segment'], $v['name'] ).' </li>';
			endforeach;
			if( isset($page['id']) && isset($page['segment']) && isset($page['name']) )
				echo '<li class="active">'.anchor('shop/categories/'.$page['id'].'/'.$page['segment'], $page['name']).' </li>';?>
		
	</ul> <!-- end of breadcrumb -->
</div>
<?php endif;?>

<div class="col-sm-3">

	<div class="panel panel-default">
		<div class="panel-heading">
			<h2 class="panel-title">Advanced Search</h2>
		</div>
		<div class="panel-body">
			<?php $form = array( 'method'=>'get', 'class'=>"form-horizontal block_content" );
			echo form_open( 'shop/search', $form );?>
				<div class="form-group">
					<div class="col-sm-12">
						<input name="q" type="text" placeholder="Type Product Name..." 
							value="<?php echo $q;?>" class="form-control input-lg">
					</div>
				</div>
			
				<div class="form-group">
					<div class="col-sm-12">
						<select name="category" class="form-control input-lg">
							<option value="1">--Select Category--</option>
							<?php foreach($categories as $c):?>
								<option value="<?php echo $c['id'];?>" <?php if($c['id']==$cat) echo 'selected'?>>
									<?php echo $c['name']?>
								</option>
							<?php endforeach;?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-primary btn-lg pull-right">
						<span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;&nbsp;Search</button>
					</div>
				</div>
			</form>
			<!--end form-->
		</div>
		<!-- panel-body -->
	</div>
	<!-- panel-default -->
			
	<?php $this->load->view("$theme/banners/220x300.tpl");?>
		
</div><!--end span3-->

<div class="col-sm-9">
	<?php if(empty($products)):?>
		<div class="alert alert-search" style="padding:0">
			<h3 style="margin-top:0">Search Results</h3>
			<p class="first-child">Your search for <strong><i><?php echo $q;?></i></strong> 
			<?php if(isset($category['name'])) echo 'in <strong>',
				anchor( "shop/categories/{$category['id']}/{$category['segment']}", $category['name'] ),'</strong> ',
				'did not match any books. ';?>
			<?php if( isset($category['id']) && $category['id']>1 ) 
				echo 'Do you want to ',anchor( current_url()."?q={$q}&category=1", 'search the entire site?' );?></p>
		</div><!--end alert-->
	<?php else:?>
		<div class="alert alert-search" style="padding:0">
			<h3 style="margin-top:0">Search Results</h3>
			<p class="first-child">You searched for <strong><i><?php echo $q;?></i></strong></p>
			<p class="second-child">
				<?php if(isset($category['id']) && $category['id']>1): 
						echo 'Showing items in <strong><i>',
						anchor( "shop/categories/{$category['id']}/{$category['segment']}", $category['name'] ),'</i></strong> category. ';
						echo anchor( current_url()."?q={$q}&category=1", 'Search entire site?' );
					endif;
				?>
			</p>
		</div><!--end alert-->
	<?php endif;?>
		
		<div class="block block-info">
			<?php 
			if($total_rows==1) $it = "item"; else $it = "items";
			$page['name'] = "<b>$total_rows</b> $it found";
			$this->load->view("$theme/shop/productFilter.tpl", array( 'page'=>$page ) );
		?>
			<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid block_content">
				<?php $this->load->view("$theme/shop/grid2.tpl");?>
				
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
			</div>
			<!--end pagination-->
				
			</div>
		</div> 
		<!-- end of block-info-->
	</div> 
	<!-- end of col-sm-9-->
