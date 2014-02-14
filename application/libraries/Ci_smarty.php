<?php
if(!defined('BASEPATH')) exit('No direct script access allowed');
require(APPPATH.'third_party/smarty/libs/Smarty.class.php');
class Ci_smarty extends Smarty
{
    protected $ci;
    
    public function __construct()
    {
        parent::__construct();
        
        $this->ci = & get_instance();
        $this->ci->load->config('smarty');//加载smarty的配置文件
        //获取相关的配置项
        $this->cache_lifetime  = $this->ci->config->item('cache_lifetime');
        $this->caching           = $this->ci->config->item('caching');
        $this->template_dir    = $this->ci->config->item('template_dir');
        $this->compile_dir     = $this->ci->config->item('compile_dir');
        $this->cache_dir       = $this->ci->config->item('cache_dir');
        $this->use_sub_dirs    = $this->ci->config->item('use_sub_dirs');
        $this->left_delimiter  = $this->ci->config->item('left_delimiter');
        $this->right_delimiter = $this->ci->config->item('right_delimiter');
        //下边2个是ci的系统变量，建议加上
        $this->assign('elapsed_time', $this->ci->benchmark->elapsed_time('total_execution_time_start', 'total_execution_time_end')); 
        $this->assign('memory_usage',  ( ! function_exists('memory_get_usage')) ? '0' : round(memory_get_usage() / 1024 / 1024, 2) . 'MB'); 
 
    }
}