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

		function create_a_record($table, $data)
		{
			return $this->ci->base_dao->insert_a_row($table, $data);
		}

		
	}
