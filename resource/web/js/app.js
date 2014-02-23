define(function(require, exports, module) {
	window.$ = window.jQuery = require('jquery');
	
	exports.load = function(name) {
		require.async('./' + name + '.js', function(controller){
			if ($.isFunction(controller.run)) {
				controller.run();
			}
		});
	};
	window.load = exports.load;
});