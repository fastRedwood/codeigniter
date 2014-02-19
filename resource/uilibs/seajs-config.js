seajs.config({
	base:'/resource/uilibs',
	alias:{
		'jquery':'jquery/jquery/1.10.1/jquery.js',
		'$': 'jquery/jquery/1.10.1/jquery.js',
		'$-debug': 'jquery/jquery/1.10.1/jquery-debug.js',
		'bootstrap': 'gallery2/bootstrap/3.1.1/bootstrap',
	},
	// 预加载项
	preload: [
	this.JSON ? '' : 'json'],

	// 路径配置
	// paths: {
	// 	'common': 'common/'
	// },

	// 变量配置
	vars: {
		'locale': 'zh-cn'
	},

	charset: 'utf-8',

	debug: true
});
