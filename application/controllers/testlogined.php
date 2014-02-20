<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Testlogined extends MY_Controller 
{
    public function index()
    {
    	$this->access_control();
    	
        $tes='我要登录才能看那！！！';
        $this->assign('tes',$tes);
        $this->display('tes.html');
    }

}