## TOMCAT -  filter + http reverse-proxy servlet

### This repository contains the following services
- Tomcat Server + PEP (`ABAC FILTER`) + HTTP reverse-proxy servlet
- Pdp-server
- Django example web application (web1)
- Keycloak
- Ample


### Request processing flow

When a request is made on `http://localhost:8080/helloservlet/sayhello`, the filter (permit all) is activated, if permitted, the request is proxied to the django web application.

The page on `http://localhost:8080/helloservlet/sayhello` must be a `Django hello application`.

### Usage

```sh
$ docker-compose build
$ docker-compose up
```
### Useful links
[HTTP-Proxy-Servlet](https://github.com/mitre/HTTP-Proxy-Servlet)