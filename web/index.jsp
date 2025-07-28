<%-- 
    Document   : index
    Created on : Jun 26, 2025, 8:41:29 PM
    Author     : hp
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--        css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 30%, 99% 100%, 74% 95%, 28% 95%, 0 99%, 0% 30%);
            }

            body{
                background:url(img/HD-wallpaper-simple-dark-plain-background-color.jpg);
                background-size:cover;
                background-attachment: fixed;
            }
        </style>

    </head>
    <body>

        <!--        navbar-->
        <%@include file="normal_navbar.jsp"%>

        <!--        banner-->

        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3 class="display-3">
                        Welcome to Tech Blog
                    </h3>

                    <p>Dive into a world of stories shared by passionate users. From the latest in politics, games, sports, Bollywood, and Hollywood, explore trending topics, voice your thoughts, and connect with a like-minded community. Share your interests, spark conversations, and be part of something exciting every day.
                        This is your personal space to write, read, and connect through ideas. From tech trends and cultural shifts to personal experiences and creative expressions, it’s where diverse voices meet. Explore meaningful content, share unique perspectives, and become part of a growing community that values originality, knowledge, and open conversation.</p>

                    <button class="btn-outline-ligth btn-lg"><span class="fa fa-user">Start its Free</button>
                    <a href="login_page.jsp" class="btn-outline-ligth btn-lg"><span class="fa fa-user-circle-o">Login</a>



                </div>
            </div>


        </div>

        <!--cards-->
        <br>
        <div class="container">

            <div class="row mb-4">

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Bollywood</h5>
                            <p class="card-text">Bollywood is a vibrant world of storytelling, music, and emotion that captures the heart of India. From the glitz of award shows to the depth of meaningful cinema, Bollywood inspires millions. On TechBlog, explore film reviews, actor journeys, behind-the-scenes insights, and trending gossip. Whether it’s analyzing dialogues, celebrating legendary actors, or discussing fan theories, our Bollywood section is a space where cinema lovers unite. Share your own opinions, fan edits, or movie experiences. Whether you're a Shah Rukh fan or love indie films, there's something here for every Bollywood buff.</p>
                            <a href="#" class="btn btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Hollywood</h5>
                            <p class="card-text">Step into the realm of Hollywood, where global cinema meets innovation and creativity. TechBlog brings you everything from blockbuster analyses to deep dives into award-winning films. Explore the latest from Marvel, DC, and other franchises. Review Netflix thrillers, HBO dramas, and cult classics. Learn about VFX, cinematography, and the people behind the magic. Whether you're into actor spotlights, red carpet style, or controversial endings, this section fuels your Hollywood obsession. Share your thoughts, predictions, or critiques—and become a part of global cinematic conversations.

                            </p>
                            <a href="#" class="btn btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Games</h5>
                            <p class="card-text">For gaming enthusiasts, TechBlog is your playground. Stay updated with the latest releases in PC, mobile, and console gaming. From in-depth reviews and strategy guides to game mechanics and esports coverage, we cover it all. Dive into nostalgic retro games or the latest open-world adventures. Share your personal gaming highlights, glitches, or competitive streaks. Whether you’re a casual player or a pro-level streamer, this space is for you. Discuss game development, character arcs, soundtracks, and everything that makes gaming an unforgettable experience.</p>
                            <a href="#" class="btn btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>


            </div>


            <div class="row">

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Research & Innovation</h5>
                            <p class="card-text">TechBlog is also a platform for knowledge seekers and curious minds. Our research section explores the latest in science, technology, and innovation. Break down complex discoveries, summarize research papers, and highlight projects changing the world. From artificial intelligence and medicine to environmental sustainability, we focus on impactful innovation. Engage with ethical questions, student research, and historical breakthroughs. Share your own insights or learn from others’ work. It’s a place where creativity meets logic, and where ideas spark meaningful conversations.</p>
                            <a href="#" class="btn btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Geography</h5>
                            <p class="card-text">Geography is more than maps and mountains—it's the story of our planet and how we live on it. On TechBlog, dive into discussions on natural landscapes, climate change, and global ecosystems. Explore fascinating topics like volcanoes, rivers, deserts, and oceans, or understand the science behind weather patterns and natural disasters. Learn how geography shapes human culture, trade routes, migration patterns, and geopolitical relations. From the icy poles to tropical rainforests, there’s a world to explore through words. Analyze urban development, population studies, and sustainability. Understand how rising sea levels and deforestation affect our planet. Discuss the geography of conflict zones, border disputes, and resource distribution. Whether you're a student, traveler, or environmentalist, geography here becomes an exciting lens to see the world.</p>
                            <a href="#" class="btn btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">History</h5>
                            <p class="card-text">History is our connection to the past—how civilizations rose, cultures evolved, and ideas changed the world. On TechBlog, delve into the fascinating tales of ancient empires, revolutions, and movements that shaped today’s society. Explore the lives of great leaders, freedom fighters, philosophers, and unsung heroes. Uncover the causes and impacts of world wars, independence struggles, and cultural renaissances. Learn about forgotten dynasties, trade networks, and historical inventions that changed human progress. Examine how art, literature, and religion influenced societies over time. Engage with historical debates, timelines, and archaeological discoveries. From the Indus Valley and Roman Empire to World War II and modern revolutions, our history section brings the past alive. Share insights, raise questions, and connect the dots between history and the present world.</p>
                            <a href="#" class="btn btn primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        
        
        




        <!--        Javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
//            $(document).ready(function(){
//                alert("document loaded");
//            });


        </script>
    </body>
</html>
