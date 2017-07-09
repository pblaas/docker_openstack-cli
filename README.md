# docker_openstack-cli

#### Build the image
```
docker build -t openstack-cli .
```

#### Run the image
```
docker run -ti \
-e OS_PROJECT_NAME="YOUR-PROJECTNAME" \
-e OS_USERNAME="your-username" \
pblaas/openstack-cli
```

##### More info
Additional information regarding this project you can find on the docker hub page.
https://hub.docker.com/r/pblaas/openstack-cli/
