
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社員登録</title>
<%@ include file="/WEB-INF/include/jquery_ui.jsp"%>
</head>
<body>
<script type="text/javascript">
	function goList(){
		var data = confirm("入力項目は削除されます。よろしいですか");
		if(data == true){
			location.href="userDetailListView";
		}else{
			return;
		}
	}
	function goMenu(){
		var data = confirm("入力項目は削除されます。よろしいですか");
		if(data == true){
			location.href="goMenu";
		}else{
			return;
		}
	}

	$(function(){
		$('#userNyuusyabi').datepicker({
			dateFormat : "yymmdd",
	        changeMonth : true,
	        changeYear : true,
	        showOtherMonths : true,
	      	selectOtherMonths : true
		});
	})

	var current = new Date();
	var currYear = current.getFullYear();
	var currMonth = current.getMonth()+1;
	var currDate = current.getDate();
	var currDateStr = currYear+""+currMonth+""+currDate;


	function formCheck(form){
		if(form.userKanjiName.value == ""){
			alert("漢字名前を入力して下さい。");
			form.userKanjiName.focus();
			return false;
		}
		if(form.userKanaName.value == ""){
			alert("カタカナ名前を入力して下さい。");
			form.userKanaName.focus();
			return false;
		}
		if(form.userEkki.value == ""){
			alert("最寄駅を入力して下さい。");
			form.userEkki.focus();
			return false;
		}
		if(form.userNyuusyabi.value == ""){
			alert("入社日を入力して下さい。");
			form.userNyuusyabi.focus();
			return false;
		}

		if(form.userKanjiName.value.match(/^[\u4E00-\u9FFF]+$/)){
		}else{
			alert("漢字を入力して下さい。");
			form.userKanjiName.focus();
			return false;
		}
		if(form.userKanaName.value.match(/^[\u30a1-\u30f6]+$/)){
		}else{
			alert("カタカナを入力して下さい。");
			form.userKanaName.focus();
			return false;
		}
		if(form.userKorName.value.match(/^[가-힣]+$/)){
		}else{
			alert("韓国語を入力して下さい。");
			form.userKorName.focus();
			return false;
		}
		if(form.userEngName.value.match(/^[a-zA-Z]+$/)){
		}else{
			alert("英語を入力して下さい。");
			form.userEngName.focus();
			return false;
		}

		if(form.userKanjiName.value.length > 40){
			alert("漢字名前は40文字以下入力して下さい。");
			form.userKanjiName.focus();
			return false;
		}
		if(form.userKanaName.value.length > 40){
			alert("カタカナ名前は40文字以下入力して下さい。");
			form.userKanaName.focus();
			return false;
		}
		if(form.userKorName.value.length > 40){
			alert("韓国語名前は40文字以下入力して下さい。");
			form.userKorName.focus();
			return false;
		}
		if(form.userEngName.value.length > 40){
			alert("英語名前は40文字以下入力して下さい。");
			form.userEngName.focus();
			return false;
		}
		if(form.userRenkeikikan.value.length > 40){
			alert("連携機関は40文字以下入力して下さい。");
			form.userRenkeikikan.focus();
			return false;
		}
		if(form.userBikou.value.length > 40){
			alert("備考は40文字以下入力して下さい。");
			form.userBikou.focus();
			return false;
		}
		if(form.userEkki.value.length > 250){
			alert("最寄駅は250文字以下入力して下さい。");
			form.userEkki.focus();
			return false;
		}
		if(form.userMemo.value.length > 250){
			alert("メモは250文字以下入力して下さい。");
			form.userMemo.focus();
			return false;
		}
		if(form.userNyuusyabi.value > currDateStr){
			alert("未来の入社日はできません。");
			form.userNyuusyabi.focus();
			return false;
		}
	}





</script>
<br/><br/>
<h1 align="center">社員登録</h1><br/><br/>

<div align="center">

<table border="0">
<tr>
<td>「<font color="red">*</font>」が付いた箇所は必須項目です。</td>
<td width="200">&nbsp;</td>
</tr>
<tr>
<td><font color="red">！</font>お名前(漢字)、最寄駅、入社日は必須です。</td>
</tr>
<tr>
<td><font color="red">！</font>お名前（カタカナ）は必須です。</td>
</tr>
</table>

