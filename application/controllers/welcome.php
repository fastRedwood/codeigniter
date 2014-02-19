<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Welcome extends MY_Controller 
{
    public function index()
    {

    	$this->assign(array('user' => $this->current_user, 'ccc' => 'Nebraska'));
        $this->display('alice.html');
    }
}