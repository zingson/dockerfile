# !/bin/bash

if [ "$1" == "/bin/bash" ]
then
  /bin/bash
  exit
fi

boot=""
for args in $@
do
    boot=$boot$args
done

# RUN
JAR_RUN="java -jar eureka.jar $boot"
echo ">>$JAR_RUN"
$JAR_RUN
