<?php

$ob = new Upload_profile_pic();

$ob->invoke();



class Upload_profile_pic {

     public function __construct()  
     {
     }

	public function invoke(){
		$this->createThumb();
	}




public function createThumb()
{

$data['error'] = TRUE;
$temp = $_FILES['uploadfile']['tmp_name'];
$file = basename($_FILES['uploadfile']['name']); 
$stamp = time();
$main = './images/files/'.$file;
	if( !file_exists($main) )
	{
		$up = move_uploaded_file ( $temp , $main );
		if( $up )
		{
				$data['error_msg'] = 'success';
				$data['form'] = 'file';
				$data['photo'] = $stamp.$file;
				if( isset($_GET['auto']) )
					$data['auto'] = TRUE;
				else $data['auto'] = FALSE;
				echo json_encode($data);
		}
		else
		{
			$data['error_msg'] =  " error saving file";
			echo json_encode($data);
		}
	}
	else{
		$data['error_msg'] = " File already exists";
		echo json_encode($data);
	}
}

}

?>
