<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<table class="table-cart">
	<tbody>
	<?php $cart_items = $this->cart->contents();
	if( !empty($cart_items) ):
		foreach ( $cart_items as $cart): ?>
	<tr>
		<td class="cart-product-info">
			<?php $img = array( 'src'=>'images/products/100x75/'.$cart['image'], 'style'=>'max-width:72px;' );
			echo anchor( 'shop/products/'.$cart['id'].'/'.url_title($cart['name'], '-',TRUE),
				img($img), 'style="max-width:72px;"' );?>
			
			<div class="cart-product-desc">
				<p><?php echo anchor( 'shop/products/'.$cart['id'].'/'.url_title($cart['name'], '-',TRUE),
					$cart['name'], 'class="invarseColor"' );?>
				</p>
				<ul class="unstyled">
					<?php if($cart['stock']<1)
						echo '<li class="label label-important color-white"> '.lang('out-of-stock').' </li>';
					elseif($cart['stock']>0 && $cart['stock']<6) 
						echo '<li class="label label-warning color-white"> '.lang('limited-availability').' </li>';
					else echo '<li">'.lang('available').': '.lang('yes').'</li>'; ?>
					<li>Shop: <?php $a = array( 'style'=>"display:inline;padding:0;", 'class'=>'invarseColor' );
					echo anchor( 
					'shops/'.$cart['cid'].'/products/'.$cart['id'].'/'.url_title($cart['name'], '-',TRUE),
					 $cart['shop'], $a );?>
					 </li>
				</ul>
			</div>
		</td>
		<td class="cart-product-setting">
			<p><strong><?php echo $cart['qty'].' x '.toc( $cart['price'] ) ;?></strong><br>
				<strong><?php echo toc( $cart['qty']*$cart['price']) ;?></strong>
			</p>
			<?php $a = array( 'class'=>'remove-pro', 'rel'=>'tooltip', 'data-title'=>'Delete', 
			'style'=>"font-size:12px" );
			echo anchor( 'shopping_cart/remove_item/'.$cart['rowid'], 
			' <span class="glyphicon glyphicon-trash"></span> ', $a )?>
		</td>
	</tr>
<?php endforeach;
endif;?>

</tbody>
<tfoot>
	<tr>
		<td class="cart-product-info">
		<?php 
			echo anchor( 'shopping_cart', lang('view-cart'), 'class="btn btn-sm btn-default"' ).nbs(3);
			echo anchor( 'checkout', lang('checkout'), 'class="btn btn-sm btn-primary"' );
		?>
		</td>
		<td>
			<h3><?php echo lang('total').'<br>'.toc($this->cart->total());?></h3>
		</td>
	</tr>
</tfoot>
</table>
