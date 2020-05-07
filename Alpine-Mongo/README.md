# docker-alpine-mongo

An alpine:3.11.6 image with mongodb.  The default behavior is to run mongo in
'--auth' mode.  This image will set a root username and password based on
environment variables at run time. It can be edited as well from the **Dockerfile**

### Clone the repo and **cd** into the directory 

## Environment Variables
* **MONGO_INITDB_ROOT_USERNAME:**  
    The root username for the mongod instance.
* **MONGO_INITDB_ROOT_PASSWORD:**  
    The root password for the mongod instance.

## Building the image
```bash
docker build -t <image-name>:<image-tag> .
```
----------------------

## Examples

```bash
docker build -t mongo_alpine:1.1 .
docker run -d --name mongo \
    -e MONGO_INITDB_ROOT_USERNAME = "root-user" \ 
    -e MONGO_INITDB_ROOT_PASSWORD = "pass123" \
    -p "27019:27017" \ 
    -v /path/to/data:/data/db \
    mongo_alpine:1.1
```
----------------------
Passing other options to 'mongod' at startup.
```bash
docker run -d --name mongo \
  -p "27019:27017" \
  -v /path/to/data:/data/db \
  mongo_alpine:1.1 mongod --smallfiles
```
