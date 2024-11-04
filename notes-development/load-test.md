---
sitemap:
  lastmod: 2024-08-28 +0000
---

# Load Test

Last modified: 2024-08-28 +0000

## JMeter

```bash
jmeter -Lorg.apache.jmeter.protocol.http.control=DEBUG
jmeter -Lorg.apache.http=DEBUG
jmeter -LDEBUG
```

*References*:

- [Apache JMeter - User's Manual: Remote (Distributed) Testing](http://svn.apache.org/repos/asf/jmeter/tags/v5_1_1/docs/usermanual/remote-test.html):
  > (called bin/create-rmi-keystore.sh). It will generate a key-pair, that is valid for seven days, with a default passphrase of value 'changeit'. It is advised to call it from inside the bin directory.
- [Apache JMeter - User's Manual: Generating Dashboard Report](https://jmeter.apache.org/usermanual/generating-dashboard.html)
- [Run JMeter .jmx File From the Command Line and Configure the Report File \| Baeldung](https://www.baeldung.com/java-jmeter-command-line)
- [textHow to Configure JMeter Logging \| Blazemeter by Perforce](https://www.blazemeter.com/blog/jmeter-logging)
- [真的理解Jmeter线程数、Ramp-Up、循环次数真的理解？_ramp up time-CSDN博客](https://blog.csdn.net/u013908944/article/details/97383303)
- [性能测试学习之路（四）—Jmeter之线程组详解_concurrency thread group-CSDN博客](https://blog.csdn.net/qq_22007469/article/details/138791101)
- [Jmeter系列（11）- 并发线程组Concurrency Thread Group详解-CSDN博客](https://blog.csdn.net/u011441473/article/details/124818366)
- [Active vs Started vs Finished](https://groups.google.com/g/ptgram24/c/ku7ZVUkBZiA)
