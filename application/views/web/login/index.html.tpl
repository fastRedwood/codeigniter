{{extends file="web/layout.html.tpl"}}
{{block name="title" prepend}}登 录 {{/block}}

 {{block name="stylesheet"}}
        <!-- Proton CSS: -->
        <link rel="stylesheet" href="/resource/css/proton.css">
        <link rel="stylesheet" href="/resource/css/animate.css">
        <!-- Fonts CSS: -->
        <link rel="stylesheet" href="/resource/css/font-awesome.css" type="text/css" />
        <link rel="stylesheet" href="/resource/css/font-titillium.css" type="text/css" />
{{/block}}
{{block name="header"}}{{/block}}
{{block name="content"}}
<!--[if lt IE 8]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

 <div class="login-page">
      	<form role="form" action="{{site_url url='user/login'}}" method="POST">
        	<div class="message">
			{{validation_errors()}}
		</div>
            <section class="wrapper scrollable animated fadeInDown">
                <section class="panel panel-default">
                    <div class="panel-heading">
                        <div>
                            <img src="/resource/web/images/cicms.png" alt="cicms-logo">
                            <h1>
                                <span class="title">
                                    CI-CMS
                                </span>
                                <span class="subtitle">
                                    CI-CMS ADMIN PANEL
                                </span>
                            </h1>
                        </div>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="welcome-text">
                                Welcome back to CI-CMS!
                            </span>
                            <span class="member">
                                Not a Member?
                            </span>
                            <a href="javascript:;">Sign Up »</a>
                        </li>
                        <li class="list-group-item">
                            <span class="login-text">
                                Login with your Proton account
                            </span>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email"  name = "email" class="form-control input-lg" id="email" placeholder="Email">
                                <span>{{form_error('email')}}</span>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" class="form-control input-lg" id="password" placeholder="Password">
                                <span>{{form_error('password')}}</span>
                            </div>
                        </li>
                    </ul>
                    <div class="panel-footer">
                    	<input  class="btn btn-lg btn-success" type="submit" name="submit" value="登 录">   
              		<br>                        
                        <a class="forgot" href="javascript:;">找回密码</a>
                    </div>
                </section>
            </section>
        </form>
</div> 
{{/block}}


