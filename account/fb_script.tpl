<?php $permissions = implode(',', $this->config->item('fb_permissions') );?>
<script type="text/javascript">
window.fbAsyncInit = function()
{
	//Initiallize the facebook using the facebook javascript sdk
	FB.init({
		appId:"<?php echo $this->config->item('facebook_appId');?>",
		cookie:true, // enable cookies to allow the server to access the session
		status:true, // check login status
		xfbml:true, // parse XFBML
		oauth : true //enable Oauth
	});
};

//Read the baseurl from the config.php file
(function(d){
	var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
	if (d.getElementById(id)) {return;}
	js = d.createElement('script'); js.id = id; js.async = true;
	js.src = "//connect.facebook.net/en_US/all.js";
	ref.parentNode.insertBefore(js, ref);
}(document));

//Onclick for fb login
	$('#facebook_login').click(function(e)
	{
		FB.login(function(response)
		{
			if(response.authResponse)
			{
				parent.location ='<?php echo base_url("account/fb_login"); ?>'; //redirect uri after closing the facebook popup
			}
		},
		{scope: "<?php echo $permissions;?>"}); //permissions for facebook
	});

</script>
