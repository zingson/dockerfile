

curl --unix-socket /var/run/docker.sock -H "Content-Type: application/x-tar" --data-binary @/opt/dockerfile/java/boot3/boot3.tar -X POST http://v1.37/build?t=build:1.1
