### Tests for bmproxy

The tests are run assumming a BrowserMob proxy server is running on port 
9090 and accepts proxies on: Proxy Port Range: 39500-39999. 

To facilitate TRAVIS testing we run a BMP server via a Docker container:

```
docker run -d -p 9090:9090 -p 39500-39999:39500-39999 --name bmp qautomatron/docker-browsermob-proxy
```
see https://hub.docker.com/r/qautomatron/docker-browsermob-proxy/ for more
details.