<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // DB 연결 설정
    String dbUrl = "jdbc:mysql://localhost:3306/yourDatabase";
    String dbUser = "yourUsername";
    String dbPassword = "yourPassword";

    // 클라이언트에서 전달받은 아이디 값
    String userId = request.getParameter("userId");

    // DB 연결 및 쿼리 실행
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // DB 연결
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // 아이디 중복 확인 쿼리
        String sql = "SELECT COUNT(*) FROM users WHERE user_id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, userId);
        rs = stmt.executeQuery();

        // 결과 처리
        if (rs.next() && rs.getInt(1) > 0) {
            out.print("중복된 아이디입니다.");
        } else {
            out.print("사용 가능한 아이디입니다.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("서버 오류");
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
