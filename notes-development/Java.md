# Java

Last modified: 2023/12/07 19:03:21

- [Interesting posts](#interesting-posts)
- [Java version manager](#java-version-manager)
- [JAR manipulations](#jar-manipulations)

## Interesting posts

- [成为一个更好的Java程序员](https://github.com/crisxuan/bestJavaer)
- [互联网 Java 工程师进阶知识完全扫盲](https://github.com/doocs/advanced-java)
- [史上最简单的 IntelliJ IDEA 教程](https://github.com/guobinhit/intellij-idea-tutorial)
- [The Oracle Java Platform Extension for Visual Studio Code | Hacker News](https://news.ycombinator.com/item?id=37929311)
- [Introducing the Oracle Java Platform Extension for Visual Studio Code : java](https://www.reddit.com/r/java/comments/17ar11h/introducing_the_oracle_java_platform_extension/)

## Java version manager

- [jabba (unmaintained)](https://github.com/Jabba-Team/jabba)
  - [active fork](https://github.com/shyiko/jabba/issues/845)
- [jenv](https://github.com/jenv/jenv)
- [SDKMAN! CLI](https://github.com/sdkman/sdkman-cli)
- [Coursier: How to install multiple Java JDK/JVMs | alvinalexander.com](https://alvinalexander.com/scala/coursier-how-install-multiple-java-jdks-jvms/)

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
