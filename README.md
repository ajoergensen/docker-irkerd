Docker irker container
===================

irkerd is a specialized IRC client that runs as a daemon, allowing other programs to ship IRC notifications by sending JSON objects to a listening socket.

### Usage

`docker run --name irkerd --rm -d -p 6659:6659 ajoergensen/irkerd`

Now [configure Gitlab to use the irker gateway][1]

[1]: https://docs.gitlab.com/ee/user/project/integrations/irker.html

#### Environment

- `LISTEN_ADDR`: IP address for irkerd to listen on. Defaults to 0.0.0.0 - Only relevant if container is running with `--net host`
- `LOG_LEVEL`: Sets the log level of irkerd; possible values are `critical`, `error`, `warning`, `info`, `debug`. Defaults to info.

#### Logging

Debug and traffic logging is done to stdout and can be viewed using ```docker logs -f irkerd```
