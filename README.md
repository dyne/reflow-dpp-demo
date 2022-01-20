# reflow-dpp-demo

Produce a Digital Product Passport from Reflow OS object

# Intro

The script *reflowDPP-APIs.sh* will install the whole stack to serve the APIs to create a  Digital Product Passport and to retrieve an object from a ReflowOS instance. The Dockerfile will install the same thing inside a Dockerimage.

# Install via shell script

, Download *reflowDPP-APIs.sh*, run it and follow the instructions 

* Open the browser at *deployment-machine-ip*:3300/docs (if you're running it on your local machine, 0.0.0.0:3300/docs is fine)
* In Swagger, pick one of the APIs, and pass it this parameters: 

```
{
   "data":{
      "myDataToPOST":{
         "id":"01FSMSBAJ3N6NJGA9XBSGTNRT6",
         "recurseLimit":9,
         "unwind":true
      }
   },
   "keys":{
      
   }
}
```

# Install via Dockerfile

Download *Dockerfile* and then build it with: 

```
docker build --tag dyne/restroom_mw:latest .
```

and run it at port 3300 using:

```
docker run -d -p 3300:3300 -p 3301:3301 dyne/restroom_mw:latest
```


# The APIs

You can change the *id* and *recurseLimit* manually, the *unwind* must be on **true**
