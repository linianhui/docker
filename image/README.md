# Best Practices

## EXPOSE

> The EXPOSE instruction indicates the ports on which a container listens for connections. Consequently, you should use the common, traditional port for your application. For example, an image containing the Apache web server would use EXPOSE 80, while an image containing MongoDB would use EXPOSE 27017 and so on.

> For external access, your users can execute docker run with a flag indicating how to map the specified port to the port of their choice. For container linking, Docker provides environment variables for the path from the recipient container back to the source (ie, MYSQL_PORT_3306_TCP).

Refenence : <https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#expose>

## Blog

<https://linianhui.github.io/docker/best-practice/>
 
