---
sitemap:
  lastmod: 2024-04-29 +0000
---

# Java

Last modified: 2024-04-29 +0000

- [Interesting posts](#interesting-posts)
- [Java distributions](#java-distributions)
- [Java version manager](#java-version-manager)
- [JAR manipulations](#jar-manipulations)
- [Jetty](#jetty)
- [Apache](#apache)
- [VSCode](#vscode)

## Interesting posts

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

## Java distributions

*References*:

- [JDK Distributions - SDKMAN! the Software Development Kit Manager](https://sdkman.io/jdks)

## Java version manager

- [jabba (unmaintained)](https://github.com/Jabba-Team/jabba)
  - [active fork](https://github.com/shyiko/jabba/issues/845)
- [jenv](https://github.com/jenv/jenv)
- [SDKMAN! CLI](https://github.com/sdkman/sdkman-cli)
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

## VSCode

*References*:

- [The Oracle Java Platform Extension for Visual Studio Code \| Hacker News](https://news.ycombinator.com/item?id=37929311)
- [Introducing the Oracle Java Platform Extension for Visual Studio Code : java](https://www.reddit.com/r/java/comments/17ar11h/introducing_the_oracle_java_platform_extension/)
