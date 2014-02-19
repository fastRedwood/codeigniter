<?php
	if (!defined('BASEPATH')) exit('No direct script access allowed');

	class MY_lib
	{
		var $_guid;
		var $_group_id;
		var $_event_id;

		var $_msg;
		var $_class;
		var $_method;

		var $current_user;
		var $is_login;

		function __construct()
		{
			$this->ci = & get_instance();
			$this->ci->load->model('core_model','base_dao');

			$this->current_user		= $this->get_session_current_user();
			$this->is_login	    = $this->get_session_login_status();
			// $this->_group_id		= $this->get_session_group_id();
			// $this->_event_id		= $this->get_event_id();

			// $this->_class			= $this->get_class_name();
			// $this->_method			= $this->get_method_name();
		}

		// ***************************************************
		// 提示信息操作
		// ***************************************************

		//将一个提示信息赋值到$_msg中去, 信息类型包括“通知(info), 错误(error), 警告(warning)”
		protected function set_flash_message($type, $message) {
	        $this->ci->session->set_flashdata($type, $message);
	    }


	    // ********************************************************
		// 从Session信息内获取当前用户的GUID, Login Status, Group_id
		// ********************************************************

		// 从Session中获取当前用户user,如果当前用户没有登录，return = null
		function get_session_current_user()
		{
			return ($this->ci->session->userdata('user')) ? $this->ci->session->userdata('user') : NULL;
		}

		//从sesssion中获取当前用户login_status ,如果当前用户没有登录，return = 0
		function get_session_login_status()
		{
			return ($this->ci->session->userdata('is_login')) ? 1 : 0;
		}


		//从sesssion中获取当前用户group_id，如果用户尚未登录，用户的group_id = 0
		function get_session_group_id()
		{
			return ($this->ci->session->userdata('group_id')) ? $group_id = $this->ci->session->userdata('group_id') : 0;
		}

		function get_event_id()
		{
			return ($this->ci->session->userdata('event_id')) ? $event_id = $this->ci->session->userdata('event_id') : 0;
		}

		//get class name
		function get_class_name()
		{
			return $this->ci->router->fetch_class();
		}

		function get_method_name()
		{
			return $this->ci->router->fetch_method();
		}




		
	}
