# Service-Management-System

Overview
The Service Management System is a web application designed to manage and register services through a user-friendly interface. The project employs Java technologies, including Servlets, JSP (JavaServer Pages), and JDBC (Java Database Connectivity), to handle user data and service registrations.

Features
User Registration: Users can register by providing personal details. Passwords are securely encrypted before being stored in the database.
Service Registration: Users can register various services on the website.
Secure Authentication: The system ensures that user passwords and cookies are securely encrypted to protect user data.
Technologies Used
Servlets: Java Servlet technology is used for handling server-side logic and processing HTTP requests and responses.
JSP (JavaServer Pages): JSP is used for generating dynamic web pages and user interfaces.
JDBC (Java Database Connectivity): JDBC is used for connecting to and interacting with the database.
MD5 Digest: Used for encrypting passwords before storing them in the database.
Caesar Cipher: An encryption technique used to enhance security.
Cookie Encryption: Cookies are encrypted to prevent unauthorized access to user data.
Setup and Installation
Prerequisites
Java Development Kit (JDK)
Apache Tomcat (or any other servlet container)
A MySQL or compatible database
Configuration
Database Setup:

Create a database with the necessary tables to store user data and service information.
Use the provided SQL scripts to set up the database schema and sample data.
Configuration File:

Update the database.properties file with your database connection details, including URL, username, and password.
Deploy the Application:

Compile the Java files and deploy the WAR (Web Application Archive) file to your servlet container (e.g., Apache Tomcat).
Running the Application
Start the servlet container (e.g., Tomcat).
Access the application through your web browser at http://localhost:8080/ServiceManagementSystem.
Security Features
Password Encryption:

Passwords are encrypted using MD5 digest and Caesar Cipher algorithms before being stored in the database.
This ensures that user passwords are not stored in plain text.
Cookie Encryption:

Cookies are encrypted to prevent unauthorized access and protect user session data from potential security threats.
Usage
Registering Users:

Navigate to the registration page and enter the required details.
Ensure that the password meets the specified criteria for encryption.
Registering Services:

After logging in, navigate to the service registration page.
Provide the necessary details to register a new service.
Viewing and Managing Services:

Users can view and manage their registered services through the user dashboard.
Development
To contribute to the project or make modifications, follow these steps:

Clone the repository.
Make your changes or add new features.
Test your changes locally.
Submit a pull request with a description of the modifications.
License
This project is licensed under the MIT License.

Contact
For any questions or support, please contact me.
