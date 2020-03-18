<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>メニュー</title>
<%@ include file="/WEB-INF/include/jquery_ui.jsp"%>

</head>
<body>
	<br />
	<br />
	<h1 align="center">メニュー</h1>
	<br />
	<br />
	<div align="center">
		<table align="center" border="0">
			<tr>
				<c:if test="${sessionScope.user_kubun == 0 }">
					<s:form action="user_AddPage" method="get">
						<td width="150" align="center"><input class="box"
							type="submit" value="社員登録"></td>
					</s:form>
				</c:if>

				<s:form action="userDetailListView" method="get">
					<td width="150" align="center"><input class="box"
						type="submit" value="社員一覧"></td>
				</s:form>

				<s:form action="eigyouListView" method="get">
					<td width="150" align="center"><input class="box"
						type="submit" value="営業状況一覧"></td>
				</s:form>

				<s:form action="taisyokuPage" method="get">
					<td width="150" align="center"><input class="box"
						type="submit" value="退職登録"></td>
				</s:form>


			</tr>

		</table>
	</div>
</body>
</html>