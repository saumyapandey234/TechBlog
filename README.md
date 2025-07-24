# TechBlog
Description:- TechBlog is a dynamic and interactive web application developed using Servlet, JSP, AJAX, jQuery, and JavaScript. It includes a complete user authentication system (login, signup, logout), a like feature for user-posted content, and Facebook comment plugin integration to enable real-time discussions and engagement on individual blog posts.
##Features

- User Signup and Login
- Create, Edit, and Delete Blog Posts
- Like and Comment on Posts
- View Posts by Other Users
- Facebook Comments Plugin Integration
- Category-based Blog Posting (e.g. Education, Sports, Entertainment)

## | Layer        | Technology         |
|--------------|--------------------|
| Frontend     | HTML,CSS,JSP,JS    |
| Backend      | Java Servlets      |
| Database     | MySQL              |
| Server       | Apache Tomcat 9.0      |
| Plugin       | Facebook Comments  |

## Screenshots

![Screenshot_24-7-2025_19392_localhost](https://github.com/user-attachments/assets/a1619b3a-32d2-4224-bce9-8a48b0ffee2a)

## Setup Instructions
1. **Clone the Repository**
   ```bash
   git clone https://github.com/saumyapandey456 /TechBlog.git

## Import into NetBeans / Eclipse
Open your IDE.
Import project as a Maven/Java Web Project (if applicable).

## Set up MySQL Database
Create a database named anything you want.
Import the techblog.sql file from the db folder (if provided).
Update database connection details in DBConnection.java:
java
Copy
Edit
String url = "jdbc:mysql://localhost:3306/techblog";
String username = "root";
String password = "your_password";
## Deploy on Tomcat Server
Export the project as a WAR file or run directly using IDE.
Make sure Apache Tomcat is configured properly.
Visit
Open your browser and navigate to:
Copy
Edit
http://localhost:8080/TechBlog/
## Developer: Saumya Pandey
Email: saumya1617pandey@example.com
GitHub: @saumyapandey456

##🤝 Contribution
Pull requests are welcome! Feel free to fork the repository, improve functionality, or suggest new features.

