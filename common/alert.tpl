<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
if($error) $f = 'alert alert-warning';
else $f = 'alert alert-info';
?>
<div class="<?php echo $f;?>">
	<a href="#" class="close" data-dismiss="alert">&times;</a>
	<?php echo $error_msg;?>
</div>
