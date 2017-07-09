#### Audience

This image can be used to spin up a container which contains the OpenStack 3.11.0 CLI tools aswell as Terraform 0.9.8.
This image contains default values to talk to the [CloudVPS][1] OpenStack environment but these can be overruled by setting new environment settings.

#### Usage:
```
docker run -ti \
-e OS_PROJECT_NAME="YOUR-PROJECTNAME" \
-e OS_USERNAME="your-username" \
pblaas/openstack-cli
```
>This will prompt you for your openStack password.
`Please enter your OpenStack Password:`

#### Available variables:

These variables are available. Only some of them are required as some of them already have default values.
```
OS_AUTH_URL="https://identity.openstack.cloudvps.com/v3"
OS_PROJECT_ID=""
OS_TENANT_ID=$OS_PROJECT_ID
OS_PROJECT_NAME=""
OS_TENANT_NAME=$OS_PROJECT_NAME
OS_USER_DOMAIN_NAME="Default"
OS_USERNAME=""
OS_PASSWORD=""
OS_REGION_NAME="AMS"
OS_INTERFACE=public
OS_IDENTITY_API_VERSION=3
```
>If you omit the required variables (without default values), the container will prompt for them on startup.

#### Volume 
You can use the following syntax to  mount  your terraform projects into the container.
```
docker run -ti \
-v PATH-TO-TF-BLUEPRINTS:/blueprints \
-e OS_PROJECT_NAME="YOUR-PROJECTNAME" \
-e OS_USERNAME="your-username" \
pblaas/openstack-cli
```

##### Notes

You need to provide OS_PROJECT_ID environment variable to use cinder and glance.

[1]: https://www.cloudvps.com/ "CloudVPS"
