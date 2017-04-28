<html>
<body>
	<h3>Reset Password for <?php echo $identity;?> on <?php echo anchor(base_url(), SITE_NAME)?></h3>
	<?php 
		// Note: This template links to the manual password reset page, where the user can enter their new password themselves.
		// If you wish to automatically generate a new password for them, change the link from 'manual_reset_forgotten_password' to 'auto_reset_forgotten_password'
	?>
	<p>Please click this link to <?php echo anchor( base_url('account/manual_reset_forgotten_password/'.$user_id.'/'.$forgotten_password_token), 'Reset Your Password');?>.</p>
</body>
</html>
