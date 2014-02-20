<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="favicon.ico" type="image/ico">
	<meta charset="utf-8">
	<title>{{block name="title"}} 测试web layout {{/block}}</title> 
	{{block name="stylesheet"}}

	{{/block}}
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
{{block name="content"}}
123
{{/block}}

<script>
    var __seajs_debug = 2;
    var __seajs_assets_version = '8';

    seajs.use('/resource/web/js/app.js', function(app){   
       /* $.scrolltotop({
            className: 'totop',
            controlHTML: '<a href="javascript:;">回到顶部↑</a>',
            offsety: 10
        });*/
        {% block page_script %}{% endblock %}
    });

</script>
</body>
</html>