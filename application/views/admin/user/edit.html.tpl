{{extends file="admin/bootstrap-modal-layout.html.tpl"}}


{{block name="body"}}
    <div class="modal-body">
        <table cellpadding="3">
            <tr><td>
                    <div class="input-group">
        <span class="input-group-addon">名称</span>
        <input type="text" class="form-control" placeholder="人员名称" id="peoplename"/>
    </div>
                </td></tr>
            <tr><td>
                    <div class="input-group">
        <span class="input-group-addon">英文名称</span>
        <input type="text" class="form-control" placeholder="英文名称" id="englishname"/>
    </div>
                </td></tr>
            <tr><td>
                    <div class="input-group">
        <span class="input-group-addon">类型</span>
        <select id="organization" class="form-control" >
            </select>
    </div>
                </td></tr>
            <tr><td>
                    <div class="input-group">
        <span class="input-group-addon">性别</span>
        <select id="sex" class="form-control" >
                <option value="0">男</option>
                <option value="1">女</option>
            </select>

    </div>
                </td></tr>
            <tr><td>
                    <div class="input-group">
        <span class="input-group-addon">国家</span>
        <select id="country" class="form-control" >
            </select>

    </div>
                </td></tr>
            <tr><td>
                    <div class="input-group">
        <span class="input-group-addon">主要城市</span>
        <input type="text" class="form-control" placeholder="主要城市" id="city"/>
    </div>
                </td></tr>
            <tr><td>
                    <div class="input-group">
        <span class="input-group-addon">职业</span>
        <input type="text" class="form-control" placeholder="职业" id="occuption"/>
    </div>
                </td></tr>
            <tr><td>
                    <div class="input-group">
        <span class="input-group-addon">出生日期</span>
        <input type="text" class="form-control" placeholder="出生日期" id="birthday"/>
    </div>
                </td></tr>
            <tr><td>
                    <div class="input-group">
        <span class="input-group-addon">其他信息</span>
        <textarea id="userinfo" maxlength="1000" cols="30" rows="3" class="form-control"></textarea>
    </div>
                </td></tr>
        </table>
{{/block}}
