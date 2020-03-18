<%@ include file="/WEB-INF/include/jquery_ui.jsp"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<sx:head parseContent="true" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社員情報</title>
<style type="text/css">


table {
	margin-left: 40px;
}

label {
	margin-left: 20px;
	margin-top: 10px;
}

.textfield {
	margin-left: 20px;
}

#bigtitle {
	margin-left: 650px;
}

#name1 {
	margin-left: 250px;
}

#kanjiname {
	width: 300px;
}

#kananame {
	width: 300px;
}

#name2 {
	margin-left: 250px;
}

#engname {
	width: 300px;
}

#korname {
	width: 300px;
}

#shainnum {
	margin-left: 250px;
}

#nyushaday {
	margin-left: 250px;
}

#honshastatus {
	margin-left: 250px;
}

#memo {
	margin-left: 250px;
}

#bikou {
	margin-left: 250px;
}

#tantoeigyou {
	margin-left: 250px;
}

#genbaday {
	margin-left: 250px;
}

#genbadate {
	margin-left: 250px;
}

#renkeikikan {
	margin-left: 250px;
}

#honshakeireki {
	margin-left: 250px;
}

#ippankeireki {
	margin-left: 250px;
}

#genbakaishamei {
	margin-left: 250px;
}
#userGenbaKaisyamei{
	background-color: #e0ebeb;
}
#userGenbaKaisyamei{
	background-color: #e0ebeb;
}

#genbabashou {
	margin-left: 250px;
}

#userGenbaBasyo{
	background-color: #e0ebeb;
}


#genbanyuujyoubi {
	margin-left: 250px;
}

#userGenbaNyuujyoubi{
	background-color: #e0ebeb;
}

#genbataijyoubi {
	margin-left: 250px;
}

#userGenbaTaijyoubi{
	background-color: #e0ebeb;
}

#genbakikan {
	margin-left: 250px;
}

#userGenbaKikan{
	background-color: #e0ebeb;
}

#genbastatus {
	margin-left: 250px;
}

#userGenbahyouka {
	margin-left: 250px;
}

#userGenbaHyouka1{
	background-color: #e0ebeb;
}

#genbaHyouka {
	margin-left: 250px;
}

#genbaHyouka1{
	background-color: #e0ebeb;
}

#genbatourokubi {
	margin-left: 250px;
}

#eigyouGenbaTourokubi{
	background-color: #e0ebeb;
}
#kyuuryoulabel{
	margin-left: 250px;
}



