<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Welcome extends MY_Controller 
{
    public function index()
    {
        $this->assign('test',null);
        $this->display('alice.html');
    }
}