{{extends file="web/layout.html.tpl"}}
{{block name="title" prepend}} 注 册 {{/block}}

{{block name="content"}}

<div class="inner">
	<h2 class="title">欢迎注册</h2>
	<article class="main">
		<div class="inner-main">
			<div class="login-form">
				<a href="{{site_url url='user/login'}}" >我要登录！！</a>
				<form action="{{site_url url='user/register'}}" method="POST">
			
                    <div class="input">
                    	<span>邮 箱</span>
                    	<input type="text" name="email" value="{{set_value('email')}}">
            			<span>{{form_error('email')}}</span>

                    </div>
					<div class="input">
						<span>密码</span>
						<input type="password" name="password" value="{{set_value('password')}}">
						<span>{{form_error('password')}}</span>
					</div>
					<div class="input">
						<span>在输入一次密码</span>
						<input type="password" name="passconf" value="{{set_value('passconf')}}">
						<span>{{form_error('passconf')}}</span>
					</div>
					<div class="submit">
						<input type="submit" name="submit" value="注 册">
					</div>
				</form>
			</div>
		</div>
	</article>
	<article class="finnal_end">
		<i class="l_bg"></i>
		<i class="r_bg"></i>
	</article>
</div>


{{/block}}