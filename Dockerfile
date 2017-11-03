FROM logstash

COPY logstash.conf /logstash/

EXPOSE 1514

CMD ["-f", "/logstash/logstash.conf"]
