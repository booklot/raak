<html>
<body>
	<h3>Thank you for Registering on <?php echo anchor(base_url(), SITE_NAME)?>!</h3>
	
	<p>
		You can <?php echo anchor( 'account/login', 'login' )?> to your account using either your email address or your username.
		<br clear="all"><br clear="all">
		email:&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $email;?><br clear="all">
		username:&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $username;?><br clear="all">
	</p>
	
	<p>
		Regards<br clear="all">
		Zimall Customer Services<br clear="all">
		support@zimall.co.zw
	</p>
</body>
</html>
