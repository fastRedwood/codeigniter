<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Test extends MY_Controller 
{
    public function index()
    {
        $tes='adminadmin';
        $this->assign('tes',$tes);
        $this->display('tes.html');
    }

    public function aaaa()
    {
        $test='admin';
        $this->assign('test',$test);
        $this->display('test.html');
    }

    public function bbbb()
    {
        $test='tingshuokeyiyouneirong';
        $side='aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
        $this->assign('side',$side);
        $this->assign('test',$test);
        $this->display('side.html');
    }
}