{{extends file="admin/layout.html.tpl"}}
{{block name="content"}}
  <div class="col-md-2">
    <div class="list-group">
      <ul class="nav nav-list">
	      <a href="" class="list-group-item active">管理<span class="glyphicon glyphicon-chevron-right"></span></a>
	      <a href="" class="list-group-item">管理<span class="glyphicon glyphicon-chevron-right"></span></a>
      </ul>
    </div>
  </div>
  <div class="col-md-9">
  	<div class="maincontent">
      {{block name="main"}}
      {{/block}}
  	</div>
  </div>
{{/block}}