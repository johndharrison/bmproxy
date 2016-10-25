bmproxy
==========================
| CRAN version       | Travis build status   | Coverage |
| :-------------: |:-------------:|:-------------:|
| [![](http://www.r-pkg.org/badges/version/bmproxy)](https://CRAN.R-project.org/package=bmproxy) | [![Build Status](https://travis-ci.org/johndharrison/bmproxy.svg?branch=master)](https://travis-ci.org/johndharrison/bmproxy) | [![codecov](https://codecov.io/gh/johndharrison/bmproxy/branch/master/graph/badge.svg)](https://codecov.io/gh/johndharrison/bmproxy)|

##### *R client for the BrowserMob Proxy REST API*

### Introduction

BrowserMob Proxy allows you to manipulate HTTP requests and responses, capture HTTP content, and export performance data as a HAR file. 

### Install

To install the current developement version of `bmproxy` run:

```
devtools::install_github("johndharrison/seleniumPipes")
```

### Getting started

#### Run a BrowserMob Proxy server

One easy way to run a BMP server is to use a Docker image and run a 
container. 

```
docker run -d -p 9090:9090 -p 39500-39999:39500-39999 --name bmp qautomatron/docker-browsermob-proxy

```

This maps port 9090 on the container to port 9090 on the host. The BMP
server listend on port 9090 and proxies can be created on ports 
39500-39999. See https://hub.docker.com/r/qautomatron/docker-browsermob-proxy/ for more details.

#### Creating a proxy
Once a BMP server is running creating a proxy is as simple as:

```
prxy <- proxy(bmpPort = 9090L, port = 39500L)

```
See examples for more details.