</style>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function genbaSearchInitOpen(){

    	window.open("/manager/genbaSearchInit", "genbaSearchWindow" , "top=200,left=500 width=600, height=600");
	}
	$(function(){

		$('#userDetailListView').click(function(){
			location.href = "/manager/userDetailListView";
		});
	});
	$(function(){
		$('#goMenu').click(function(){
			var confirmMsg = confirm("入力項目は削除されます。よろしいでしょうか。");
			if(confirmMsg == true){
				location.href = "/manager/goMenu";
		}else{
			return false;
		}
		});
	});
	 $(function(){

		$('#userNyuusyabi').datepicker({
			dateFormat : "yymmdd",
	        changeMonth : true,
	        changeYear : true,
	        showOtherMonths : true,
	      	selectOtherMonths : true
		});
	})

	$(function(){

		$('#userHatsugenba').datepicker({
			dateFormat : "yymmdd",
	        changeMonth : true,
	        changeYear : true,
	        showOtherMonths : true,
	      	selectOtherMonths : true
		});
	})

	$(function(){

		$('#userGenbaNyuujyoubi').datepicker({
			dateFormat : "yymmdd",
	        changeMonth : true,
	        changeYear : true,
	        showOtherMonths : true,
	      	selectOtherMonths : true
		});
	})

	$(function(){

		$('#userGenbaTaijyoubi').datepicker({
			dateFormat : "yymmdd",
	        changeMonth : true,
	        changeYear : true,
	        showOtherMonths : true,
	      	selectOtherMonths : true
		});
	})

	$(function(){

		$('#eigyouGenbaTourokubi').datepicker({
			dateFormat : "yymmdd",
	        changeMonth : true,
	        changeYear : true,
	        showOtherMonths : true,
	      	selectOtherMonths : true
		});
	})


	function userModify(){

			var userId = $("#userId").val();
			var eigyouId = $("#eigyouId").val();
			var userKanjiName = $("#kanjiName").val();
			var userKanaName = $("#kanaName").val();
			var userEngName = $("#engName").val();
			var userKorName = $("#korName").val();
			var userSyainBango = $("#shainBango").val();
			var userEkki = $("#ekki").val();
			var userNyuusyabi = $("#userNyuusyabi").val();
			var userStatus = $("input[type='radio'][name='userAllInfoDto.userStatus']:checked").val();
			var userYakushoku = $("input[type='radio'][name='userAllInfoDto.userYakushoku']:checked").val();
			var userKeyman = $("#userKeyman").val();
			var userMemo = $("#userMemo").val();
			var userBikou = $("#userBikou").val();
			var userHatsugenba = $("#userHatsugenba").val();
			var userRenkeikikan = $("#userRenkeikikan").val();
			var userTpsKeireki = $("#userTpsKeireki").val();
			var userIppanKeireki = $("#userIppanKeireki").val();


		if($("#kanjiName").val() == ""){
			alert("漢字を入力してください。");
			return false;
		}
		if($("#kanaName").val() == ""){
			alert("カタカナを入力してください。");
			return false;
		}
		if($("#syainBango").val() == ""){
			alert("社員番号を入力してください。");
			return false;
		}
		if($("#ekki").val() == ""){
			alert("最寄駅を入力してください。");
			return false;
		}
		if($("#userNyuusyabi").val() == ""){
			alert("入社日を入力してください。");
			return false;
		}else{

	 	$.ajax({

			url : "UserModifyDone",

			type : "POST",

			dataType : "json",

			data :
			{
				 'userAllInfoDto.userId':userId,
				 'userAllInfoDto.eigyouId':eigyouId,
				 'userAllInfoDto.userKanjiName':userKanjiName,
				 'userAllInfoDto.userKanaName':userKanaName,
				 'userAllInfoDto.userEngName':userEngName,
				 'userAllInfoDto.userKorName':userKorName,
				 'userAllInfoDto.userSyainBango':userSyainBango,
				 'userAllInfoDto.userEkki':userEkki,
				 'userAllInfoDto.userNyuusyabi':userNyuusyabi,
				 'userAllInfoDto.userYakushoku':userYakushoku,
				 'userAllInfoDto.userStatus':userStatus,
				 'userAllInfoDto.userKeyman':userKeyman,
				 'userAllInfoDto.userMemo':userMemo,
				 'userAllInfoDto.userBikou':userBikou,
				 'userAllInfoDto.userHatsugenba':userHatsugenba,
				 'userAllInfoDto.userRenkeikikan':userRenkeikikan,
				 'userAllInfoDto.userTpsKeireki':userTpsKeireki,
				 'userAllInfoDto.userIppanKeireki':userIppanKeireki
			},
			success : function(){
				alert("登録が成功しました。");
			},
			error : function(error){
				alert("error"+error);
			}
		});
	}
	}
