<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class User extends MY_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->library('User_lib');
		$this->load->library('form_validation');
		$this->load->helper('form');
		// 设置 报错误的样式
		// $this->form_validation->set_error_delimiters('<p class="error">ddddd', '</p>');
	}

	public function index()
	{
		$user['name']='kengdiea';
        $this->assign('user',$user);
        $this->display('admin/user/layout.html.tpl');
	}

	public function show()
	{
		$users = $this->user_lib->
		# code...
	}
}