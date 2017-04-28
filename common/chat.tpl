<?php if(!isset($hide_chat)):?>
<script type="text/javascript">
var LHCChatOptions = {};
LHCChatOptions.opt = {widget_height:120,widget_width:300,popup_height:520,popup_width:500};
(function() {
var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
var refferer = (document.referrer) ? encodeURIComponent(document.referrer) : '';
var location  = (document.location) ? encodeURIComponent(document.location) : '';
po.src = '//www.zimall.co.zw/lhc/index.php/chat/getstatus/(click)/internal/(position)/bottom_right/(check_operator_messages)/true/(top)/350/(units)/pixels/(leaveamessage)/true/(department)/1/(disable_pro_active)/true?r='+refferer+'&l='+location;
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
</script>

<script type="text/javascript">
var LHCFAQOptions = {status_text:'FAQ',url:'replace_me_with_dynamic_url',identifier:''};
(function() {
var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
po.src = '//www.zimall.co.zw/lhc/faq/getstatus/(position)/middle_right/(top)/450/(units)/pixels/(theme)/1';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
</script>

<?php endif;?>
