<?php
function smarty_block_block($params, $content, &$smarty)
{
if($content === null) return;
$name = strtoupper($params['name']);
//页面型block
if($name == 'PAGE'){
$type = $params['type'];
if(empty($type)){
$type = 'normal';
}
$file = 'inc/page_'. $type . '.html';  //加载页面布局文件
$output = $smarty->fetch($file); //解析这个页面布局文件
//通过正则解析
$pattern = "/".preg_quote ($smarty->left_delimiter).":([a-z_0-9]+):(.*?)".preg_quote ($smarty->right_delimiter)."/is";
preg_match_all($pattern, $content, $matches);
$result = array();
$replace = array();
for($i=0,$count=count($matches[1]);$i<$count;$i++){
$item = $matches[1][$i];
$result[] = $matches[2][$i];
$replace[] = '/<!--\s*'.$item.'\s*-->/i';
}
$output = preg_replace($replace,$result,$output);
return $output;
}else{
//模块型block，如：title,head_static,header,content,footer,foot_static
return $smarty->left_delimiter.':'.$name.':' . $content .$smarty->right_delimiter;
}
}
