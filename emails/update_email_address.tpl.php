<html>
<body>
	<h3>Change of Email Address from <?php echo $current_email;?> to <?php echo $new_email;?></h3>
	<p>Please click this link to <?php echo anchor( base_url('account/update_email/'.$user_id.'/'.$update_email_token), 'confirm changing your email to this address');?>.</p>
	<p><?php echo anchor(base_url(), SITE_NAME)?></p>
</body>
</html>
