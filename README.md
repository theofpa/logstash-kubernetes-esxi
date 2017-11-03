A kubernetes service for a logstash container to collect the ESXi logs and forward them to Elasticsearch

Build the container
===

```
theofpa@dnepr:~/Developer/logstash-kubernetes-esxi$ docker build .
...
Successfully built 745674ad48f2
theofpa@dnepr:~/Developer/logstash-kubernetes-esxi$ docker tag 745 theofpa/logstash-kubernetes-esxi
theofpa@dnepr:~/Developer/logstash-kubernetes-esxi$ docker push theofpa/logstash-kubernetes-esxi
```

Deploy the service
===

```
theofpa@dnepr:~/Developer/logstash-kubernetes-esxi$ kubectl apply -f logstash.yml 
```

The configuration uses the NodePort to expose the service. A haproxy ingress can be used instead.

Configure ESXi syslog
===

```
[root@esxi3:~] esxcli system syslog config set --loghost='tcp://syslog.int.pydata.nl:31031'
[root@esxi3:~] esxcli system syslog reload
```
