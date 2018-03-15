# Docker image for an Inspircd IRC server, using SSL

A Docker image for an Inspircd IRC server using both SSL and unencrypted (open port for non-ssl if you wish). Build using Dockerfile and ensure you edit the passwords for Admin and Oper in the .conf file before deploying live.

docker run -p 7001:7001 -d --name irc milobahg/irc:latest

Add -p 6667:6667 if you want non-SSL also.
