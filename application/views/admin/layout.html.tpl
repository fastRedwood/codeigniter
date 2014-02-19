<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="favicon.ico" type="image/ico">
	<meta charset="utf-8">
	<title>测试Smarty继承页面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="/resource/uilibs/jquery/jquery/1.10.1/jquery.js" type="text/javascript"></script>
  <link rel="stylesheet" href="/resource/uilibs/gallery2/bootstrap/3.1.1/css/bootstrap.css">
	<link rel="stylesheet" href="/resource/admin/css/admin.css">
</head>
<body>
  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="">管理后台</a>
      </div>
      <div class="navbar-collapse collapse">

        <ul class="nav navbar-nav">
          <li class="active"><a href="">用户管理</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href=""><i class="glyphicon glyphicon-home"></i> 回首页</a></li>
          <li><a href=""><i class="glyphicon glyphicon-user"></i> {{$user.name}}</a></li>
          <li><a href=""><i class="glyphicon glyphicon-off"></i> 退出</a></li>
        </ul>

      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">{{block name="content"}}{{/block}}</div>
  </div>
	{{block name="script"}}{{/block}}
	<script src="/resource/uilibs/seajs/seajs/2.1.1/sea.js"></script>
	<script src="/resource/uilibs/seajs-config.js" language="javascript">
	</script>
	<script>
		seajs.use('/resource/admin/js/admin-app.js');
	</script>
</body>
</html>