<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
* Name: Raakbook Bootstrap 3 Theme config
*
* 
*/
$theme_config['name'] = 'raak';
$theme_config['description'] = 'Raakbook Bootstrap 3 Theme';
$theme_config['menu'] = FALSE;//megamenu';
$theme_config['tree'] = TRUE;
$theme_config['login_link'] = '#quicklogin';
$theme_config['login_option'] = ' data-toggle="modal"';
$theme_config['logo_options'] = [ 'height'=>'50px', 'width'=>'auto' ];
$theme_config['logo'] = '1493373621cps-logo.png';
$bs = [ 'rel'=>"stylesheet", 'href'=>"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css",
				'integrity'=>"sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7", 'crossorigin'=>"anonymous" ];

$fa = array( 'href'=>'https://use.fontawesome.com/533fb2a3ba.js', 'type'=>'text/javascript' );
$facss = array( 'rel'=>"stylesheet", 'href'=>"https://use.fontawesome.com/157843e22c.css" );

$bsjs = array( 'src'=>"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js", 
				'integrity'=>"sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS", 'crossorigin'=>"anonymous" );

$jq = array( 'src'=>"https://code.jquery.com/jquery-1.9.1.min.js", 
			'integrity'=>"sha256-wS9gmOZBqsqWxgIVgA8Y9WcQOa7PgSIX+rPA0VL2rbQ=", 'crossorigin'=>"anonymous");
$rc = array( 'src'=>'https://www.google.com/recaptcha/api.js' );

//$theme_config['hext_css'] = array($facss);	// header external css
//$theme_config['hext_js'] = array($fa);	// header external js
$theme_config['fext_js'] = array($jq,$bsjs);

$theme_config['styles'] = array( 'bootstrap', 'font-awesome.min', 'icon-style', 'jquery.fancybox', 'custom', 'cps', 
	'pdf'=>array('href'=>'pdf.css', 'rel'=>'stylesheet', 'type'=>'text/css', 'media'=>'print' ) );
									//, 'bootstrap.min', 'simplePagination' 'icon-style' 'auctions' 'jquery-ui-1.10.1.min',
$theme_config['scripts'] = array( 'fancybox/jquery.fancybox.min', 'jquery.number', 'validator', 'custom' );
									// 'auctions', 'jquery.simplePagination','jquery-ui-1.10.1.min',, 'jquery.tweet'

$theme_config['topmenu'] = [8];

$theme_config['pagination'] = array(
		'cur_tag_open' => '<li class="active"><a>',
		'cur_tag_close' => '</a></li>',
		'prev_tag_open' => '<li>',
		'prev_tag_close' => '</li>',
		'next_tag_open' => '<li>',
		'next_tag_close' => '</li>',
		'num_tag_open' => '<li>',
		'num_tag_close' => '</li>',
		'next_link' => 'more &raquo;',
		'prev_link' => '&laquo; prev',
		'first_link' => 'First',
		'first_tag_open' => '<li>',
		'first_tag_close' => '</li>',
		'last_link' => 'Last',
		'last_tag_open' => '<li>',
		'last_tag_close' => '</li>',
	);

$theme_config['error_class'] = 'alert alert-warning alert-dismissable';
$theme_config['success_class'] = 'alert alert-success alert-dismissable';
$theme_config['info_class'] = 'alert alert-info alert-dismissable';


$theme_config['per_page'] = array( 10=>10, 20=>20, 30=>30, 50=>50, 75=>75, 100=>100 );
$theme_config['default_per_page'] = '30';

$theme_config['sort_by'] = array( 'product_ratings.rating desc'=>'Highest Rating', 
		'product_ratings.rating asc'=>'Lowest Rating', 'products.name asc'=>'Name (A-Z)', 'products.name desc'=>'Name (Z-A)', 
		'company_products.price asc'=>'Price (Low-High)', 'company_products.price desc'=>'Price (High-Low)' );
		//'products.id desc'=>'Recently Added', 
$theme_config['sort-by'] = array(
	1=>array( 'n'=>'Relavance', 'f'=>'relavance', 's'=>TRUE ),
	2=>array( 'n'=>'Price Low to High', 'f'=>'company_products.price', 's'=>'asc' ),
	3=>array( 'n'=>'Price High to Low', 'f'=>'company_products.price', 's'=>'desc' ),
	4=>array( 'n'=>'Name (a-Z)', 'f'=>'products.name', 's'=>'asc' ),
	5=>array( 'n'=>'Name (Z-a)', 'f'=>'products.name', 's'=>'desc' ),
	6=>array( 'n'=>'Recently Added', 'f'=>'products.id', 's'=>'desc' )
);
$theme_config['default_sort_by'] = 6;

$theme_config['error_class'] = 'alert alert-danger alert-dismissable';
$theme_config['success_class'] = 'alert alert-success alert-dismissable';
$theme_config['info_class'] = 'alert alert-info alert-dismissable';


$theme_config['product_images_folder'] = $folder = './images/products/';
$theme_config['product_images']['100'] = '100x75';
$theme_config['product_images']['210'] = '210x120';
$theme_config['product_images']['280'] = '280x160';
$theme_config['product_images']['150'] = '150x210';
$theme_config['main_product_image'] = array( 'w'=>350, 'h'=>475 );
/* End of file modern_theme.php */
/* Location: ./site/config/modern_theme.php */
