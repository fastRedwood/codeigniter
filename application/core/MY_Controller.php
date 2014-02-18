<?php if (!defined('BASEPATH')) exit('No direct access allowed.');
class MY_Controller extends CI_Controller { 
	var $_guid;
	var $_group_id;
	var $_login_status;
	var $_event_id;
	
	var $_class;
	var $_method;

    public function __construct() {
        parent::__construct();
        $this->load->library('MY_lib');
		$this->load->library('Form_validation');
		$this->load->helper('form');
		$this->load->helper('url');
		
		$this->_login_status	= $this->my_lib->_login_status;
		$this->_group_id		= $this->my_lib->_group_id;
		$this->_guid			= $this->my_lib->_guid;
		$this->_event_id		= $this->my_lib->_event_id;
		
		$this->_class			= $this->my_lib->_class;
		$this->_method			= $this->my_lib->_method;
		
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
} 