<table align="center" border="0">
<tr><td width="400">&nbsp;</td>
		<td align="right" height="50">
		<input type="button" value="一覧へ" onClick="goList()"/></td>
		</tr>
</table>

<table align="center" border="0">
		<s:form action="user_Add" method="get" name="frm" onSubmit="return formCheck(this)">

<tr>
	<td>お名前（漢字）<font color="red">*</font></td>
	<td><s:textfield name="userDto.userKanjiName" label="お名前（漢字）" id="userKanjiName"></s:textfield></td>
</tr>
<tr>
	<td>お名前（カタカナ）<font color="red">*</font>&nbsp;&nbsp;&nbsp;</td>
	<td><s:textfield name="userDto.userKanaName" label="お名前（カタカナ）" id="userKanaName"></s:textfield></td>
</tr>
<tr>
	<td>お名前（韓国語）</td>
	<td><s:textfield name="userDto.userKorName" label="お名前（韓国語）" id="userKorName"></s:textfield></td>
</tr>
<tr>
	<td>お名前（英語）</td>
	<td><s:textfield name="userDto.userEngName" label="お名前（英語）" id="userEngName"></s:textfield></td>
</tr>
<tr>
	<td>社員番号</td>
	<td><s:textfield name="userDto.userSyainBango" label="社員番号" id="userSyainBango"></s:textfield></td>
</tr>

   		<input type="hidden" name="userDto.userEigyoubango" value="1"/>

<tr>
	<td>最寄駅<font color="red">*</font></td>
	<td><s:textfield name="userDto.userEkki" label="最寄駅" id="userEkki"></s:textfield></td>
<tr>
</tr>
<tr>
	<td>入社日<font color="red">*</font></td>
	<td>
	<input type="text" id="userNyuusyabi" name="userDto.userNyuusyabi" />
	</td>
</tr>
<tr>
	<td>役職</td>
	<td><input type="radio" name="userDto.userYakushoku" value="1" id="userYakushoku" checked="checked"/>一般&nbsp;
		<input type="radio" name="userDto.userYakushoku" value="2" id="userYakushoku"/>主任&nbsp;
		<input type="radio" name="userDto.userYakushoku" value="3" id="userYakushoku"/>課長代理&nbsp;
		<input type="radio" name="userDto.userYakushoku" value="4" id="userYakushoku"/>課長&nbsp;
		<input type="radio" name="userDto.userYakushoku" value="5" id="userYakushoku"/>次長&nbsp;
		<input type="radio" name="userDto.userYakushoku" value="6" id="userYakushoku"/>部長&nbsp;</td>
</tr>
<tr>
	<td>本社ステータス</td>
	<td><input type="radio" name="userDto.userStatus" value="1" id="userStatus" checked="checked"/>内定者&nbsp;
		<input type="radio" name="userDto.userStatus" value="2" id="userStatus"/>現場&nbsp;
		<input type="radio" name="userDto.userStatus" value="3" id="userStatus"/>新入&nbsp;
		<input type="radio" name="userDto.userStatus" value="4" id="userStatus"/>待機&nbsp;
		<input type="radio" name="userDto.userStatus" value="5" id="userStatus"/>退職&nbsp;
	</td>
</tr>
<tr>
	<td>キーマン</td>
	<td><select name="userDto.userKeyman" id="userKeyman">
		<option value="0">一般</option>
		<option value="1">L</option>
		<option value="2">S</option>
		<option value="3">SL</option>
	</select>
	</td>
</tr>
<tr>
	<td>連携機関</td>
	<td><s:textfield name="userDto.userRenkeikikan" label="連携機関" id="userRenkeikikan"></s:textfield></td>
</tr>
<tr>
	<td>メモ</td>
	<td><s:textfield name="userDto.userMemo" label="メモ" id="userMemo"></s:textfield></td>
</tr>
<tr>
	<td>備考</td>
	<td><s:textfield name="userDto.userBikou" label="備考" id="userBikou"></s:textfield></td>
</tr>

<tr>

	<td height="150">
	<input type="button" value="戻る" onClick="goMenu()"/>
	</td>
	<td align="right">
	<input type="submit" value="登録"/></td>

</tr>
</s:form>
</table>

</div>

</body>
</html>