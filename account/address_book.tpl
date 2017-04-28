<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<br clear="all"><br clear="all">
<section class="col-sm-9">
	<div class="block block-info">
		
		<h3 class="title_block">Address Book</h3>
		<br clear="all"><br clear="all">
		<?php if( !isset($locations['error']) ):?>
			<div class="block_content" style="padding:15px;">
			
				<?php echo anchor( 'account/add_address', 'Add Address', 'class="btn btn-sm btn-danger pull-right"' );?>
				<br clear="all">
				<ol>
					<?php foreach( $locations as $l ):?>
						<br clear="all">
						<li>
							<div class="well">
								<?php if( strlen($l['company'])>2 ):?>
									<span><?php echo $l['company']?></span><br>
								<?php endif;?>
								<span><?php echo $l['address'].' '.$l['street']?></span><br>
								<?php if( strlen($l['township'])>2 ):?>
									<span><?php echo $l['township']?></span><br>
								<?php endif;?>
								<span><?php echo $l['city_name'].', '.$l['country_name']?></span><br>
								<small><?php
									echo anchor( 'account/address_book/edit/'.$l['id'], '<i class="icon-edit"></i> edit', 'class="btn btn-xs btn-default"' )."&nbsp;&nbsp;&nbsp;";
									if( $l['verified']==0 )
										echo anchor( 'account/address_book/verify/'.$l['id'], 
											'<i class="icon-warning-sign"></i> verify', 'class="btn btn-xs btn-default"' )."&nbsp;&nbsp;&nbsp;";
									else echo anchor( 'account/address_book/verify/'.$l['id'], 
											'<i class="icon-ok"></i> verified', 'class="btn btn-xs btn-default"' )."&nbsp;&nbsp;&nbsp;";
									echo anchor( 'account/address_book/delete/'.$l['id'], '<i class="icon-trash"></i> delete', 'class="btn btn-xs btn-default"' );
								?></small>
							</div>
						</li>				
					<?php endforeach;?>
				</ol>
			</div>
			<!-- block-content -->
			<?php endif;?>
		<br clear="all">
		<div class="titleHeader clearfix">
			<div class="pagers">
				<div class="btn-toolbar">
					<?php echo anchor( 'account', 'Back to My Account', 'class="btn btn-xs btn-default"' );?>
				</div>
			</div>
		</div><!--end titleHeader-->
		<br clear="all">
	</div>
</section> <!-- end of span9 -->
