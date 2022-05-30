
# Build and push to dockerhub

In this snippet we used declartive pipeline to automate the process of building docker image and pushing it to docker hub.


## Step by step walk through
There are 4 stages in this pipeline.

**Stage 1: Code Clone**

first we clone the source code to jenkins server.

**Stage 2: Start Docker Build**

Afte the source code is build we have already define a dockerfile for the project, So we can run the docker build command to build the image.

**Stage 3: Loging Into DockerHub**

when the docker image is build we then need to push it into dockerhub for that first we need to log into our docker hub. We must create a environment variable which store dockerhub userID and password or a security token provided by dockerhub. Store the credentials in jenkins > manage jenkins > manage credentials.

**Stage 4: Push to DockerHub**

Now its time to push the image into dockerhub using _docker push_ command.