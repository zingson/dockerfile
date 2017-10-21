

sudo docker run --name nginx -p 81:80 -v /apps/nginx/html:/usr/share/nginx/html --privileged=true -d nginx:1.12.1-alpine



