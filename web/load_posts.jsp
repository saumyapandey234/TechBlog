<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<div class="row">

    <%

        User uuu = (User) session.getAttribute("currentUser");
        Thread.sleep(1000);

        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No post in this category</h3>");
            return;
        }

        for (Post p : posts) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getPostpic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%= p.getPtitle()%></b>
                <p><%= p.getPcontent()%></p>
<!--            <pre><%= p.getPcode()%></pre>-->
            </div>

            <div class="card-footer bg-dark text-center">

                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>
                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-primary btn-small"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></i></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary btn-small">Read More...</a>

                <a href="#!" class="btn btn-outline-primary btn-small"><i class="fa fa-commenting-o"><span>20</span></i></a>
            </div>
        </div>
    </div>


    <%
        }
    %>
</div>