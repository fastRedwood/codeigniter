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

	public function register()
    {
    	// 调试
    	// $this->output->enable_profiler(TRUE);

		$this->form_validation->set_rules('email', '邮箱', 'required|valid_email|callback_is_email_available');
		$this->form_validation->set_rules('password', '密码', 'required|min_length[6]');
		$this->form_validation->set_rules('passconf', '重复输入一次密码', 'required|matches[password]');
		$this->form_validation->set_message('required', '%s 不能为空');
		$this->form_validation->set_message('valid_email', '邮箱格式有误.');
		$this->form_validation->set_message('matches', '两次密码输入不匹配.');

		if ( $this->form_validation->run() )
		{
	    	//提交表单
	    	$data = $this->input->post(NULL, TRUE); 
	    	if($data) $user = $this->user_lib->new_user($data);
			redirect('/', 'refresh');

		}

        $this->display('web/register/index.html.tpl');

    }

	function login()

	{	
		
		// 调试
    	// $this->output->enable_profiler(TRUE);

		$this->form_validation->set_rules('email', '邮箱', 'required|valid_email|callback_check_email_for_login');
		$this->form_validation->set_rules('password', '密码', 'required');

		$this->form_validation->set_message('required', '%s不能为空');
		$this->form_validation->set_message('valid_email', '邮箱格式有误.');


		$vistor = $this->input->post(NULL, TRUE);

		if ( $this->form_validation->run() )
		{
			if($this->user_lib->login($vistor))
			{
				redirect('/', 'refresh');
		
			}
			else
			{
				// $data['msg'] = $this->user_lib->get_a_msg();
			}
		}

		$this->assign(array(
			'error' => isset($data['error']) ? $data['error'] : '', 
			'message' => isset($data['message']) ? $data['message'] : '',
		));
		$this->display('web/login/index.html.tpl');
	}

	function logout()
	{
		$this->user_lib->logout();
		// if($this->_group_id == S_ADMIN_GROUP)
		// {
		// 	redirect('/admin','refresh');
		// }
		// else
		// {
		// 		redirect('/');
		// }

		redirect('/');
	}

	//检查注册邮箱是否已经注册。如果注册过，返回false
	public function is_email_available($email)
	{
		if(!$this->user_lib->is_email_available($email))
		{
			$this->form_validation->set_message('is_email_available', '该邮箱已被注册');
			return false;
		}else{
			return true;
		}
	}

	// function check_allow_user_login($email)
	// {
	// 	$user = $this->user_lib->get_a_record('users', array('*'), array('email'=>$email));
	// 	if ( ! empty($user))
	// 	{
	// 		$group_id = $user['group_id'];
	// 		if ($group_id == 1)
	// 		{
	// 			return TRUE;
	// 		}
	// 		else
	// 		{
	// 			$action = $this->user_lib->get_a_record('acl_actions', array('id'), array('action_name' => 'user|login'));
	// 			if ( ! empty($action))
	// 			{
	// 				$action_id = $action['id'];
	// 				$permission = $this->user_lib->get_a_record('acl_permissions', array('*'), array('gid' => $group_id, 'aid' => $action_id, 'allow' => 'n'));
	// 				if ( ! empty($permission))
	// 				{
	// 					return FALSE;
	// 				}
	// 				else
	// 				{
	// 					return TRUE;
	// 				}
	// 			}
	// 			else
	// 			{
	// 				return TRUE;
	// 			}
	// 		}
	// 	}
	// 	else
	// 	{
	// 		return FALSE;
	// 	}
	// }

	// function check_email_for_retrieve_pwd($email)
	// {
	// 	$result = TRUE;
	// 	if(!$this->user_lib->check_a_record('users',array('email'=>$email)))
	// 	{
	// 		$this->form_validation->set_message('check_email_for_retrieve_pwd', '您输入的%s在系统中不存在。');
	// 		$result = FALSE;
	// 	}
	// 	return $result;
	// }

	// function forgot_password()
	// {
	// 	if($this->_login_status) redirect('dashboard/agenda','refresh');

	// 	$this->load->library('email');
	// 	$this->load->library('event_lib');
	// 	$event_key = $this->input->get('event_key');
	// 	$val = $this->form_validation;
	// 	$val->set_rules('email', '邮箱', 'required|valid_email|callback_check_email_for_retrieve_pwd');

	// 	$this->form_validation->set_message('required', '%s为必填项，不能为空。');
	// 	$this->form_validation->set_message('valid_email', '您输入的是无效的%s地址。');

	// 	if ($val->run())
	// 	{
	// 		$email = CI_POST('email');
	// 		$user = $this->user_lib->get_values(TABLE_USERS, array('guid', 'password'), array('email' => $email));
	// 		$userdata = $this->user_lib->get_values(TABLE_USERDATA, array('name', 'mobile'), array('guid' => $user['guid'], 'event_key' => NULL));
	// 		$login_url = $this->config->item('base_url').'?event_key='.$event_key.'&email='.$email;

	// 		if ($userdata['mobile'])
	// 		{
	// 			$sms_message = sprintf($this->lang->line('retrieve_pwd_sms'), $user['password'], short_url($login_url));
	// 			send_sms($userdata['mobile'], $sms_message);
	// 			$mobile_msg = '和手机中';
	// 		}
	// 		else
	// 		{
	// 			$mobile_msg = '';
	// 		}

	// 		$subject = $this->lang->line('retrieve_pwd_subject');
	// 		$content = sprintf($this->lang->line('retrieve_pwd_content'), $userdata['name'], $email, $user['password'], $login_url);
	// 		$m_email = $this->email;
	// 		$m_email->mailtype = 'html';
	// 		$m_email->from('no-reply@businessvalue.com.cn');
	// 		$m_email->to($email);
	// 		$m_email->subject($subject);
	// 		$m_email->message($content);
	// 		$m_email->send();

	// 		$msg = '找回密码操作成功。我们已将您的登陆密码发送到您的注册邮箱'.$mobile_msg.'，请注意查收。';
	// 	}
	// 	else
	// 	{
	// 		$msg = NULL;
	// 	}

	// 	$data['msg'] = $msg;
	// 	$data['event_key'] = $event_key;

	// 	$time = time();
	// 	$condition	= "(entities.visibility = 1) AND ";
	// 	$condition .= "($time > events.register_open_time AND $time < events.close_time) AND ";
	// 	$condition .= "(events.is_access_selective = 1) AND ";
	// 	$data['events'] = $this->event_lib->get_all_events($condition);

	// 	$nav = array('login_status' => $this->_login_status, 'class' => $this->_class, 'method' => $this->_method);
	// 	$this->tpl->title('找回密码');
	// 	$this->tpl->set_layout('login','public');
	// 	$this->tpl->set_partial('header','public/partial/header', $nav);
	// 	$this->tpl->build('public/user/forgot_password', $data);
	// }
}
