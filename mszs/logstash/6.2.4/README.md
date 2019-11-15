# logstash 6.2.4




输出到ES示例：
```
docker run --name logstash.sc1 --network cluster --ip 10.18.254.10 -p 5044:5044   --restart always  -d  zingsono/logstash:6.2.4 logstash  -e  '
input { 
    stdin { }
    tcp { port => 5044 }
 }  
output {
    elasticsearch {
        hosts => ["elastic.sc0:9200","elastic.sc1:9200","elastic.sc2:9200"]
        index => "logs-logback-%{+yyyy.MM.dd}"
        template_overwrite => true
    }
}
'

```