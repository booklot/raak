<?php
  //header('Content-type: text/css');
  ob_start("compress");
  function compress($buffer) {
    /* remove comments */
    $buffer = preg_replace('!/\*[^*]*\*+([^/][^*]*\*+)*/!', '', $buffer);
    /* remove tabs, spaces, newlines, etc. */
    $buffer = str_replace(array("\r\n", "\r", "\n", "\t", '  ', '    ', '    '), '', $buffer);
    return $buffer;
  }
	
  /* your css files 
  include('master.css');
  include('typography.css');
  include('grid.css');
  include('print.css');
  include('handheld.css');*/
  
	if( isset($stylesheet) ):
		foreach( $stylesheet as $css ):
			//echo link_tag(base_url()."site/views/$theme/css/$css.css");
			include( "./site/views/$theme/css/$css.css" );
		endforeach;
	endif;

  

  ob_end_flush();
?>
