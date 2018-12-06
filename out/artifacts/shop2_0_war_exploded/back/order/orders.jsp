<%@page contentType="text/html; charset=gbk" pageEncoding="gbk" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk" />

<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="description" content="description of your site" />
<meta name="author" content="author of the site" />
<title>����ƽ̨��̨��ҳ</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" href="css/styles.css" />
<link rel="stylesheet" href="css/toastr.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.knob.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/toastr.js"></script>
<script src="js/jquery.tablesorter.min.js"></script>
<script src="js/jquery.peity.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="js/gcal.js"></script>
<script src="js/setup.js"></script>
</head>
<body>

	<%@include file="../header.jsp"%>
	<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h4 class="header">�����б�</h4>
						<table class="table table-striped sortable">
							<thead>
								<tr>
									<th>����ID</th>
									<th>�û�ID</th>
									<th>�ͻ���ַ</th>
									<th>����ʱ��</th>
									<th>����״̬</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="so" items="${paging.objects }">
									<tr>
										<td>${so.id }</td>
										<td>${so.user.id }</td>
										<td>${so.user.addr }</td>
										<td>${so.odate }</td>
										<td><c:if test="${so.status ==1 }"><span class="label label-success">�Ѹ���</span></c:if>
											<c:if test="${so.status ==0 }"><span class="label label-warning">δ����</span></c:if>
														</td>
										<td>
											<div class="btn-group">
												<button class="btn">����</button>
												<button data-toggle="dropdown" class="btn dropdown-toggle">
													<span class="caret"></span>
												</button>
												<ul class="dropdown-menu">
													<li><a href="#detail" data-toggle="modal">�鿴����</a>
														<%--<a
														href="load.order?id=${so.id }">�޸�</a> <a href="#"
														onclick="del(${so.id })">ɾ��</a> --%><%-- <a href="delete.user?id=${u.id }">ɾ��</a> --%>
														<script type="text/javascript">
															function del(id) {
																if(confirm("ȷ��Ҫɾ����")){
																	window.location.href="delete.order?id=" + id;
																}
															}
														</script></li>
												</ul>
											</div>
										</td>
									</tr>
									<div id="detail" class="modal hide fade">
										<div class="modal-header">
											<button type="button" data-dismiss="modal" aria-hidden="true"
													class="close">&times;
											</button>
											<h3>��������</h3>
										</div>
										<div class="modal-body">
											<c:forEach items="${so.cart.cItems }" var="ci">
												<div class="control-group">
													<label for="inputEmail" class="control-label">��Ʒ��</label>
													<div class="controls">
														<input style="height: 20px" readonly="readonly" id="inputEmail" type="text" name="username"
															   value="${ci.product.name}"/>
													</div>
												</div>
												<div class="control-group">
													<label for="inputCurrentPassword" class="control-label">��Ʒ����
													</label>
													<div class="controls">
														<input style="height: 20px" id="inputCurrentPassword" type="text" readonly="readonly" name="pwd"
															   value="${ci.qty}" />
													</div>
												</div>

											</c:forEach>

										</div>
									</div>
								</c:forEach>
							</tbody>
						</table>
						<form action="list.order" method="post">
						<div class="pagination pagination-centered">
							<ul>
								<li class="active"><a>��${paging.pageNumber }ҳ</a></li>
								<li><a href="list.order?pageNumber=1">��ҳ</a></li>
								<li><a href="list.order?pageNumber=${paging.pageNumber - 1}">��һҳ</a></li>
								<li><a href="list.order?pageNumber=${paging.pageNumber + 1}">��һҳ</a></li>
								<li><a href="list.order?pageNumber=${paging.pages }">βҳ</a></li>
								<li class="active"><a>��${paging.pages }ҳ</a></li>
								<li><span style="display:flex;height: 20px;line-height: 20px;border-color: transparent;">����<input style="align-items: center;height: 10px;width: 23px" type="text" name="pageNumber" oninput="value=value.replace(/[^\d]/g,'')">ҳ<input style="align-items: center;height: 20px;line-height: 16px;" type="submit" value="ȷ��"></span></li>
							</ul>
						</div>
						</form>
					</div>
				</div>
			</div>



	</div>
	<!-- footer -->
	<%@include file="../footer.jsp"%>
</body>
<script src="js/d3-setup.js"></script>
<script>
	protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
	address = protocol + window.location.host + window.location.pathname
			+ '/ws';
	socket = new WebSocket(address);
	socket.onmessage = function(msg) {
		msg.data == 'reload' && window.location.reload()
	}
</script>
</html>