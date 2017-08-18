Docker irker container
===================

irkerd is a specialized IRC client that runs as a daemon, allowing other programs to ship IRC notifications by sending JSON objects to a listening socket.

Usage
=====
Pull the image from the Docker hub

`docker pull ajoergensen/irkerd`

Next, run the container

`docker run --name irkerd --rm -d p 6659:6659 ajoergensen/irkerd`

Now [configure Gitlab to use the irker gateway][1]

[1]: https://docs.gitlab.com/ee/user/project/integrations/irker.html
