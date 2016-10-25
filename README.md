bmproxy
==========================
| CRAN version       | Travis build status   | Coverage |
| :-------------: |:-------------:|:-------------:|
| [![](http://www.r-pkg.org/badges/version/bmproxy)](https://CRAN.R-project.org/package=bmproxy) | [![Build Status](https://travis-ci.org/johndharrison/bmproxy.svg?branch=master)](https://travis-ci.org/johndharrison/bmproxy) | [![codecov](https://codecov.io/gh/johndharrison/bmproxy/branch/master/graph/badge.svg)](https://codecov.io/gh/johndharrison/bmproxy)|

##### *R client for the BrowserMob Proxy REST API*

### Introduction

BrowserMob Proxy allows you to manipulate HTTP requests and responses, 
capture HTTP content, and export performance data as a HAR file. 

### Install

To install the current developement version of `bmproxy` run:

```
devtools::install_github("johndharrison/seleniumPipes")
```

### Getting started

#### Run a BrowserMob Proxy server

One easy way to run a BMP server is to use a Docker image and run a 
container. 

Firstly stop and rm any containers you may have running/stopped:

```
docker stop $(docker ps -q)
docker rm $(docker ps -aq)

```

Now you can start a Browser Mob proxy:

```
docker run -d -p 9090:9090 -p 39500-39999:39500-39999 --name bmp qautomatron/docker-browsermob-proxy

```

This maps port 9090 on the container to port 9090 on the host. The BMP
server listens on port 9090 and proxies can be created on ports 
39500-39999. 
See https://hub.docker.com/r/qautomatron/docker-browsermob-proxy/ for more 
details.

#### Creating a proxy
Once a BMP server is running creating a proxy is as simple as:

```
library(bmproxy)
prxy <- proxy(bmpPort = 9090L, port = 39500L)
prxy %>% closeProxy

```
See examples for more details.

### Using with Selenium

Firstly stop and rm any containers you may have running/stopped:

```
docker stop $(docker ps -q)
docker rm $(docker ps -aq)

```

Again start a Browser Mob proxy:

```
docker run -d -p 9090:9090 -p 39500-39999:39500-39999 --name bmp qautomatron/docker-browsermob-proxy

```

Run a Selenium container and link it to the BMP container.
```
docker run -d -p 4445:4444 -p 5901:5900 --link=bmp selenium/standalone-chrome-debug:2.53.1

```

From the host machine the BMP server is available on localhost as we have 
envoked `-p 9090:9090` mapping the BMP container port 9090 to the host 
port 9090. 

On the Selenium container however the BMP server is reached at 
`bmp:9090`. We could conmtinue to call the BMP server at localhost and
use `bmp:9090` for the Selenium container:

```
selP <- sel_proxy(prxy, browser = "chrome", bmpIPaddress = "bmp")

```

Alternative we can get the ipaddress of the BMP server:

```
$ docker inspect --format '{{ .NetworkSettings.IPAddress }}' bmp
 172.17.0.2

```
We can use this container ipaddress for our proxy:

```
library(bmproxy)
library(seleniumPipes)

prxy <- proxy(ipAddress = "172.17.0.1", bmpPort = 9090L, port = 39500L)
selP <- sel_proxy(prxy, browser = "chrome", bmpIPaddress = "bmp")
remDr <- remoteDr(browserName = "chrome", port = 4445L, 
                  extraCapabilities = selP)
prxy %>% createHAR("first_page")
remDr %>% 
  go("http://www.google.com/ncr") %>% 
  findElement("name", "q") %>% 
  elementSendKeys("r-project", key = "enter")
  
myHAR <- prxy %>% getHAR
prxy %>% closeProxy
remDr %>% deleteSession
```

