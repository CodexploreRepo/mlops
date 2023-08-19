# Nginx

## What is Nginx

- Nginx is a popular open-source **web server** software which serves its clients web pages.
  - A web server which serves the web pages to its clients as per the need and requirement.
  - Nginx is compatible with multiple operating systems, including Linux, Windows, and macOS, and it is commonly used alongside other web technologies such as PHP, Python, and Ruby on Rails.

## Why Nginx ?

- **High performance**: Nginx is known for its high performance and low resource usage.
- **Scalability**: Nginx can be easily scaled horizontally by adding more servers to handle increased traffic. It also supports load balancing, which distributes traffic evenly across multiple servers.
- **Flexibility**: Nginx has a modular architecture, which means that it can be easily extended and customized with various modules to suit different needs.
- **Security**: Nginx has built-in security features such as SSL/TLS encryption and support for secure communication protocols. It also has the ability to block malicious traffic and prevent common attacks such as DDoS attacks.
- **Ease of use**: Nginx is relatively easy to set up and configure compared to other web server software.

## Architecture of Nginx

- Nginx architecture consists of a master process and multiple child processes i.e. worker processes.
  - These multiple child processes helps in managing the load on the server by distributing the traffic towards multiple worker processes.
  - Suppose if you have a website running on a particular port and many people tried to access the same then at a point the website will crash because it will not be able to take the load.
  - To overcome this if you served the website through Nginx server then the server will distribute the load in it’s multiple child processed and hence there won’t be any crash and the website will work smoothly.
