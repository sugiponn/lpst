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
<!--▼CONTENTS-->
<script type="text/javascript">
//<![CDATA[
var done = {};
done.card_no1 = false;
done.card_no2 = false;
done.card_no3 = false;

function next(now, next) {
    if (now.value.length >= now.getAttribute('maxlength') && !done[now.name]) {
        next.focus();
        done[now.name] = true;
    } else if (now.value.length < now.getAttribute('maxlength')) {
        done[now.name] = false;
    }
}
//]]>
</script>
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
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
    <input type="hidden" name="mode" value="confirm" />
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$token}-->" />
    <!--{if $tpl_edit_flg == true}-->
    <!--{assign var=key value="card_info_id"}-->
    <input type="hidden" name="<!--{$key}-->" value="<!--{$arrForm[$key].value}-->" />
    <!--{/if}-->
	<div class="mycont_head">
		<h3>ご利用カード情報の変更・登録</h3>
	</div>
    <span class="attention">※定期購入/頒布会用のカード情報は変更のみ可能です。</span>
    	<div class="info_change">
            <table summary="カード情報照会">
              <tr>
                   <th width="150px">カード番号</th>
                   <th width="50px"><span class="required">必須</span></th>
                <td>
                  <input type="text" 
                          name="card_no"
                          value="<!--{$arrForm.card_no.value|escape}-->"
                          maxlength="16"
                          style="ime-mode: disabled; <!--{$arrErr.card_no|sfGetErrorColor}-->"
                          class="box300"
                                      size="24"
                                      placeholder="1234567890123456" 
                                      />
                  <div class="attention"><!--{$arrErr.card_no}--></div>
               
                  <div class="mgt10"> 半角入力(例：1234567890123456)</div>
                </td>
              </tr>
              <tr>
                <th>有効期限</th>
                <th><span class="required">必須</span></th>
                <td>
                  <!--{assign var=key1 value="card_expiration_month"}-->
                  <!--{assign var=key2 value="card_expiration_year"}-->
                 	 <div class="custom-selectbox w15">
                         <select name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" >
                          <option value="">--</option>
                          <!--{html_options options=$arrMonth selected=$arrForm[$key1].value|escape}-->
                          </select>
                      </div>
                      <span>月　/　</span>
                       <div class="custom-selectbox w15">
                          <select name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" >
                          <option value="">--</option><!--{html_options options=$arrYear selected=$arrForm[$key2].value|escape}--></select>
                       </div>
                      <span>年</span>
                      <div class="attention"><!--{$arrErr[$key1]}--></div>
                      <div class="attention"><!--{$arrErr[$key2]}--></div>
                </td>
              </tr>
              <tr>
                <th>カード名義<br />(ローマ字氏名)</th>
                <th><span class="required">必須</span></th>
                <td>
                  <!--{assign var=key1 value="card_holder_name1"}-->
                  <!--{assign var=key2 value="card_holder_name2"}-->
                  <p>
                    名&nbsp;<input type="text"
                                  name="<!--{$key1}-->"
                                  value="<!--{$arrForm[$key1].value|escape}-->"
                                  maxlength="<!--{$arrForm[$key1].length}-->"
                                  style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"
                                  size="20"
                                  placeholder="TAROU"
                                  class="box120">&nbsp;&nbsp;
                     姓&nbsp;<input type="text"
                                  name="<!--{$key2}-->"
                                  value="<!--{$arrForm[$key2].value|escape}-->"
                                  maxlength="<!--{$arrForm[$key2].length}-->"
                                  class="box120"
                                  style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"
                                  size="20"
                                  placeholder="YAMADA"
                                  >
                   </p>
                      <div class="attention"><!--{$arrErr[$key1]}--></div>
                      <div class="attention"><!--{$arrErr[$key2]}--></div>
                      <div class="mgt10">半角入力(例：TAROU&nbsp;YAMADA)</div>
                </td>
              </tr>
            </table>
        </div>    
        <ul class="btn_area_l2">
            <li class="btn">
                <span class="btn_next"><a href="javascript:void();" onclick="paygent_token_send();">確認ページへ<input type="hidden" name="refusal" id="refusal" /></a></span>
            </li>
        </ul>
    </form> 
  </div>
</div>

<style type="text/css">
input, select, textarea{background-color: #ddd;}
</style>

<script>
$(function(){
  $("input, select, textarea").one("focus",function(){
     $(this).css("background","rgba(255,200,200,0.7)");
  }).blur(function(){ /*フォーカスが外れたとき*/
      if($(this).val()==""){ /*何も入力されていないなら*/
        $(this).css("background","#ddd").one("focus",function(){
               $(this).css("background","#ddd");
          });
       }
      else{
        $(this).css("background","#fff").one("focus",function(){
               $(this).css("background","#fff");
          }); 
      }
    });
});
</script>
