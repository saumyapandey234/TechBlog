<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page errorPage="error_page.jsp"%>

<%
    User user = (User)session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                background:url(img/HD-wallpaper-simple-dark-plain-background-color.jpg);
                background-size:cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>



        <!--        //navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-binoculars">Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-bolt">Techie<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-check-circle">Contact us</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk">Post</a>
                    </li>






                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                            <span class="fa fa-book">Categories
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Hollywood</a>
                        <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Bollywood</a>
                            <a class="dropdown-item" href="#">Politics</a>
                            <a class="dropdown-item" href="#">Games&Sports</a>
                            <a class="dropdown-item" href="#">Popstar</a>
                            <a class="dropdown-item" href="#">R&D</a>
                            <a class="dropdown-item" href="#">Geography</a>
                            <a class="dropdown-item" href="#">Singing&Dancing</a>
                            <a class="dropdown-item" href="#">Mechanical Engineering</a>
                            
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">More</a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-Modal"><span class="fa fa-user-plus"><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout"><span class="fa fa-user-plus">Logout</a>
                    </li>

                </ul>
            </div>
        </nav>

        <!--        end of navbar-->


        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%=m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>

        <%
                session.removeAttribute("msg");
            }
        %>



        <!--main body of pg-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPost(0, this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPost(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                            <%

                                }


                            %>
                        </div>
                    </div>


                    <!--second col-->

                    <div class="col-md-8" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container"></div>
                    </div>

                </div>
            </div>

        </main>


        <!--end of main body of pg-->


        <!--Start Profile modal-->



        <!-- Modal -->
        <div class="modal fade" id="profile-Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Techical vlogging</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--//details-->
                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Email: </th>
                                            <td><%= user.getEmail()%></</td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About:</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Registered on: </th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>


                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!--Profile edit-->
                        <div id="profile-edit" style="display:none;">
                            <h3 class="mt-2">Please Edit Carefully</h3>
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID:</td>
                                        <td><%= user.getId()%></td>
                                    </tr>

                                    <tr>
                                        <td>Email:</td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"</td>
                                    </tr>

                                    <tr>
                                        <td>Name:</td>
                                        <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"</td>
                                    </tr>

                                    <tr>
                                        <td>Password:</td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"</td>
                                    </tr>
                                    <tr>
                                        <td>About:</td>
                                        <td>
                                            <textarea row="5" class="form-control" name="user_about">
                                                <%= user.getAbout()%>
                                            </textarea>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Select new profile pic:</td>
                                        <td>
                                            <input type="file" name="image" class="form-control"></input>
                                        </td>
                                    </tr>

                                </table>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>

                            </form>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>



        <!--            End of profile modal-->

        <!--        Post Modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Post Details...</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method='post'>


                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select category---</option>
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {


                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getDescription()%></option>
<!--                                <option><%= c.getDescription()%></option>-->

                                    <%
                                        }
                                    %>
                                </select>

                            </div>


                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post title" class="form-control">
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height":300px></textarea>
                            </div>

                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Enter your program if any" style="height":300px></textarea>
                            </div>

                            <div class="form-group">
                                <label>Select your pic</label>
                                <br>
                                <input name="pic" type="file">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>                                
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end post modal-->

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"</script>
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function () {
//                       alert("button-clicked");
                                        if (editStatus == false) {
                                            $("#profile-details").hide();
                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else {
                                            $("#profile-details").show();
                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit");
                                        }

                                    });
                                });
        </script>

        <!--        now add post js-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
//                    this code executed when form is submitted
                    event.preventDefault();
                    console.log("you have started your server");
                    let form = new FormData(this);
//                            now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, errorThrown) {
                            // success
                            console.log(data);
                            if (data.trim() === 'done') {
                                swal("Good job!", "saved successfully", "success");
                            } else {
                                swal("Error!", "Something went wrong try again", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "Something went wrong ", "error");

                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>


        <!--loading posts using ajax-->
        <script>
            function getPost(catId,temp){
                $("#loader").show();
                $("#post-container").hide();
                
                $(".c-link").removeClass('active');
                $.ajax({
                    url: "load_posts.jsp",
                    data:{cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                });
                
            }
            $(document).ready(function (e) {
                let allPostRef=$('.c-link')[0];
                getPost(0,allPostRef);
                
            });


        </script>

    </body>
</html>
