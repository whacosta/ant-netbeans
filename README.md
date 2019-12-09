# ANT NETBEANS

For Gitlab Runner:

```
build:
    stage: build
    script:
        - ant -Dlibs.CopyLibs.classpath=/opt/netbeans/java/ant/extra/org-netbeans-modules-java-j2seproject-copylibstask.jar -Dplatforms.JDK_1.8.home=/usr/lib/jvm/java-1.8-openjdk -Dnb.internal.action.name=rebuild -DforceRedeploy=false clean jar
    artifacts:
        paths:
            - dist
```

Import, You can skip:

```
-Dlibs.CopyLibs.classpath=/opt/netbeans/java/ant/extra/org-netbeans-modules-java-j2seproject-copylibstask.jar
-Dplatforms.JDK_1.8.home=/usr/lib/jvm/java-1.8-openjdk
```

If you set build.properties in your nbproject\private\private.properties

```
user.properties.file=/opt/builder/build.properties
```

You can see an example of execution with Gitlab Pages:
https://gitlab.com/wacosta/dbmigration