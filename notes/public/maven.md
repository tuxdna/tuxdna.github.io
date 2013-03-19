# Maven

Generate a project using Maven

    mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app
    cd my-app/
    mvn compile
    mvn test
    mvn test-compile
    mvn package
    mvn install
    mvn site
    
Configure Eclipse with Maven

    mvn -Declipse.workspace=/home/sansari/workspace/ eclipse:add-maven-repo
    mvn eclipse:eclipse -DdownloadSources=false -DdownloadJavadocs=false
    
