

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Role and Topic Info Explorer</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.tailwindcss.com"></script>

        <script>
            const roleDetails = {
                "Frontend Developer": {
                    description: "Builds and maintains the user interface and user experience of web applications.",
                    responsibilities: [
                        "Develop responsive UI with modern frameworks.",
                        "Ensure cross-browser compatibility.",
                        "Collaborate with designers."
                    ],
                    techstack: ["HTML", "CSS", "JavaScript", "React.js", "Tailwind CSS"]
                },
                "Backend Developer": {
                    description: "Handles server-side logic, database interactions, and APIs.",
                    responsibilities: [
                        "Design and build RESTful APIs.",
                        "Integrate databases and authentication.",
                        "Maintain server security."
                    ],
                    techstack: ["Java", "Spring Boot", "Node.js", "Express.js", "MySQL", "MongoDB"]
                },
                "Full Stack Developer": {
                    description: "Works on both client-side and server-side of applications.",
                    responsibilities: [
                        "Develop full web applications.",
                        "Integrate frontend and backend.",
                        "Handle deployment and testing."
                    ],
                    techstack: ["React", "Node.js", "MongoDB", "Docker", "Git"]
                },
                "Data Scientist": {
                    description: "Analyzes data to extract insights and build predictive models.",
                    responsibilities: [
                        "Collect and preprocess data.",
                        "Build ML models.",
                        "Visualize and communicate findings."
                    ],
                    techstack: ["Python", "Pandas", "Scikit-learn", "Jupyter", "TensorFlow"]
                }
            };

            const topics = {
                "Bollywood": {
                    description: "India's Hindi-language film industry known for music, dance, and drama.",
                    facts: [
                        "Largest film-producing industry in the world.",
                        "Famous actors: Shah Rukh Khan, Deepika Padukone.",
                        "Popular for romantic and musical genres."
                    ],
                    icons: ["🎬", "💃", "🎤"]
                },
                "Hollywood": {
                    description: "Global center of entertainment and blockbuster movies based in Los Angeles.",
                    facts: [
                        "Home to Oscars and studios like Universal and Warner Bros.",
                        "Famous actors: Tom Cruise, Angelina Jolie.",
                        "Known for action, drama, and sci-fi."
                    ],
                    icons: ["🎥", "🏆", "🌟"]
                },
                "Politics": {
                    description: "The science and practice of governance and public affairs.",
                    facts: [
                        "Includes governments, laws, elections, and leaders.",
                        "Famous leaders: Joe Biden, Narendra Modi.",
                        "Systems: Democracy, Republic, Monarchy."
                    ],
                    icons: ["🏛️", "📜", "🗳️"]
                },
                "Geography": {
                    description: "Study of Earth's landscapes, peoples, and environments.",
                    facts: [
                        "Divided into human and physical geography.",
                        "Includes continents, climates, landforms.",
                        "Maps and globes are tools used."
                    ],
                    icons: ["🌍", "🗺️", "🏔️"]
                },
                "Pop Culture": {
                    description: "Modern popular culture transmitted via mass media and social media.",
                    facts: [
                        "Trends, memes, fashion, and music.",
                        "Icons: Taylor Swift, BTS, YouTube stars.",
                        "Reflects youth and mainstream society."
                    ],
                    icons: ["🎵", "🎤", "📱"]
                },
                "NFL": {
                    description: "The premier professional American football league in the U.S.",
                    facts: [
                        "32 teams, Super Bowl is the biggest event.",
                        "Players: Tom Brady, Mahomes.",
                        "Popular teams: Patriots, Cowboys."
                    ],
                    icons: ["🏈", "🔥", "🎯"]
                },
                "Games and Sports": {
                    description: "Covers video games and physical sports played globally.",
                    facts: [
                        "Popular sports: Cricket, Football, Tennis.",
                        "Top games: PUBG, FIFA, Call of Duty.",
                        "Olympics & eSports are global events."
                    ],
                    icons: ["🎮", "⚽", "🏅"]
                }
            };

            function showRoleDetails() {
                const role = document.getElementById("role").value;
                const data = roleDetails[role];

                document.getElementById("desc-role").textContent = data.description;

                const respList = document.getElementById("resp-role");
                respList.innerHTML = "";
                data.responsibilities.forEach(item => {
                    const li = document.createElement("li");
                    li.textContent = item;
                    respList.appendChild(li);
                });

                const techList = document.getElementById("tech-role");
                techList.innerHTML = "";
                data.techstack.forEach(tech => {
                    const span = document.createElement("span");
                    span.className = "bg-blue-100 text-blue-700 px-2 py-1 rounded-full text-sm mr-2 mb-2 inline-block";
                    span.textContent = tech;
                    techList.appendChild(span);
                });
            }

            function showTopicDetails() {
                const topic = document.getElementById("topic").value;
                const data = topics[topic];

                document.getElementById("desc-topic").textContent = data.description;

                const factsList = document.getElementById("facts-topic");
                factsList.innerHTML = "";
                data.facts.forEach(fact => {
                    const li = document.createElement("li");
                    li.textContent = fact;
                    factsList.appendChild(li);
                });

                const iconsList = document.getElementById("icons-topic");
                iconsList.innerHTML = "";
                data.icons.forEach(icon => {
                    const span = document.createElement("span");
                    span.className = "text-3xl mr-3";
                    span.textContent = icon;
                    iconsList.appendChild(span);
                });
            }
        </script>
        <style>
            body{
                background:url(img/HD-wallpaper-simple-dark-plain-background-color.jpg);
                background-size:cover;
                background-attachment: fixed;

            }

            .container {
                max-width: 900px;
                margin: auto;
                display: flex;
                flex-direction: column;
                gap: 40px;
            }

            .card {
                background: #fff;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                padding: 30px;
            }

            h2 {
                font-size: 26px;
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            label {
                font-weight: 600;
                display: block;
                margin-bottom: 8px;
            }

            select {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 6px;
                margin-bottom: 20px;
            }

            .section {
                margin-bottom: 20px;
            }

            .section h3 {
                font-size: 18px;
                margin-bottom: 6px;
                color: #444;
            }

            .section p {
                color: #555;
                line-height: 1.6;
            }

            ul {
                padding-left: 20px;
                color: #555;
            }

            .badge {
                display: inline-block;
                background-color: #e0f0ff;
                color: #0077cc;
                padding: 6px 12px;
                border-radius: 20px;
                font-size: 14px;
                margin: 4px 4px 4px 0;
            }

            .icons span {
                font-size: 24px;
                margin-right: 10px;
            }

        </style>

    </head>
    <%@include  file="normal_navbar.jsp" %>
    <body class="bg-gray-100 p-6 font-sans">

        <div class="max-w-4xl mx-auto space-y-12">

            <!-- Role Section -->

            <div class="bg-white p-6 rounded-xl shadow-md">
                <h2 class="text-2xl font-bold mb-4 text-center">Role-Based Tech Stack Viewer</h2>

                <label for="role" class="block mb-2 font-semibold">Select a Role:</label>
                <select id="role" onchange="showRoleDetails()" class="w-full p-2 border rounded mb-4">
                    <option disabled selected value>-- Choose a Role --</option>
                    <option>Frontend Developer</option>
                    <option>Backend Developer</option>
                    <option>Full Stack Developer</option>
                    <option>Data Scientist</option>
                </select>

                <div class="mb-4">
                    <h3 class="text-lg font-semibold">Role Description:</h3>
                    <p id="desc-role" class="text-gray-700 mt-1"></p>
                </div>

                <div class="mb-4">
                    <h3 class="text-lg font-semibold">Responsibilities:</h3>
                    <ul id="resp-role" class="list-disc list-inside text-gray-700"></ul>
                </div>

                <div class="mb-4">
                    <h3 class="text-lg font-semibold">Tech Stack:</h3>
                    <div id="tech-role" class="flex flex-wrap"></div>
                </div>
            </div>


            <!-- Topic Section -->
            <div class="bg-white p-6 rounded-xl shadow-md">
                <h2 class="text-2xl font-bold mb-4 text-center">🌐 Explore Topics</h2>

                <label for="topic" class="block mb-2 font-semibold">Select a Topic:</label>
                <select id="topic" onchange="showTopicDetails()" class="w-full p-2 border rounded mb-4">
                    <option disabled selected value>-- Choose a Topic --</option>
                    <option>Bollywood</option>
                    <option>Hollywood</option>
                    <option>Politics</option>
                    <option>Geography</option>
                    <option>Pop Culture</option>
                    <option>NFL</option>
                    <option>Games and Sports</option>
                </select>

                <div class="mb-4">
                    <h3 class="text-lg font-semibold">Description:</h3>
                    <p id="desc-topic" class="text-gray-700 mt-1"></p>
                </div>

                <div class="mb-4">
                    <h3 class="text-lg font-semibold">Key Facts:</h3>
                    <ul id="facts-topic" class="list-disc list-inside text-gray-700"></ul>
                </div>

                <div class="mb-4">
                    <h3 class="text-lg font-semibold">Icons:</h3>
                    <div id="icons-topic" class="flex flex-wrap text-gray-700"></div>
                </div>
            </div>

        </div>

    </body>
</html>
