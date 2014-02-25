<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Welcome extends MY_Controller 
{
	public function index()
	{	
		// $this->assign(array('user' => $this->current_user, 'is_admin' => $this->is_admin));
		// $this->display('alice.html');
		$this->display('web/index.html.tpl');
	}
}