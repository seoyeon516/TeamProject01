
<%@ include file="/WEB-INF/include/jquery_ui.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社員一覧</title>
<style type="text/css">
.tooltipUI {
	display: inline-block;
}

.ui-tooltip {
	padding: 10px;
	max-width: 600px;
	background: #ffffff;
	opacity: 1;
	display: inline-block;
	position: absolute;
	top: -70px;
}

body .ui-tooltip {
	display: inline-block;
	background-color: ffffff;
}
</style>
</head>
<script type="text/javascript">

$(function() {
    $('.userGenbaStatus').tooltip({
      tooltipClass:'tooltipUI',
      content: function(callback) {
        callback($(this).prop('title'));
      }
    });
  });
function goModify(userId){
	 location.href = "userModifyInit?userAllInfoDto.userId="+userId;
}
function goMenu(){
	var data = confirm("入力項目は削除されます。よろしいですか。");
	if(data == true){
		location.href="goMenu";
	}else{
		return;
	}
}
function formCheck(form){

	if(form.keyWord.value.match(/^[\u30a1-\u30f6가-힣]+$/) || form.keyWord.value == ""){

	}else{

		alert("入力値を確認してください。"+"\n"+
				"検索命令語は「韓国語」と「カタカナ」です。");
		form.keyWord.focus();
		return false;
	}
}
</script>
<body>
	<br />
	<br />
	<br />

		<div align="center">
			<h1>社員一覧</h1>
			<div>
				<div id="center">
					<s:form action="/userListSearch" method="get" onSubmit="return formCheck(this)">
                  		<select name="userStatus" id="userStatus">
							<option value="0" selected>全て</option>
							<option value="1">内定者</option>
							<option value="2">現場社員</option>
							<option value="3">新人</option>
							<option value="4">待機</option>
							<option value="5">退職</option>
						</select>
						<input type="text" name="keyWord" id="keyWord" size="50" maxlength="12"/>
						<input type="submit" value="検索"/>
					</s:form>

				</div>
				<br />
				<table align="center" width="70%" border="1">
					<tr>
						<td>NO.</td>
						<td>カナ名前</td>
						<td>韓国名前</td>
						<td>役職</td>
						<td>本社ステータス</td>
						<td>担当営業名前</td>
						<td>入社日</td>
						<td>最寄駅</td>
						<td>現場場所</td>
						<td>現場入場日</td>
						<td>現場内ステータス</td>
						<c:if test="${sessionScope.user_kubun == 0}">
						<td>単金</td>
						<td>給与</td>
						</c:if>
						<td>詳細</td>
					</tr>

					<s:iterator value="userDetailList" status="st">
						<tr>
							<td><s:property value="userDetailList[#st.index].id"/></td>
							<td class="userKanaName">
							<s:property value="userDetailList[#st.index].userKanaName"/></td>
							<td class="userKorName">
							<s:property value="userDetailList[#st.index].userKorName" /></td>
							<td class="userYakushoku">
							<s:if test="userDetailList[#st.index].userYakushoku == 1">一般</s:if>
							<s:elseif test="userDetailList[#st.index].userYakushoku == 2">主任</s:elseif>
							<s:elseif test="userDetailList[#st.index].userYakushoku == 3">課長代理</s:elseif>
							<s:elseif test="userDetailList[#st.index].userYakushoku == 4">課長</s:elseif>
							<s:elseif test="userDetailList[#st.index].userYakushoku == 5">次長</s:elseif>
							<s:elseif test="userDetailList[#st.index].userYakushoku == 6">部長</s:elseif>
						</td>
							<td class="userStatus">
								<s:if test="userDetailList[#st.index].userStatus == 1">内定者</s:if>
								<s:elseif test="userDetailList[#st.index].userStatus == 2">現場</s:elseif>
								<s:elseif test="userDetailList[#st.index].userStatus == 3">新入</s:elseif>
								<s:elseif test="userDetailList[#st.index].userStatus == 4">待機</s:elseif>
								<s:elseif test="userDetailList[#st.index].userStatus == 5">退職</s:elseif>
							</td>
							<td class="eigyouName"><s:property value="userDetailList[#st.index].eigyouName"/></td>
							<td class="userNyuusyabi"><s:property value="userDetailList[#st.index].userNyuusyabi.substring(2, 8)"/></td>
							<td class="userEkki"><s:property value="userDetailList[#st.index].userEkki"/></td>
							<td class="userGenbaBasyo"><s:property value="userDetailList[#st.index].userGenbaBasyo"/></td>
							<td class="userGenbaNyuujyoubi"><s:property value="userDetailList[#st.index].userGenbaNyuujyoubi.substring(2, 8)"/></td>
							<td class="userGenbaStatus"
								title="<s:property value="userDetailList[#st.index].userBikou"/><br>
										<s:property value="userDetailList[#st.index].userGenbaHyouka"/>">
								<s:if test="userDetailList[#st.index].userGenbaStatus == 1">一般</s:if>
								<s:elseif test="userDetailList[#st.index].userGenbaStatus == 2">リーダ</s:elseif>
								<s:elseif test="userDetailList[#st.index].userGenbaStatus == 3">サブ</s:elseif>
						<c:if test="${sessionScope.user_kubun == 0 }">
							<td class="userGenbaTaikin"><s:property value="userDetailList[#st.index].userGenbaTaikin"/></td>
							<td class="kyuuyocost"><s:property value="userDetailList[#st.index].kyuuyocost"/></td>

						</c:if>

							<td>
								<input type="button" onclick="userModifyInit('
									<s:property value='userDetailList[#st.index].id'/>')" value="詳細">
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>

	<table align="center">
		<tr>
			<td height="150">
			<input type="button" value="戻る" onClick="goMenu()"/>
			</td>
		</tr>
	</table>

</body>
</html>