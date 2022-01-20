# reflow-dpp-demo

Produce a Digital Product Passport from Reflow OS object

# Get started

Download reflowDPP-APIs.sh, run it and follow the instructions 

* Open the browser at *deployment-machine-ip*:3300/docs (if you're running it on your local machine, 0.0.0.0:3300/docs is fine)
* In Swagger, pick one of the APIs, and pass it this parameters: 

```
{
  "data": { "myDataToPOST": {
		"id": "01FSMSBAJ3N6NJGA9XBSGTNRT6",
		"recurseLimit": 9,
		"unwind": true}
},
  "keys": {}
}
```

# the APIs

You can change the *id* and *recurseLimit* manually, the *unwind* must be on **true**
