<!--{*
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
*}-->
<script type="text/javascript" src="<!--{$smarty.const.URL_DIR}-->js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript">
$(document).ready(function() {
	var sm = new ScreenMask($);
	$('#form1').bind('submit' , function() {
		sm.append();
		return true;
	});
});
</script>

<!--▼CONTENTS-->
<div id="mypagecolumn">
  <div class="head">
		<h2 class="t_mypage">マイページ
        <!--{* ポイント表示 *}-->
        <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
        </h2>
	</div>
  <!--{if $tpl_navi != ""}-->
    <!--{include file=$tpl_navi}-->
  <!--{else}-->
    <!--{include file=`$smarty.const.TEMPLATE_DIR`mypage/navi.tpl}-->
  <!--{/if}-->
  <div id="mycontentsarea">
    <form id="form1" name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
    <input type="hidden" name="mode" value="register" />
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$token}-->" />
    <!--{foreach from=$arrHidden item=value key=key}-->
    <input type="hidden" name="<!--{$key}-->" value="<!--{$value|escape}-->" />
    <!--{/foreach}-->
        <div class="mycont_head">
          <h3>ご利用カード情報の変更・登録</h3>
        </div>
        <div class="info_change">
            <table summary="カード情報照会">
              <tr>
                   <th width="200">カード番号</th>
                <td>
                       <!--{assign var=key1 value="card_no1"}-->
                       <!--{assign var=key2 value="card_no2"}-->
                       <!--{assign var=key3 value="card_no3"}-->
                       <!--{assign var=key4 value="card_no4"}-->
                       <!--{$arrForm[$key1].value|escape}-->-<!--{$arrForm[$key2].value|escape}-->-<!--{$arrForm[$key3].value|escape}-->-<!--{$arrForm[$key4].value|escape}-->
                </td>
              </tr>
              <tr>
                <th>有効期限</th>
                <td>
                    <!--{assign var=key1 value="card_expiration_month"}-->
                    <!--{assign var=key2 value="card_expiration_year"}-->
                  <!--{$arrForm[$key1].value|escape}-->月&nbsp;/&nbsp;<!--{$arrForm[$key2].value|escape}-->年
                </td>
              </tr>
              <tr>
                <th>カード名義<br />(ローマ字氏名)</th>
                <td>
                    <!--{assign var=key1 value="card_holder_name1"}-->
                    <!--{assign var=key2 value="card_holder_name2"}-->
                    名:<!--{$arrForm[$key1].value|escape}-->&nbsp;姓:<!--{$arrForm[$key2].value|escape}-->
                </td>
              </tr>
            </table>
        </div>
        <div class="btn_rpst3_2">
                      <span class="btn_prev"><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;">戻&nbsp;る</a></span>
                      <input type="hidden" name="back" id="back" />
        </div>            
        <ul class="btn_area_n2">
            <li class="btn">
                <span class="btn_next"><a href="javascript:void();" onclick="document.form1.submit();">送&nbsp;信</a></span>
                <input type="hidden" name="complete" id="complete" />
            </li>
        </ul>
    </form>
  </div>
</div>
