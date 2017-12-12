<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>订单管理页面</span>
       </div>
       <div class="search">
       <form method="post" action="${pageContext.request.contextPath }/bill/billlist.html" id="billlist">
			<span>商品名称：</span>
			<input name="queryProductName" type="text" value="${queryProductName }">
			<span>供应商：</span>
			<input type="hidden" id="pid" value="${proId }"/>
			<select name="queryProviderId" id="queryProviderId">
				<option value="0" selected="selected">--请选择--</option>
       		</select>
			<span>是否付款：</span>
			<input type="hidden" id="isPay" value="${isPay }"/>
			<select name="queryIsPayment">
				<option value="0">--请选择--</option>
				<option value="1" ${queryIsPayment == 1 ? "selected=\"selected\"":"" }>未付款</option>
				<option value="2" ${queryIsPayment == 2 ? "selected=\"selected\"":"" }>已付款</option>
       		</select>
			 <input type="hidden" name="pageIndex" value="1"/>
			 <input	value="查 询" type="submit" id="searchbutton">
			 <a href="/ch102/action/addbill.html">添加订单</a>
		</form>
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="10%">订单编码</th>
              <th width="20%">商品名称</th>
              <th width="10%">供应商</th>
              <th width="10%">订单金额</th>
              <th width="10%">是否付款</th>
              <th width="10%">创建时间</th>
              <th width="30%">操作</th>
          </tr>
          <c:forEach var="bill" items="${requestScope.billList}" varStatus="status">
				<tr>
					<td>
					<span>${bill.billCode }</span>
					</td>
					<td>
					<span>${bill.productName }</span>
					</td>
					<td>
					<span>${bill.provider.proName}</span>
					</td>
					<td>
					<span>${bill.totalPrice}</span>
					</td>
					<td>
					<span>
						<c:if test="${bill.isPayment == 1}">未付款</c:if>
						<c:if test="${bill.isPayment == 2}">已付款</c:if>
					</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${bill.creattionDate }" pattern="yyyy-MM-dd"/>
					</span>
					</td>
					<td>
					<span><a class="viewBill" href="${pageContext.request.contextPath }/bill/viewbill.html/${bill.id }/3305" billid=${bill.id } billcc=${bill.billCode }><img src="${pageContext.request.contextPath }/statics/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyBill" href="${pageContext.request.contextPath }/bill/updatebill.html/${bill.id }/3304" billid=${bill.id } billcc=${bill.billCode }><img src="${pageContext.request.contextPath }/statics/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteBill" href="${pageContext.request.contextPath }/bill/deletebill.html/${bill.id }" billid=${bill.id } billcc=${bill.billCode }><img src="${pageContext.request.contextPath }/statics/images/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
			</c:forEach>
      </table>
 			<input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
		  	<c:import url="rollpage.jsp">
	          	<c:param name="totalCount" value="${totalCount}" />
	          	<c:param name="currentPageNo" value="${currentPageNo}" />
	          	<c:param name="totalPageCount" value="${totalPageCount}" />
          	</c:import>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/billlist.js"></script>