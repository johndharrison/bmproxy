# bmproxy certificates

The certificates in this directory are sourced from:
https://github.com/lightbody/browsermob-proxy/tree/master/browsermob-core/src/main/resources

By default, BrowserMob Proxy will use the ca-keystore-rsa.p12 file to load 
its CA Root Certificate and Private Key. The corresponding certificate 
file is ca-certificate-rsa.cer, which can be installed as a trusted 
Certification Authority in browsers or other HTTP clients to avoid HTTPS 
warnings when using BrowserMob Proxy.

When using bmproxy with a browser or R packages such as httr the 
ca-certificate-rsa.cer file will need to be referenced.

For further detail see:
https://github.com/lightbody/browsermob-proxy/blob/master/mitm/README.md
