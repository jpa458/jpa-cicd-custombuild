# jpa-cicd-custombuild

## Intro
A prototype cicd buid pipeline to check that
* We can kick off a build to build 2 containers
* Spin up a VM on demand with parameterised instance types, images etc.
* Run the 2 containers in the VM to simulate an integration test
* Shutdown and cleanup the instance

One container is a web server returning 'Hello World'
The second container curls the server response to stdout which should then be visible in the build logs.

More sophisticated data exchange can be imageined to verify results, for example the remote-builder step copies the Cloud Build workspace directory between the VM and the build environment.

This is all orchestrated by the ./cicdbuild/cloudbuild.yaml file.


## Setup
* Create a GCP project and enable the following APIs:
 + Container Registry
 + Cloud Build APIs
* Setup and install the Cloud Build customer builder : [remote-builder](https://github.com/GoogleCloudPlatform/cloud-builders-community/tree/master/remote-builder)
* Check the Compute Instance Admin (V1) role has been given to the service account generated in the Remote Builder instructions... doesn't always work for some reason
* From Cloud Shell clone this repo 
* Submit the build from the root dir of this repo
```
gcloud builds submit --config ./cicdbuild/cloudbuild.yaml . 
```
* The build log should show the 'Hello World' message.


## Disclaimer
* This is not an officially supported Google repo/product.
* This is a prototype to prove concepts
* It is not a statement of best practices nor meant for production usage and I know for sure this can be optimised!
* Don't be that cut and paste coder!
