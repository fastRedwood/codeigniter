seajs.config({
	base:'/resource/uilibs',
	alias:{
		'jquery':'jquery/jquery/1.10.1/jquery.js',
		'$': 'jquery/jquery/1.10.1/jquery.js',
		'$-debug': 'jquery/jquery/1.10.1/jquery-debug.js',
		"jquery.form": "jquery-plugin/form/3.44.0/form",
		'scrollTo':"jquery-plugin/scrollTo/scrollTo.js",
		'jquery.appear':"jquery-plugin/appear/jquery.appear.js",
		'jquery.parallax':"jquery-plugin/parallax/jquery.parallax.js",
		'jquery.fancySelect':"jquery-plugin/fancySelect/jquery.fancySelect.js",
		'photosetGrid':"jquery-plugin/photoset-grid/photosetGrid.js",
		'jquery.isotope':"jquery-plugin/isotope/jquery.isotope.js",
		'jquery.sidr':"jquery-plugin/sidr/jquery.sidr.js",
		'retina':"retina/retina.js",
		'detect':"detect/detect.js",
		'bootstrap': 'gallery2/bootstrap/3.1.1/bootstrap'
	},
	// 预加载项
	preload: [
	this.JSON ? '' : 'json'],

	// 路径配置
	paths: {
		'common': 'common/'
	},

	// 变量配置
	vars: {
		'locale': 'zh-cn'
	},

	charset: 'utf-8',

	debug: true
});
