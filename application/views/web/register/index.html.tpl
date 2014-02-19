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
					<div class="message">
					<?php
						if(count($msg) > 0 OR strlen(validation_errors()) > 0)
						{
							echo '<ul>';
							echo validation_errors('<li>','</li>');
							if(count($msg) > 0) echo '<li>'.$msg['msg'].'</li>';
							echo '</ul>';
						}
					?>
					</div>
					
                    <div class="input">
                    	<span>邮 箱</span>
                    	<input type="text" name="email">
                    </div>
					<div class="input">
						<span>密码</span>
						<input type="password" name="password">
					</div>
			<!-- 		<div class="input">
						<span>在输入一次密码</span>
					</div> -->
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