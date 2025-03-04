# NetLab
NetLab | Mastering Secure Server Management

![network-map](https://github.com/user-attachments/assets/d2d718a0-a5a9-42da-a104-32b005f906d4)

This project demonstrates networking, security, and web programming skills by creating a web application that communicates between two Ubuntu servers in a VirtualBox environment. The application consists of a front-end dashboard for monitoring server health and logs, as well as a back-end database that stores user information.

## Project Overview

    Server 1 (Web Server): Apache2 hosting a login page and a dashboard.
        IPs: 10.0.0.2 - 192.168.0.2
        This server communicates with Server 2 to retrieve user data and health status.
        Active UFW (Firewall) for security.

    Server 2 (DB Server): MySQL server storing user credentials and roles.
        IP: 10.0.0.3
        Contains a users table with columns: username, password, role.
        Active UFW for security.

The web application allows an admin user to manage other user accounts from the dashboard. The dashboard displays a list of users and the health status of both servers.

## Features

    Login Page: Users log in with a username and password to access the dashboard.
    Dashboard: Displays:
        A list of users from Server 2's users table.
        Server health status and logs from both servers.
        Admin users can block other users from the dashboard.
    Database Interaction: Secure communication between the web server and database server.
    Security:
        UFW configured on both servers to restrict access.
        MySQL database secured with proper permissions.

## Technologies Used

    Frontend: HTML, CSS, JavaScript
    Backend: PHP (for handling the login and server communication)
    Web Server: Apache2
    Database Server: MySQL
    Operating Systems: Ubuntu Server
    Security: UFW, MySQL Permissions, Secure Socket Communication

## Security Considerations

    Both servers use UFW to block unauthorized traffic.
    MySQL is configured to only allow connections from Server 1.
    The login page implements basic security measures to prevent brute force attacks (e.g., limiting login attempts).
