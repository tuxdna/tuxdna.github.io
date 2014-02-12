---
layout: page
title: "Jenkins"
description: "Jenkins"
---

{% include JB/setup %}

# Jenkins

## Jenkins Setup

[Install Jenkins](https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu)

[Configure Cobertura Plugin in Maven POM](http://mojo.codehaus.org/cobertura-maven-plugin/)

[Setup Cobertura Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Cobertura+Plugin)

[Resetting password in Jenkins](https://gist.github.com/gmhawash/4043232)

    [INFO] ------------------------------------------------------------------------
    [ERROR] BUILD ERROR
    [INFO] ------------------------------------------------------------------------
    [INFO] Error building POM (may not be this project's POM).
    Project ID: org.apache.maven.doxia:doxia-book-maven-plugin
    Reason: POM 'org.apache.maven.doxia:doxia-book-maven-plugin' not found in repository: Unable to download the artifact from any repository
      org.apache.maven.doxia:doxia-book-maven-plugin:pom:1.3-SNAPSHOT
    from the specified remote repositories:
      central (http://repo1.maven.org/maven2)
     for project org.apache.maven.doxia:doxia-book-maven-plugin

    [INFO] ------------------------------------------------------------------------
    [INFO] For more information, run Maven with the -e switch
    [INFO] ------------------------------------------------------------------------
    [INFO] Total time: < 1 second

[Add remote Maven repository](http://www.mkyong.com/maven/how-to-add-remote-repository-in-maven-pom-xml/)

Setup a local Maven repository:

[Enable hosted directory using smylinks on Nginx](http://nginx.org/en/docs/http/ngx_http_core_module.html#disable_symlinks)
