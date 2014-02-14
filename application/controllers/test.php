<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Test extends MY_Controller 
{
    public function index()
    {
        $test='ci 2.1.4 + smarty 3.1.15 配置成功';
        $this->assign('test',$test);
        $this->display('test.html');
    }
}