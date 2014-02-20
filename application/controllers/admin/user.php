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
		$users = $this->user_lib->find_users(10);
		$this->assign('vistor',$this->current_user);
		$this->assign('users',$users);
		$this->display('admin/user/user.html.tpl');
	}

	public function edit()
	{
		$data = $this->input->post(NULL, TRUE); 
    	if($data)
		{
			$user = $this->user_lib->new_user($data);
		}
		// $users = $this->user_lib->find_users(10);
		// // $fields = array('username' => 'test');
		// // $where = 'id = 1';
		// // $this->user_lib->update_user($fields, $where);
		// $this->assign('vistor',$this->current_user);
		// $this->assign('users',$users);
		$this->display('admin/user/edit.html.tpl');
		// $data = $this->input->post(NULL, TRUE);
		// var_dump($data);
	}
}