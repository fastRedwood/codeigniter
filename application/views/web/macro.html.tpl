{* define the macro function *}
{function name=menu level=0}
  <ul class="level{$level}">
  {foreach $data as $entry}
    {if is_array($entry)}
      <li>{$entry@key}</li>
      {call name=menu data=$entry level=$level+1}
    {else}
      <li>{$entry}</li>
    {/if}
  {/foreach}
  </ul>
{/function}

<!-- 分页 -->
{function name=paginator}
{if $paginator.lastPage >1}
  <ul class='pagination'>

    {if $paginator.currentPage == $paginator.firstPage}
      <li class="disabled"><span>上一页</span></li>
    {else}
      <li><a  href="{{ $paginator.getPageUrl($paginator.previousPage) }}">上一页</a></li>
    {/if}

    {foreach $paginator.pages as $page}
        <li {if $page == $paginator.currentPage} class="active" {/if}>
          <a href="{{ $paginator.getPageUrl($page) }}">{{ $page }}</a>
        </li>
    {/foreach}

    {if $paginator.currentPage == $paginator.lastPage}
      <li class="disabled"><span>下一页</span></li>
    {else}
      <li><a  href="{{ $paginator.getPageUrl($paginator.nextPage) }}">下一页</a></li>
    {/if}

  </ul>
{/if}
{/function}