</script>
</head>
<body>
 <s:form id="userModifySource">
	<div>
		<table>

			<tr>
				<td><input type="button" value="一覧へ" id="userDetailListView"/></td>
			</tr>
			<tr>
				<td><label>「 * 」が付いた箇所は必須項目です。</label></td>
			</tr>
			<tr>
				<td><label>！お名前(漢字)は必須です。</label></td>
			</tr>
			<tr>
				<td><label>！フリガナは必須です。</label></td>
			</tr>
			<tr>
				<td><label id="bigtitle">基本情報</label>

				<input type="hidden" id="userId" name="userAllInfoDto.userId"  Class="textfield" value="<s:property value='userAllInfoDto.userId'/>"/>
				<input type="hidden" id="genbaId" name="userAllInfoDto.userGenbaId" Class="textfield" value="<s:property value='userAllInfoDto.userGenbaId'/>"/></td>

			</tr>
			<tr>
				<td>
					<label id="name1">名前(漢字)</label><label style="color: red">*</label>
						<input type="text" id="kanjiName" name="userAllInfoDto.userKanjiName" Class="textfield" value="<s:property value='userAllInfoDto.userKanjiName'/>"/>
					<label>名前(フリガナ)</label>
						<input type="text" id="kanaName" name="userAllInfoDto.userKanaName" Class="textfield" value="<s:property value='userAllInfoDto.userKanaName'/>"/>
				</td>
			</tr>
			<tr>
				<td><label id="name2">名前(英語)</label>
						<input type="text" id="engName" name="userAllInfoDto.userEngName"Class="textfield" value="<s:property value='userAllInfoDto.userEngName'/>"/>
					<label>名前(韓国語)</label>
						<input type="text" id="korName" name="userAllInfoDto.userKorName" Class="textfield" value="<s:property value='userAllInfoDto.userKorName'/>"/></td>
			</tr>
			<tr>
				<td><label id="shainnum">社員番号</label>
						<input type="text" id="shainBango" name="userAllInfoDto.userSyainBango" Class="textfield" value="<s:property value='userAllInfoDto.userSyainBango'/>"/>
					<label>最寄駅</label>
						<input type="text" id="ekki" name="userAllInfoDto.userEkki" Class="textfield" value="<s:property value='userAllInfoDto.userEkki'/>"/>
				</td>
			</tr>
			<tr>
				<td><label id="nyushaday">入社日</label><label style="color: red">*</label>
						 <input type="text" id="userNyuusyabi" name="userAllInfoDto.userNyuusyabi" value="<s:property value='userAllInfoDto.userNyuusyabi'/>" >

					<label>役職</label>

							<input type="radio" style="margin-left: 10px"
								value="1" id="userYakushoku" name="userAllInfoDto.userYakushoku" <c:if test="${userAllInfoDto.userYakushoku == 1}"> checked="checked" </c:if> />
							<label>一般</label>
							<input type="radio" style="margin-left: 10px"
								value="2" id="userYakushoku" name="userAllInfoDto.userYakushoku" <c:if test="${userAllInfoDto.userYakushoku == 2}"> checked="checked" </c:if> />
							<label>主任</label>
							<input type="radio" style="margin-left: 10px"
								value="3" id="userYakushoku" name="userAllInfoDto.userYakushoku" <c:if test="${userAllInfoDto.userYakushoku == 3}"> checked="checked" </c:if> />
							<label>課長代理</label>
							<input type="radio" style="margin-left: 10px"
								value="4" id="userYakushoku" name="userAllInfoDto.userYakushoku" <c:if test="${userAllInfoDto.userYakushoku == 4}"> checked="checked" </c:if> />
							<label>課長</label>
							<input type="radio" style="margin-left: 10px"
								value="5" id="userYakushoku" name="userAllInfoDto.userYakushoku" <c:if test="${userAllInfoDto.userYakushoku == 5}"> checked="checked" </c:if> />
							<label>次長</label>
							<input type="radio" style="margin-left: 10px"
								value="6" id="userYakushoku" name="userAllInfoDto.userYakushoku"  <c:if test="${userAllInfoDto.userYakushoku == 6}"> checked="checked" </c:if>/>
							<label>部長</label>

					</td>

			</tr>
			<tr>
				<td><label id=honshastatus>本社ステータス</label>
				<input type="radio" style="margin-left: 10px" value="1"
					   name="userAllInfoDto.userStatus"   <c:if test="${userAllInfoDto.userStatus == 1}"> checked="checked" </c:if>>
				<label>内定者</label>
				<input type="radio" style="margin-left: 10px" value="2"
					   name="userAllInfoDto.userStatus"   <c:if test="${userAllInfoDto.userStatus == 2}"> checked="checked" </c:if>>
				<label>現場</label>
				<input type="radio" style="margin-left: 10px" value="3"
					   name="userAllInfoDto.userStatus"  <c:if test="${userAllInfoDto.userStatus == 3}"> checked="checked" </c:if> >
				<label>新入</label>
				<input type="radio" style="margin-left: 10px" value="4"
					   name="userAllInfoDto.userStatus"  <c:if test="${userAllInfoDto.userStatus == 4}"> checked="checked" </c:if> >
				<label>待機</label>
				<input type="radio" style="margin-left: 10px" value="5"
					   name="userAllInfoDto.userStatus"  <c:if test="${userAllInfoDto.userStatus == 5}"> checked="checked" </c:if>>
				<label>退職</label>

					<label>キーマン</label>
						<select title="keyman" name="userAllInfoDto.userKeyman" id="userKeyman">
							<option value="0"
							<c:if test="${userAllInfoDto.userKeyman == 0}"> selected="selected" </c:if>> 一般</option>
							<option value="1"
							<c:if test="${userAllInfoDto.userKeyman == 1}"> selected="selected" </c:if> >L</option>
							<option value="2"
							<c:if test="${userAllInfoDto.userKeyman == 2}"> selected="selected" </c:if> >S</option>
							<option value="3"
							<c:if test="${userAllInfoDto.userKeyman == 3}"> selected="selected" </c:if> >SL</option>
						</select>
						</td>
			</tr>
			<tr>
				<td><label id="memo">メモ</label>
						<input type="text" Class="textfield" id="userMemo" name="userAllInfoDto.userMemo" value="<s:property value='userAllInfoDto.userMemo'/>"/></td>
			</tr>
			<tr>
				<td><label id="bikou">備考</label>
						<input type="text" Class="textfield" id="userBikou" name="userAllInfoDto.userBikou" value="<s:property value='userAllInfoDto.userBikou'/>"/></td>
			</tr>
			<tr>
				<td><label id="tantoeigyou">担当営業</label>

						<select title="tantoEigyou" id="eigyouId" name="userAllInfoDto.eigyouId" >
						<c:forEach var="eigyouDtoList" varStatus="eigyouDtoListIndex" items="${eigyouDtoList}">
							<option value="${eigyouDtoList.eigyouId}"
							<c:if test="${userAllInfoDto.eigyouId == eigyouDtoList.eigyouId}">
							selected="${userAllInfoDto.eigyouId}" </c:if>	>
							${eigyouDtoList.eigyouName}
							</option>
						</c:forEach>
						</select>

				</td>
			</tr>
			<tr>
				<td><label id="genbadate">初めて現場に入った日</label>
						<input type="text" Class="textfield" id="userHatsugenba" name="userAllInfoDto.userHatsugenba" value="<s:property value='userAllInfoDto.userHatsugenba'/>"/></td>
			</tr>
			<tr>
				<td><label id="renkeikikan">連携機関</label>
						<input type="text" name="userAllInfoDto.userRenkeikikan" id="userRenkeikikan" value="<s:property value='userAllInfoDto.userRenkeikikan'/>" Class="textfield" /></td>
			</tr>
			<tr>
				<td><label id="honshakeireki">本社経歴</label>
						<input type="text" name="userAllInfoDto.userTpsKeireki" id="userTpsKeireki" Class="textfield" value="<s:property value='userAllInfoDto.userTpsKeireki'/>"/></td>
			</tr>
			<tr>
				<td><label id="ippankeireki">本社以外経歴</label>
						<input type="text" name="userAllInfoDto.userIppanKeireki" id="userIppanKeireki" Class="textfield" value="<s:property value='userAllInfoDto.userIppanKeireki'/>"/></td>
			</tr>
			<tr>
				<td><label id="bigtitle">現場情報</label></td>
			</tr>
			<tr>
				<td><label id="genbakaishamei">現場会社名</label>
						<input type="text" name="userAllInfoDto.userGenbaKaisyamei" id="userGenbaKaisyamei" readonly="readonly" Class="textfield" value="<s:property value='genbaDetailDtoList[0].genbaKaisyamei'/>" />
						<input type="button" value="現場検索" onclick='genbaSearchInitOpen()'>
				</td>
			</tr>
			<tr>
				<td><label id="genbabashou">現場場所</label>
						<input type="text" name="userAllInfoDto.userGenbaBasyo" id="userGenbaBasyo" readonly="readonly" Class="textfield" value="<s:property value='genbaDetailDtoList[0].genbaBasyo'/>"/>
				</td>
			</tr>
			<tr>
				<td><label id="genbanyuujyoubi">現場入場日</label>
						<input type="text" name="userAllInfoDto.userGenbaNyuujyoubi" id="userGenbaNyuujyoubi" readonly="readonly" value="<s:property value='genbaDetailDtoList[0].genbaNyuujyoubi'/>" />
					<label id="genbataijyoubi">現場退場日</label>
						<input type="text" name="userAllInfoDto.userGenbaTaijyoubi" id="userGenbaTaijyoubi" readonly="readonly" value="<s:property value='genbaDetailDtoList[0].genbaTaijyoubi'/>" /></td>
			</tr>
			<tr>
				<td><label id="genbatourokubi">現場登録日</label>
						<input type="text" id="eigyouGenbaTourokubi" name="userAllInfoDto.eigyouGenbaTourokubi" readonly="readonly" value="<s:property value='genbaDetailDtoList[0].genbaTourokubi'/>"/>
					<label id="genbakikan">総期間</label>
						<input type="text" id="userGenbaKikan" name="userAllInfoDto.userGenbaKikan" readonly="readonly" Class="textfield" value="<s:property value='genbaDetailInfo.userGenbaKikan'/>" />
				</td>
			</tr>
			<tr>
				<td><label id="genbastatus">現場内ステータス</label>

						<label>一般</label>
						<input type="radio" value="1" id="userGenbaStatus" name="userAllInfoDto.userGenbaStatus" <c:if test="${genbaDetailInfo.genbaStatus == 1}"> checked="checked" </c:if> >
					 	<label>リーダー</label>
					 	<input type="radio" value="2" id="userGenbaStatus" name="userAllInfoDto.userGenbaStatus" <c:if test="${genbaDetailInfo.genbaStatus == 2}"> checked="checked" </c:if>>
						<label>サーブ</label>
					 	<input type="radio" value="3" id="userGenbaStatus" name="userAllInfoDto.userGenbaStatus" <c:if test="${genbaDetailInfo.genbaStatus == 3}"> checked="checked" </c:if>>

					<span id="userGenbaStatusList">
					</span>

					</td>

			</tr>
			<tr>
				<td><label id="userGenbahyouka">現場内の社員評価</label>
						<input type="text" Class="textfield" id="userGenbaHyouka1" name="userAllInfoDto.userGenbaHyouka" readonly="readonly" value="<s:property value='genbaDetailInfo.userGenbaHyouka'/>"/>
					<label id="genbaHyouka">現場評価</label>
						<input type="text" Class="textfield" id="genbaHyouka1" name="userAllInfoDto.genbaHyouka" readonly="readonly" value="<s:property value='genbaDetailDtoList[0].genbaHyouka'/>"/>
				</td>
			</tr>

			<tr>
				<td><label id="bigtitle">単価情報</label></td>

			</tr>

			<tr>
				<td><label id="kyuuryoulabel">給料</label>
						<input type="text" id="userKyuuryou" name="userAllInfoDto.userKyuuryou" Class="textfield" value="<s:property value='userAllInfoDto.userKyuuryou'/>"/>
					<label>単金</label>
						<input type="text" id="userTankin" name="userAllInfoDto.userTankin" Class="textfield" value="<s:property value='genbaDetailInfo.genbaTankin'/>"/></td>
			</tr>

			<tr>
				<td>
					<input type="button" value="戻る" id="goMenu">
				</td>
				<td>
					<button type="button" id="shuuseiBtn" onclick='userModify()'>修正</button>
				</td>
			</tr>
		</table>
	</div>
	</s:form>
</body>
</html>