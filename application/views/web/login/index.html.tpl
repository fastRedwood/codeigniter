{{extends file="web/layout.html.tpl"}}
{{block name="title" prepend}}登 录 {{/block}}

{{block name="content"}}

<div class="inner">
	<?php if($this->session->flashdata('error')) : ?>
		<div class="<?=$this->session->flashdata('message_type')?>">
		<h3><span>&nbsp;</span><?=$this->session->flashdata('message')?></h3>
		</div>
	<?php endif; ?>
	<h2 class="title">登 录</h2>
		<form action="{{site_url url='user/login'}}" method="POST">
			<div class="message">
				{{if $error != ''}}<p class="error">{{$error}}</p>{{/if}}
				{{if $message != ''}}<p class="message">{{$message}}</p>{{/if}}

				{{validation_errors()}}
			</div>
			
            <div class="input">
            	<span>邮 箱</span>
            	<input type="text" name="email" id="email" value="" />
            	<span>{{form_error('email')}}</span>
            </div>
			<div class="input">
				<span>密码</span>
				<input type="password" name="password">
            	<span>{{form_error('password')}}</span>

			</div>
			<div class="submit">
				<input type="submit" name="submit" value="登 录">
				<a href="javascript:;">找回密码</a>
			</div>
		</form>
</div>
{{/block}}


