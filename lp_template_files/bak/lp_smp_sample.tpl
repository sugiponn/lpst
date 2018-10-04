<!--{if $layout == 'lp_header'}-->
<!--{* ↓↓ヘッダーデザイン↓↓ *}-->
ここにヘッダーデザイン設定
<!--{* ↑↑ヘッダーデザイン↑↑ *}-->
<!--{/if}-->
<!--{if $layout == 'lp_product'}-->
<option value=""<!--{if $select == ''}--> selected="selected"<!--{/if}-->>＜＜商品を選択してください＞＞</option>
<!--{* ↓↓商品リスト↓↓ *}-->
<option value="0000"<!--{if $select == '0000'}--> selected="selected"<!--{/if}-->>商品名１</option>
<option value="1111"<!--{if $select == '1111'}--> selected="selected"<!--{/if}-->>商品名２</option>
<option value="2222"<!--{if $select == '2222'}--> selected="selected"<!--{/if}-->>商品名３</option>
<!--{* ↑↑商品リスト↑↑ *}-->
<!--{/if}-->

<!--{if $layout == 'lp_footer'}-->
<!--{* ↓↓フッターデザイン↓↓ *}-->
ここにフッターデザイン設定
<!--{* ↑↑フッターデザイン↑↑ *}-->
<!--{/if}-->
