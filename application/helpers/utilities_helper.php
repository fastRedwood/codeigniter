<?php

	function rand_str($length=32,$chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890')
	{
		$chars_length = (strlen($chars)-1);//Length of character list
		$string = $chars{rand(0, $chars_length)};//Start our string
			
		//Generate random string
		for($i=1;$i<$length;$i = strlen($string))
		{
			$r = $chars{rand(0,$chars_length)};//Grab a random character from our list
			if ($r != $string{$i - 1}) $string .= $r;//Make sure the same two characters don't appear next to each other
		}
		return $string;//Return the string
	}
	
	
	//对数据进行过滤 status=1 代表不过滤 ，status=2代表保留相关的内容标签 ,status=3代表过滤所有标签
	function ci_post($post_data= NULL, $status=1)
	{
		$ci=& get_instance();
		$str = $ci->input->post($post_data);
		$result="";
		if($status==1)
		{
			$result=$str;
		}
		elseif($status==2)
		{
			$str = strip_tags($str,'<a>,<embed>,<p>,<strong>,<ul>,<li>,<img>,<object>,<hr>,<div>');
			$str = str_replace(chr(10),'</p><p>',$str);
			$str = str_replace('<p></p>','',$str);
			$str = preg_replace('/\s{2,}|　/','',$str);
			$str = ubb2html($str);
			$str = '<p>'.$str.'</p>';
			$result=$str;
		}
		else
		{
			$str	= strip_tags($str);
			$str	= str_replace(" ","",$str);
			$result=$str;
		}
		return $result;
	}
	
	function iif($bool= true, $tstr='', $fstr='')
	{
		if($bool) $str = $tstr;
		else $str = $fstr;
		return $str;
	}

	//convert standard time format eg. 2002-02-03 to ten digits unix time stamp
	function std_unix_time_conversion($std_time)
	{
		$time_array = explode(' ', $std_time);
		$date = explode('-', $time_array[0]);
		
		if(!isset($time_array[1])) $time_array[1] = '0:0:0';
		$time = explode(':', $time_array[1]);
		
		if (!isset($time[0])) $time[0] = 0;
        if (!isset($time[1])) $time[1] = 0;
        if (!isset($time[2])) $time[2] = 0;

		return mktime($time[0], $time[1], $time[2], $date[1], $date[2], $date[0]);	
	}

	//convert unix time format(eg. 2002-02-03 17:30:00)to ten digits unix time stamp
	function std_unix_time_conversion2($std_time)
	{
		$time_array = explode(' ',$std_time);
		$date = explode('-', $time_array[0]);
		$time = explode(':', $time_array[1]);

        if ( !isset($time[2]))
        {
            $time[2] = 0;
        }

		$unix_time = mktime($time[0],$time[1],$time[2],$date[1],$date[2],$date[0]);
		
		return $unix_time;			
	}

	function create_user_folder($username,$folder_length=5,$path="uploads/")
	{
		$str=strtolower($username);
		$arr1 = str_split($str);

		if(count($arr1)>$folder_length)
		    $folder_length=$folder_length;
		else
		    $folder_length=count($arr1);

		for($i=0;$i<$folder_length;$i++)
		{
            $path.=$arr1[$i]."/";
            if(!is_dir($path))create_writeable_folder($path); 
		} 
		if(!is_dir($path.$str))
		create_writeable_folder($path.$str);

		if(!is_dir($path.$str."/file"))
		create_writeable_folder($path.$str."/file");

		if(!is_dir($path.$str."/profile"))
		create_writeable_folder($path.$str."/profile");

		if(!is_dir($path.$str."/images"))
		create_writeable_folder($path.$str."/images");

		if(!is_dir($path.$str."/thumbs"))
		create_writeable_folder($path.$str."/thumbs");

		if(!is_dir($path.$str."/gallery"))
		create_writeable_folder($path.$str."/gallery");

	}

	function create_writeable_folder($p)
	{
		$oldumask=umask(0);
		mkdir($p,0777);
		umask($oldumask);
	}

	function get_user_folder($username,$folder_length=5,$path="uploads/")
	{
		$str=strtolower($username);
		$arr1 = str_split($str); 
		if(count($arr1)>$folder_length)
			$folder_length=$folder_length;
		else
			$folder_length=count($arr1);

		for($i=0;$i<$folder_length;$i++)
		{
			$path.=$arr1[$i]."/";	 
		}
		return  $path.$str."/"; 
	}

    // function send_sms($sms_number, $sms_message)
    // {
    //     $url= 'http://gateway.woxp.cn:6630/utf8/web_api/?x_eid=11251&x_uid=wm_miic&x_pwd_md5=14813dd4e4a0a10cbf42e208b612fc12&x_ac=10&x_target_no='.$sms_number.'&x_memo='.urlencode($sms_message).'&x_gate_id=300';

    //     if (function_exists('file_get_contents'))
    //     {
    //         $file_contents = file_get_contents($url);
    //     }
    //     else
    //     {
    //         $ch = curl_init();
    //         $timeout = 5;
    //         curl_setopt ($ch, CURLOPT_URL, $url);
    //         curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    //         curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    //         $file_contents = curl_exec($ch);
    //         curl_close($ch);
    //     }
    //     return $file_contents;
    // }

    function short_url($url)
    {
        return file_get_contents("http://bvm.bz/api.php?url=".urlencode($url));
    }

?>
