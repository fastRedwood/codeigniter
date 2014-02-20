{{extends file="admin/user/layout.html.tpl"}}
{{block name="main"}}
	<table class="table">
		<thead>
			<th>Email</th>
			<th>注册时间</th>
			<th>最近登录</th>
			<th>操作</th>
		</thead>
		<tbody>
			{{foreach $users as $user}}
			<tr>
				<td>{{$user.email}}</td>
				<td>{{$user.createdTime|date_format}}</td>
				<td>{{$user.loginTime}}</td>
				<td>
					<a href="javascript:;" class="btn btn-default btn-sm" data-url="{{site_url url='admin/user/edit'}}" data-toggle="modal" data-target="#modal">添加子分类</a>

					<a href="{{site_url url='admin/user/edit'}}">修改用户信息</a></td>
			</tr>
			{{/foreach}}
		</tbody>
	</table>
{{/block}}