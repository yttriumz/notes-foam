---
sitemap:
  lastmod: 2024-12-23 +0000
---

# Java

Last modified: 2024-12-23 +0000

- [Interesting posts](#interesting-posts)
- [Java distributions](#java-distributions)
- [Java version manager](#java-version-manager)
- [JAR manipulations](#jar-manipulations)
- [Jetty](#jetty)
- [Spring Boot](#spring-boot)
- [Apache](#apache)
- [Time format](#time-format)

## Interesting posts

- [JVM vs. JRE vs. JDK: What's the Difference? - IBM Blog](https://www.ibm.com/blog/jvm-vs-jre-vs-jdk/)
- [成为一个更好的Java程序员](https://github.com/crisxuan/bestJavaer)
- [互联网 Java 工程师进阶知识完全扫盲](https://github.com/doocs/advanced-java)
- [史上最简单的 IntelliJ IDEA 教程](https://github.com/guobinhit/intellij-idea-tutorial)
- [Stepping in 2024 with Powerful Java Language Features – Inside.java](https://inside.java/2024/01/16/wrapup-java-lang-features/)
- [java - What are the -Xms and -Xmx parameters when starting JVM? - Stack Overflow](https://stackoverflow.com/questions/14763079/what-are-the-xms-and-xmx-parameters-when-starting-jvm)
- [java - Why does the JVM consume less memory than -Xms specified? - Stack Overflow](https://stackoverflow.com/questions/12108706/why-does-the-jvm-consume-less-memory-than-xms-specified)
- [How can I find Java heap size and memory used (Linux)? - Stack Overflow](https://stackoverflow.com/questions/12797560/how-can-i-find-java-heap-size-and-memory-used-linux)
- [Check/Monitor the JAVA HEAP SPACE of a JAVA process](https://knowledge.informatica.com/s/article/588051?language=en_US)
- [How to find Java Heap Size and Memory Used (Linux)?](https://www.w3docs.com/snippets/java/how-to-find-java-heap-size-and-memory-used-linux.html)
- [Find out your Java heap memory size - Mkyong.com](https://mkyong.com/java/find-out-your-java-heap-memory-size/)
- [How the JVM uses and allocates memory \| Red Hat Developer](https://developers.redhat.com/articles/2021/09/09/how-jvm-uses-and-allocates-memory)
- [Wardrobe strength: JVMs and kill signals](http://journal.thobe.org/2013/02/jvms-and-kill-signals.html)

Tooling:

- [The Oracle Java Platform Extension for Visual Studio Code \| Hacker News](https://news.ycombinator.com/item?id=37929311)
- [Introducing the Oracle Java Platform Extension for Visual Studio Code : java](https://www.reddit.com/r/java/comments/17ar11h/introducing_the_oracle_java_platform_extension/)

## Java distributions

*References*:

- [Which Java JDK Should You Use? • 2024 • Incus Data Programming Courses](https://incusdata.com/blog/which-java-jdk-should-you-use)
- [JDK Distributions - SDKMAN! the Software Development Kit Manager](https://sdkman.io/jdks)

## Java version manager

- [sdkman/sdkman-cli: The SDKMAN! Command Line Interface](https://github.com/sdkman/sdkman-cli)
- [jenv/jenv: Manage your Java environment](https://github.com/jenv/jenv)
- [Jabba-Team/jabba: (cross-platform) Java Version Manager](https://github.com/Jabba-Team/jabba) (unmaintained)
  - [Use updated fork · Issue #845 · shyiko/jabba](https://github.com/shyiko/jabba/issues/845)
- Coursier

*References*:

- [SDKMAN vs JENV](https://gist.github.com/tfield/55064fc0c3f80fa67f624874f0b8d55e)
- [開發者如何管理不同JDK版本. 開發者在開發中如何管理不同JDK版本 \| by Milo Chen \| Medium](https://milochen.medium.com/%E9%96%8B%E7%99%BC%E8%80%85%E5%A6%82%E4%BD%95%E7%AE%A1%E7%90%86%E4%B8%8D%E5%90%8Cjdk%E7%89%88%E6%9C%AC-602a942b0c55)
- [Shall I use Homebrew or SDKMAN to install older versions of Java (e.g. Java 8 or 11)? : r/java](https://www.reddit.com/r/java/comments/hmc133/shall_i_use_homebrew_or_sdkman_to_install_older/)
- [Coursier: How to install multiple Java JDK/JVMs \| alvinalexander.com](https://alvinalexander.com/scala/coursier-how-install-multiple-java-jdks-jvms/)

## JAR manipulations

- Add files to a JAR file with manifest:

  ```bash
  jar --create --verbose --manifest=META-INF/MANIFEST.MF --file JAR_FILE FILES_TO_ADD
  ```

- List the content of a JAR file:

  ```bash
  jar tf JAR_FILE
  ```

- Extract the content of a JAR file:

  ```bash
  # use `jar`
  jar xf JAR_FILE
  jar xf JAR_FILE PATH/TO/A_FILE/IN/JAR
  # use `unzip`
  unzip JAR_FILE -d ./EXTRACTED
  ```

- Update a JAR file:

  ```bash
  jar uf JAR_FILE PATH/TO/A_FILE/IN/JAR
  ```

*References*:

- [Creating a JAR File (The Java™ Tutorials > Deployment > Packaging Programs in JAR Files)](https://docs.oracle.com/javase/tutorial/deployment/jar/build.html)
- [Viewing the Contents of a JAR File (The Java™ Tutorials > Deployment > Packaging Programs in JAR Files)](https://docs.oracle.com/javase/tutorial/deployment/jar/view.html)
- [Extracting the Contents of a JAR File (The Java™ Tutorials > Deployment > Packaging Programs in JAR Files)](https://docs.oracle.com/javase/tutorial/deployment/jar/unpack.html)
- [Updating a JAR File (The Java™ Tutorials > Deployment > Packaging Programs in JAR Files)](https://docs.oracle.com/javase/tutorial/deployment/jar/update.html)
- [java - Can't execute jar- file: "no main manifest attribute" - Stack Overflow](https://stackoverflow.com/questions/9689793/cant-execute-jar-file-no-main-manifest-attribute)

## Jetty

*References*:

- [Jetty not reading keystorepass and keymanagerpass from ssl.mod file · Issue #5990 · jetty/jetty.project](https://github.com/jetty/jetty.project/issues/5990)
- [Eclipse Jetty: Operations Guide](https://eclipse.dev/jetty/documentation/jetty-10/operations-guide/index.html#og-protocols-ssl-customize)
- [Eclipse Jetty: Programming Guide](https://eclipse.dev/jetty/documentation/jetty-10/programming-guide/index.html#pg-server-session-handler)

## Spring Boot

*References*:

- [Configuring spring boot application from tomcat to jetty - Stack Overflow](https://stackoverflow.com/questions/68767087/configuring-spring-boot-application-from-tomcat-to-jetty)

## Apache

*References*:

- [Difference between the Apache HTTP Server and Apache Tomcat? - Stack Overflow](https://stackoverflow.com/questions/30632/difference-between-the-apache-http-server-and-apache-tomcat)
- [Configuration Files - Apache HTTP Server Version 2.4](https://httpd.apache.org/docs/2.4/configuring.html)
- [Apache Web Server Difference Between Include vs IncludeOptional Directives – CodingShower](https://codingshower.com/apache-web-server-include-vs-includeoptional/)
- [mod_headers - Apache HTTP Server Version 2.4](https://httpd.apache.org/docs/2.4/mod/mod_headers.html#header)
- [How to Set Samesite Cookies in Apache Web Server - Fedingo](https://fedingo.com/how-to-set-samesite-cookies-in-apache-web-server/)
- [SameSite cookies with Apache](https://www.petefreitag.com/blog/samesite-cookies-apache/)
- [http headers - How to set SameSite cookie attribute using Apache configuration? - Stack Overflow](https://stackoverflow.com/questions/54104573/how-to-set-samesite-cookie-attribute-using-apache-configuration)
- [apache 2.4 - Header always edit Set-Cookie not working - Server Fault](https://serverfault.com/questions/1043924/header-always-edit-set-cookie-not-working)

## Time format

*References*:

- [date - How to get the current time in YYYY-MM-DD HH:MI:Sec.Millisecond format in Java? - Stack Overflow](https://stackoverflow.com/questions/1459656/how-to-get-the-current-time-in-yyyy-mm-dd-hhmisec-millisecond-format-in-java)
- [date - How to get ISO format from time in milliseconds in Java? - Stack Overflow](https://stackoverflow.com/questions/11933137/how-to-get-iso-format-from-time-in-milliseconds-in-java)
- [java - How Do I Convert System.currentTimeMillis To Time Format? (HH:MM:SS) - Stack Overflow](https://stackoverflow.com/questions/56007124/how-do-i-convert-system-currenttimemillis-to-time-format-hhmmss)
- [time - How to convert Milliseconds to "X mins, x seconds" in Java? - Stack Overflow](https://stackoverflow.com/questions/625433/how-to-convert-milliseconds-to-x-mins-x-seconds-in-java)
- [How to convert currentTimeMillis to a date in Java? - Stack Overflow](https://stackoverflow.com/questions/8237193/how-to-convert-currenttimemillis-to-a-date-in-java)
