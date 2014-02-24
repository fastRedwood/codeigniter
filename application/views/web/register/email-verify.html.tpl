{% extends 'RedwoodWebBundle::beforeLayout.html.twig' %}

{% block content %}
    <table width="100%" cellpadding="15" cellspacing="0" border="0" bgcolor="#ffffff">
      <tr>
        <td>
          <div style="color:#444;font-size:14px;line-height:24px;margin-bottom:10px;"><span style="color:#5054a8;font-size:14px;" target="_blank">{{user.username}}</span>，您好！</div>
          <div style="color:#444;font-size:14px;line-height:24px;margin-bottom:10px;"><span style="font-weight:bold;">请点击下面的链接完成邮箱的验证：</span>
          <br />

          <a href="{{url('register_email_verify', {token:token|default('')})}}" target="_blank">{{url('register_email_verify', {token:token|default('')})}}</a>
          <br /><br />
          如果以上链接无法点击，请将上面的地址复制到你的浏览器(如IE)的地址栏中打开，该链接地址24小时内打开有效。
          <br /><br />

          感谢您对{{site_name}}的支持！

          {{site_name}} {{site_url}} 


          <br /><br />
          (这是一封自动产生的email，请勿回复。)
          <br />

          </div>
        </td>
      </tr>
    </table>

{% endblock %}