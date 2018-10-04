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
<script type="text/javascript">
var intervalId = null;
$(document).ready(function() {
	<!--{if $tpl_change_msg}-->
	intervalId = null;
	$('#change_msg').fadeIn('normal' , function() {
		intervalId = setInterval(fadeOutMsg , 2000);
	});
	<!--{/if}-->
});

function fadeOutMsg()
{
	$('#change_msg').fadeOut('slow' , function() {clearInterval(intervalId);});	
}

/**
 * カード情報変更ページへの遷移
 * @param integer card_info_id
 * @param integer regular_flg
 * @return void
 */
function changeCardInfo(card_info_id , regular_flg)
{
    $('input[name="card_info_id"]').val(card_info_id);
    $('input[name="regular_flg"]').val(regular_flg);
    if (regular_flg == 0) {
        $('form[name="form1"]').attr('action' , './change_card_info.php').submit();
    }
    else {
        $('form[name="form1"]').attr('action' , './change_regular_card_info.php').submit();
    }
}
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
    <form name="form1" method="post" action="./change_card_info.php">
    <input type="hidden" name="mode" value="pre_edit" />
    <input type="hidden" name="card_info_id" value="" />
    <input type="hidden" name="regular_flg" value=""/>
    <div class="mycont_head">
      <h3>ご利用カード情報の変更・確認</h3>
    </div>
	<div id="change_msg" class="attention" style="display:none">
	<!--{$tpl_change_msg|escape}-->
	</div>
    <p class="mgb20">現在登録されているクレジットカード情報の確認や変更、<bR />また新規で追加することができます。</p>
    <!--<h3 class="mycont_headttl">▼ 登録済みクレジットカード</h3>-->
        	<div class="card_tb">
            <h3 class="mycont_headttl3">お買い物で通常使うカード</h3>
                  <!--{if $arrSavedCardInfo.normal}-->
                  <!--{foreach from=$arrSavedCardInfo.normal item=card_info key=idx}-->
                <table summary="カード情報照会" class="mgb15">
                  <tr>
                    <th colspan="2">
                        <div class="card_ttl">
                            <h3>クレジットカード情報<!--{$idx+1}--></h3>
                            <span class="fl_r cardch_bt pst4"><a href="#" onclick="changeCardInfo(<!--{$card_info.card_info_id}-->, 0); return false;"><span class="pst5">カード情報を変更する</span></a></span>
                        </div>
                    </th>
                  </tr>
                  <tr>
                    <td style="width:30%;">カード番号</td>
                    <td><!--{$card_info.card_number}-->&nbsp;</td>
                  </tr>
                  <tr>
                    <td>有効期限</td>
                    <td><!--{$card_info.expiration_month}-->月&nbsp;/&nbsp;<!--{$card_info.expiration_year}-->年</td>
                  </tr>
                  <tr>
                    <td>カード名義</td>
                    <td><!--{$card_info.cardholder_name}--></td>
                  </tr>
                  <tr>
                    <td>カード会社</td>
                    <td><!--{$card_info.company_name}--></td>
                  </tr>
                  <tr>
                    <td>有効性チェック</td>
                    <td><!--{$card_info.card_status}--></td>
                  </tr>
                </table>
                  <!--{/foreach}-->
                 <!--{else}-->
                 <p class="delivempty">登録されているカード情報はありません。</p>
                 <!--{/if}-->
            <!--{if $register_button_flg}-->
            <div class="cardnew_bt"><a href="./change_card_info.php">カード情報の新規登録はこちらから</a></div>
            <!--{/if}-->
    	</div>

       <div class="card_tb" style="clear:both;"> 
          <h3 class="mycont_headttl3">定期購入・頒布会利用時に使うカード</h3>
            
              <!--{if $arrSavedCardInfo.regular}-->
              <!--{foreach from=$arrSavedCardInfo.regular item=card_info key=idx}-->
            <table summary="カード情報照会">
              <tr>
                  <th colspan="2">
                      <div class="card_ttl">
                      	   <h3>クレジットカード情報<!--{$idx+1}--></h3>
                           <span class="fl_r cardch_bt pst4"><a href="#" onclick="changeCardInfo(<!--{$card_info.card_info_id}-->, 1); return false;"><span class="pst5">カード情報を変更する</span></a></span>
                      </div>
                  </th>
              </tr>
              <tr>
                <td style="width:30%;">カード番号</td>
                <td><!--{$card_info.card_number}--></td>
              </tr>
              <tr>
                <td>有効期限</td>
                <td><!--{$card_info.expiration_month}-->月&nbsp;/&nbsp;<!--{$card_info.expiration_year}-->年</td>
              </tr>
              <tr>
                <td>カード名義</td>
                <td><!--{$card_info.cardholder_name}--></td>
              </tr>
              <tr>
                <td>カード会社</td>
                <td><!--{$card_info.company_name}--></td>
              </tr>
              <tr>
                <td>有効性チェック</td>
                <td><!--{$card_info.card_status}--></td>
              </tr>
            </table>
              <!--{/foreach}-->
             <!--{else}-->
             <p class="delivempty">登録されているカード情報はありません。</p>
             <!--{/if}-->
            
          </div>  
    </form>
  </div>
</div>
