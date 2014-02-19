<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class User_lib extends MY_lib
{
    function __construct()
    {
        $this->ci = & get_instance();
    }

    public function new_user($registration)
    {

        $user = array();
        $user['email'] = $registration['email'];
        // $user['roles'] =  array('ROLE_USER');
        $user['createdIp'] = $this->ci->input->ip_address();;
        $user['createdTime'] = time();
        $user['salt'] = base_convert(sha1(uniqid(mt_rand(), true)), 16, 36);
        $user['password'] = $this->encode_password($registration['password'], $user['salt']);

        // $core_data 	= array('title' => $name, 'main' => NULL);
        $user = $this->add_user_dao($user);
        // $this->insert_a_userdata_record($guid, $source, $time, $data);
        // $this->insert_a_userdata_record($guid, $this->ci->config->item('authorization'), $time, $data);
        return $user;
    }


    public function login($vistor)
    {
        // $result = FALSE;

        if ($this->is_email_available($vistor['email'])) 
        {
            // throw new Exception('Email不存在');
            return false;
        }

        $user = $this->find_user_by_email($vistor['email']);
        $vistor['password'] = $this->encode_password($vistor['password'], $user['salt']);
        if($user['password'] != $vistor['password'])
        {
            // $this->set_flash_message('error', "您输入的密码有误。");
            // redirect("user/login");
            var_dump("您输入的密码有误");

            // Get Flash data on view 
            // $this->session->flashdata('error');

            // $this->increase_login_attempt();
        }else{

            $data = array('user' => $user, 'is_login' => 1);
            $this->ci->session->set_userdata($data);//写入sesssion中
            return true;
            // if($remember) $this->create_autologin($data['guid'], $user['unique_key']);//如果用户选择了“记住我”,记录自动登录功能

            // $this->clear_login_attempts();//清除失败记录
            // $this->update_last_activity($user['guid']);//更新最后登录时间
        }

        return $result;
    }

    private function encode_password($raw, $salt)
    {
        return md5(sha1($raw).$salt);
    }

    private function is_email_available($email) {
        if (empty($email)) {
            return false;
        }
          $user = $this->find_user_by_email($email);
          return empty($user) ? true : false;
    }

    public function logout()
    {
        return $this->ci->session->sess_destroy();
    }

    // function logout2222222()
    // {
    //     if ($this->ci->input->cookie($this->ci->config->item('autologin_cookie'))) $this->delete_autologin();
    //     return $this->ci->session->sess_destroy();
    // }




    // User DAO 
    public function add_user_dao($user)
    {
        return $this->ci->base_dao->insert(TABLE_USER, $user);
    }

    public function find_user_by_email($email)
    {
        return $this->ci->base_dao->fetch_row(TABLE_USER, '*', array('email' => $email));
    }

    public function find_users()
    {
        return $this->ci->base_dao->fetch_row(TABLE_USER, '*', array());
    }





    

    function update_a_user($guid, $name, $source, $data)
    {
        $this->ci->db->trans_start();
        $this->update_a_record(TABLE_CORE_ENTITIES, array('title'=>$name), array('guid'=>$guid));
        if(!$this->check_a_record(TABLE_USERDATA, array('guid'=>$guid, 'source'=>$source))) $this->insert_a_userdata_record($guid, $source, $time, $data);
        else $this->update_a_userdata_record($guid, $source, $time, $data);
        $this->ci->db->trans_complete();
        return $this->db->trans_status();
    }

    function insert_a_userdata_record($guid, $source, $time, $data)
    {
        $data['guid'] 			= $guid;
        $data['source']			= $source;
        $data['time_created'] 	= $time;
        $data['time_updated']	= $time;
        return $this->create_a_record(TABLE_USERDATA, $data);
    }

    function update_a_userdata_record($guid, $data, $event_key = NULL)
    {
        $data['time_updated'] = time();

        if ($event_key)
        {
            $condition = array('guid' => $guid, 'event_key' => $event_key);
            $this->update_a_record(TABLE_USERDATA, $data, $condition);
        }
        $condition = array('guid' => $guid, 'source' => 1);

        return $this->update_a_record(TABLE_USERDATA, $data, $condition);
    }

    function public_login($event_id, $email, $password, $remember = FALSE)
    {
        $result = FALSE;
        $field = array('guid', 'group_id', 'email', 'password', 'unique_key');
        $condition = array('email' => $email);
        $user = $this->get_a_record(TABLE_USERS, $field, $condition);

        $register_flag = $this->ci->relation_lib->check_a_relation($user['guid'], $event_id, RELATION_USER_EVENT_REGISTERED);
        $confirm_flag = $this->ci->relation_lib->check_a_relation($user['guid'], $event_id, RELATION_USER_EVENT_CONFIRMED);

        if( ! $register_flag && ! $confirm_flag)
        {
            $msg = '您没有报名所选活动。';
            $this->set_a_msg($msg,'error');
            $this->increase_login_attempt();
        }
        elseif($user['password'] != $password)
        {
            $msg = '您输入的密码有误。';
            $this->set_a_msg($msg,'error');
            $this->increase_login_attempt();
        }
        else
        {
            $data = array('guid' => $user['guid'], 'email' => $user['email'], 'group_id' => $user['group_id'], 'event_id' => $event_id, 'is_login' => TRUE);
            $this->ci->session->set_userdata($data);//写入sesssion中
            if($remember) $this->create_autologin($data['guid'], $user['unique_key']);//如果用户选择了“记住我”,记录自动登录功能
            $this->clear_login_attempts();//清除失败记录
            $this->update_last_activity($user['guid']);//更新最后登录时间
            $result = TRUE;
        }
        return $result;
    }

    function generate_a_password()
	{
		return rand_str(6, '1234567890');
	}

    function admin_login($email, $password, $remember)
    {
        $result = FALSE;
        $field = array('guid', 'group_id', 'email', 'password', 'unique_key');
        $condition = array('email' => $email);
        $user = $this->get_a_record(TABLE_USERS, $field, $condition);
/*
        if ($user['group_id'] != 1)
        {
            $msg = 'You are not authorized to login';
            $this->set_a_msg($msg,'error');
            $this->increase_login_attempt();
        }
*/
        if($user['password'] != $password)
        {
            $msg = 'password incorrect!';
            $this->set_a_msg($msg,'error');
            $this->increase_login_attempt();
        }
        else
        {
            //将要写入的session数据准备好
            $data = array(
                'guid'		=> $user['guid'],
                'email' 	=> $user['email'],
                'group_id'	=> $user['group_id'],
                'is_login'	=> TRUE
            );

            $this->ci->session->set_userdata($data);//写入sesssion中
            if($remember) $this->create_autologin($data['guid'], $user['unique_key']);//如果用户选择了“记住我”,记录自动登录功能
            $this->clear_login_attempts();//清除失败记录

            $this->update_last_activity($user['guid']);//更新最后登录时间
            $result = TRUE;
        }

        return $result;
    }


    // *****************************************************************************
    // 用户登录
    // *****************************************************************************

    //Check if login attempts bigger than max login attempts specified in config
    function is_max_login_attempts_exceeded()
    {
        $result = FALSE;
        $attempts_num = $this->get_records('login_attempts', array('id'), array('ip_address' => $this->ci->input->ip_address()), NULL, NULL, NULL, NULL, TRUE);
        if ($attempts_num >= 5) $result = TRUE;
        return $result;
    }

    //删除autologins中的自动登录数据
    private function prune_key($guid)
    {
        $condition = array(
            'guid'			=> $guid,
            'user_agent'	=> substr($this->ci->input->user_agent(), 0, 149),
            'last_ip' 		=> $this->ci->input->ip_address()
        );
        return $this->delete_a_record('autologins', $condition);
    }

    //添加一条autologins中自动登录的用户数据
    private function store_key($unique_key, $guid)
    {
        $user = array(
            'unique_key'	=> $unique_key,
            'guid'			=> $guid,
            'user_agent'	=> substr($this->ci->input->user_agent(), 0, 149),
            'last_ip' 		=> $this->ci->input->ip_address(),
            'last_login' 	=> time()
        );
        return $this->create_a_record('autologins', $user);
    }

    //Clear login attempts
    private function clear_login_attempts()
    {
        return $this->delete_a_record('login_attempts', array('ip_address' => $this->ci->input->ip_address()));
    }

    //Increase login attempt
    private function increase_login_attempt()
    {
        return $this->create_a_record('login_attempts', array('ip_address' => $this->ci->input->ip_address(), 'time' => time()));
    }

    //将用户的登录数据写入cookie
    private function create_autologin($guid, $key)
    {
        $user = array(
            'unique_key' => md5(uniqid(rand().$key)),
            'guid'		 => $guid,
            'key'		 => $key
        );

        $this->prune_key($user['guid']);//将数据库中autologins的某用户的最近一次登录信息删除
        $this->store_key($user['unique_key'], $user['guid']);

        $cookie = array(
            'name'		=> $this->ci->config->item('autologin_cookie'),
            'value'		=> serialize($user),
            'expire'	=> $this->ci->config->item('cookie_expiration')
        );

        return $this->ci->input->set_cookie($cookie);
    }

    // *****************************************************************************
    // 用户退出
    // *****************************************************************************

    function logout2222222()
    {
        if ($this->ci->input->cookie($this->ci->config->item('autologin_cookie'))) $this->delete_autologin();
        return $this->ci->session->sess_destroy();
    }

    //将cookie设置失效
    private function delete_autologin()
    {
        if($cookie = $this->ci->input->cookie($this->ci->config->item('autologin_cookie')))
        {
            $cookie = unserialize($cookie);
            $condition = array('guid' => $cookie['guid'], 'unique_key' => $cookie['unique_key']);
            if ($this->delete_a_record('autologins', $condition))
            {
                $this->ci->input->set_cookie($this->ci->config->item('autologin_cookie'), '', -1);
                $result = true;
            }
        }
        return $result;
    }
}
