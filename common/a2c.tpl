<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<form name="a2c" class="hidden" id="a2c_form">
<?php 
$f=array('name'=>$this->security->get_csrf_token_name(),'value'=>$this->security->get_csrf_hash(),'id'=>'csrf','type'=>'hidden');
echo form_input($f);

?>
</div>
