<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <style>
        body {
            font-family: Arial, sans-serif;
        }
		footer {
            background-color: #E6E6FA;
            color:#4B0082;
            padding: 25x 10px 25px 20px;
            position: relative;
            margin-top: auto;
            width:100%;
            border-radius:3px;
            box-shadow:10px 10px 12px grey; 
        }
        .footer-container {
            display: flex;
            justify-content: space-around;
            max-width: 1200px;
            margin: 0 auto;
            text-align: left;
        }

        .footer-title, .footer-about, .footer-contact {
            flex: 1;
            margin: 0 20px;
        }

        /* .footer-title h2, .footer-about h3, .footer-contact h3 {
            color: #4B0082;
        } */

        .footer-about p, .footer-contact p {
            margin: 10px 0;
            line-height: 1.6;
        }

        .footer-contact i {
            margin-right: 10px;
        }

        .footer-container div:hover {
            transform: translateY(-5px);
            transition: all 0.3s ease;
        }

        .footer-container div {
            transition: all 0.3s ease;
        }

    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    
<footer>
    <div class="footer-container">
        <div  class="footer-title">
      	<h2 style="margin-top:55px">Service Management <br> System</h2>
        </div>
        <div class="footer-about">
            <h3>About Us</h3>
            <p>We offer streamlined management for a variety of services to ensure top-notch customer satisfaction.</p>
        </div>
        <div class="footer-contact">
            <h3>Contact Information</h3>
            <p><i class="fas fa-map-marker-alt"></i> 1234 Street Name, City, State, ZIP</p>
            <p><i class="fas fa-phone"></i> (123) 456-7890</p>
            <p><i class="fas fa-envelope"></i> example@example.com</p>
        </div>
    </div>
</footer>
    
</body>
</html>