<?php
	if (!defined('BASEPATH')) exit('No direct script access allowed');

	class MY_lib
	{
		var $_guid;
		var $_group_id;
		var $_login_status;
		var $_event_id;

		var $_msg;
		var $_class;
		var $_method;

		function __construct()
		{
			$this->ci = & get_instance();
			$this->ci->load->model('core_model','base_dao');

			// $this->_guid			= $this->get_session_guid();
			// $this->_group_id		= $this->get_session_group_id();
			// $this->_login_status	= $this->get_session_login_status();
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

		
	}
