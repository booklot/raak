<html>
<body>
	<h4>Activate account for <?php echo $identity;?> on <?php echo anchor(base_url(), SITE_NAME)?></h4>
	<p>Please click this link to <?php echo anchor('account/activate_account/'. $user_id .'/'. $activation_token, 'Activate Your Account');?>.
	<br><br>
	<?php echo site_url('account/activate_account/'. $user_id .'/'. $activation_token);?>
	</p>
</body>
</html>
