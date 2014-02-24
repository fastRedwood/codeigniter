<?php if (!defined('BASEPATH')) exit('No direct access allowed.');
class MY_Controller extends CI_Controller { 

	var $current_user;
	var $is_login;
	var $is_admin;

    public function __construct() {
        parent::__construct();
        $this->load->library('MY_lib');
		$this->load->library('form_validation');
		$this->load->helper('form');
		$this->load->helper('url');
		$this->load->library('email');
		
		$this->current_user		= $this->my_lib->current_user;
		$this->is_login			= $this->my_lib->is_login;
		$this->is_admin			= $this->my_lib->is_admin;

		// $this->_class			= $this->my_lib->_class;
		// $this->_method			= $this->my_lib->_method;
		
		// $this->my_lib->autologin();
    }
    
    /*	
    * example:
    *	// 传递联合数组
	*	$this->assign(array('bbb' => 'Lincoln', 'ccc' => 'Nebraska'));
    *
	*	// 传递数组
	*	$myArray = array('no' => 10, 'label' => 'Peanuts');
	*	$this->ci_smarty->assign('foo',$myArray);
    */
    public function assign($data, $param = null) {
    	if (isset($param)) {
    		return $this->ci_smarty->assign($data, $param);
    	}else{
    		return $this->ci_smarty->assign($data);
    	}
    }
 
    public function display($html) {
        $this->ci_smarty->display($html);
    }

    //登录控制
    public function access_control()
	{
		if(!$this->is_login) redirect('/user/login','refresh');
	}

	protected function send_email($receiver, $title, $body, $format = 'text')
	{
		$parameters = $this->config->item('parameters');
		$sender    = $this->config->item('smtp_user');

		try{
			$this->email->mailtype = $format;
			$this->email->from ($sender, $parameters['site_name']);
			$this->email->to ($receiver);
			$this->email->subject ($title);
			$this->email->message ($body);
			$this->email->send();

			//调试邮件发送
			// echo $this->email->print_debugger();
			// exit;

		}catch (Exception $e) {
            // @todo log it.
        }
        return TRUE;
	}

} 