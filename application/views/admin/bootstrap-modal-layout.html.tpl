<div class="modal-dialog" style="width:400px;">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title">{{block name="title"}}{{/block}}</h4>
    </div>
    <div class="modal-body">{{block name="body"}}{{/block}}</div>
    {{if not hide_footer}}
      <div class="modal-footer">{{block name="footer"}}{{/block}}</div>
    {{/if}}
  </div>
</div>