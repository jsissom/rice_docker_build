# Rice Docker Image

## Using the image

* The rice application needs to know its own host name so it can do redirects.  The host name it uses is riceweb.  You will need to have that host name in your /etc/hosts file also.  This image also allows you to mount the logs folder on the local machine so you can view them if needed.  This image also requires that you mount a config folder on the local machine and that
folder has your rice-config.xml file.

        Make a folder for the logs.  In this example, it will be /home/jsissom/logs
        Make a folder for the config file.  In this example, it will be /home/jsissom/config
        docker run --name riceweb -p 8081:8081 --hostname=riceweb --add-host="kfsweb:IPAddress" --add-host="mysql_kfs:IPAddress" -v /Users/jsissom/config:/config -v /home/jsissom/logs:/logs -d jsissom/riceweb
        Note: Replace IPAddress with the IP address of your local system that is seen by docker

> This command runs the jsissom/riceweb image and gives the container the name riceweb.  It forwards port 8081 to your local machine.  This is the port used for the rice web application.  The riceweb name is put into the containers host file.  There will be a link between this container and the mysql container so the web container has access to the database container.  The directory /home/jsissom/logs on the local machine will be mapped to /logs in the container.

> When this starts up, it will take a few minutes for the web application to deploy.  You can view the catalina.date.out file to monitor the status.  When tomcat is up, you can go to http://riceweb:8081/kr-dev/ to get to the application.

## Pausing the container

* To pause the container, run the following command:

        docker stop riceweb

* To restart the container, run the following command:

        docker start riceweb

***

The instructions below are how to build this image.

# Copy the rice war file into the rice folder and name it kr-dev.war.
# Building the riceweb image

        docker build -t "jsissom/riceweb" .

        docker tag  jsissom/riceweb jsissom/riceweb:{rice version}
        docker tag jsissom/riceweb jsissom/riceweb:latest

# Login to docker hub

        docker login

# Put the image up there

        docker push jsissom/riceweb

