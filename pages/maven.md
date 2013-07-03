---
layout: page
title: "Apache Maven"
description: "Notes on Apache Maven"
---

{% include JB/setup %}


# Maven

## Generate a project using Maven

    mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app
    cd my-app/
    mvn compile
    mvn test
    mvn test-compile
    mvn package
    mvn install
    mvn site
    

## Configure Eclipse with Maven

    mvn -Declipse.workspace=/home/sansari/workspace/ eclipse:add-maven-repo
    mvn eclipse:eclipse -DdownloadSources=false -DdownloadJavadocs=false
    mvn eclipse:clean
    mvn eclipse:eclipse
    
## Generate JavaDoc

[Maven JavaDoc plugin](http://maven.apache.org/plugins/maven-javadoc-plugin/)

Invoke:
 
    mvn javadoc:javadoc 

## Generate PDF Documentation


Maven APT documentation 

 * [APT Format](http://maven.apache.org/doxia/references/apt-format.html)
 * [Add images into APT](http://maven.apache.org/doxia/references/doxia-apt.html#Figure_extensions)
 * [Maven Veolcity templating](http://velocity.apache.org/site/tools/velocity-site-doxia-renderer/index.html)

Refer to [Maven PDF plugin](http://maven.apache.org/plugins/maven-pdf-plugin/usage.html)

[Generating PDF documentation](http://maven.apache.org/plugins/maven-pdf-plugin/)

    mvn pdf:pdf         

## Generate Site Documentation

Maven Site Directory [structure](http://www.sonatype.com/books/mvnref-book/reference/site-generation-sect-dir-struct.html)

    mvn site:site
    
## Skip Tests while building site
    
    mvn -DskipTests=true -Ddependency.locations.enabled=false  site:site

## Add local dependency:

Install a local library to mvn repo:

    mvn install:install-file -Dfile=lib/abcd-4.1.0.jar -DgroupId=com.abcd.java -DartifactId=abcd -Dversion=4.1.0 -Dpackaging=jar

Add a local dependency to maven configration [here](http://www.mkyong.com/maven/how-to-include-library-manully-into-maven-local-repository/)



## Execute a Java Class from Maven

Consider that you want to execute a class named org.tuxdna.App which takes an argument:

    mvn exec:java -Dexec.mainClass=org.tuxdna.App -Dexec.args="arg1"
    

This will generate the regular Maven output. To supress that, and only see the class output, add -q option:

    mvn -q exec:java -Dexec.mainClass=org.tuxdna.App -Dexec.args="arg1"

