/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.86
 * Generated at: 2024-03-08 07:37:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.simpleguest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class insertForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap\"\r\n");
      out.write("	rel=\"stylesheet\">\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\"\r\n");
      out.write("	rel=\"stylesheet\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.7.0.js\"></script>\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("th{\r\n");
      out.write("font-family:Black Han Sans;\r\n");
      out.write("font-size: 20px; \r\n");
      out.write("font-weight: lighter;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div style=\"margin: 50px 100px;\">\r\n");
      out.write("	<form action=\"insertAction.jsp\" method=\"post\">\r\n");
      out.write("		<table class=\"table table-bordered\" style=\"width: 570px;\">\r\n");
      out.write("			<caption align=\"top\" style=\"font-family: Black Han Sans; font-size: 25pt; color: black;\">간단 방명록</caption>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th width=\"100\" class=\"table-dark\" valign=\"middle\" style=\"text-align: center;\">닉네임</th>\r\n");
      out.write("				<td>\r\n");
      out.write("					<input type=\"text\" name=\"nickname\" required=\"required\"\r\n");
      out.write("					class=\"form-control\" style=\"width: 140px\">\r\n");
      out.write("				</td>\r\n");
      out.write("				<th width=\"100\" class=\"table-dark\" valign=\"middle\"  style=\"text-align: center;\">비밀번호</th>\r\n");
      out.write("				<td>\r\n");
      out.write("					<input type=\"password\" name=\"pass\" required=\"required\"\r\n");
      out.write("					class=\"form-control\" style=\"width: 150px\">\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th width=\"100\" class=\"table-dark\"  valign=\"middle\"  style=\"text-align: center;\">아바타</th>\r\n");
      out.write("				<td colspan=\"4\">\r\n");
      out.write("					");

						for(int i=1;i<=10;i++){
							
      out.write("\r\n");
      out.write("							<input type=\"radio\" value=\"");
      out.print(i);
      out.write("\"\r\n");
      out.write("							");
      out.print(i==3?"checked":"" );
      out.write(" style=\"width: 40px;\"\r\n");
      out.write("							name=\"image\"> \r\n");
      out.write("							");

						}
					
      out.write("\r\n");
      out.write("					<br>\r\n");
      out.write("					");

					for(int i=1;i<=10;i++){
						
      out.write("\r\n");
      out.write("						<img src=\"../image/avata/b");
      out.print(i);
      out.write(".png\" style=\"width: 40px;\">\r\n");
      out.write("						");

					}
					
      out.write("\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td colspan=\"4\">\r\n");
      out.write("					<textarea style=\"width: 550px; height: 100px;\" name=\"content\"\r\n");
      out.write("					class=\"form-dark\"></textarea>\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td colspan=\"4\" align=\"center\">\r\n");
      out.write("					<input type=\"submit\" value=\"저장\" class=\"btn btn-outline-success\" style=\"width: 100px;\">\r\n");
      out.write("					<input type=\"button\" value=\"방명록\" onclick=\"location.href='guestList.jsp'\"\r\n");
      out.write("					class=\"btn btn-outline-dark\" style=\"width: 100px;\">\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			\r\n");
      out.write("		</table>\r\n");
      out.write("	</form>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
