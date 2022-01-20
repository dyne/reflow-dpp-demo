# Importing node12 docker image
FROM node:12-alpine

# Add dependencies
RUN apk add git python3 make g++

# Installing restroom
RUN npx degit dyne/restroom-template /restroom-mw
WORKDIR /restroom-mw
RUN yarn

# OLD - Install the latest restroom-mw packages
# RUN yarn add @restroom-mw/core@next @restroom-mw/db@next @restroom-mw/http@next @restroom-mw/sawroom@next @restroom-mw/ui@next @restroom-mw/utils@next


# Configure restroom
ENV ZENCODE_DIR=/restroom-mw/zencode
ENV CUSTOM_404_MESSAGE="nothing to see here"
ENV HTTP_PORT=3300
ENV HTTPS_PORT=3301
ENV OPENAPI=true


RUN cd zencode \
rm -rf  confkeys.conf confkeys.keys confkeys.zen random.zen keypair_username.zen keypair_username.keys ./restroom-mw/ ./misc/


# Adding the exported files
RUN echo "Adding exported contracts from apiroom"
RUN echo -e "Rule unknown ignore\nScenario 'reflow': "create dpp"\nGiven I have a 'string dictionary' named 'dataFromEndpoint'\nGiven that I have an endpoint named 'outputEndpoint'  \nGiven I connect to 'endpoint' and pass it the content of 'myDataToPOST' and save the output into 'dataFromEndpoint'\nWhen I create the array of elements named 'id' for dictionaries in 'dataFromEndpoint'\nWhen I create the reflow identity of all objects in 'dataFromEndpoint'\n# When I create the hash of 'dataFromEndpoint'\nThen print the 'array'\nThen print the 'reflow identity' as 'base58'\n\n"> ./zencode/create-dpp-demo.zen
RUN echo -e '{"endpoint":"http://reflow-demo.dyne.org:4000/api/json/trace"}' > ./zencode/create-dpp-demo.keys
RUN echo -e "Rule unknown ignore\nScenario 'reflow': "create dpp"\nGiven I have a 'string dictionary' named 'dataFromEndpoint'\n# Given I have a 'string dictionary' named 'myDataToPOST'\n#  Given that I have an endpoint named 'endpoint'  \nGiven I connect to 'endpoint' and pass it the content of 'myDataToPOST' and save the output into 'dataFromEndpoint'\nWhen I create the array of elements named 'id' for dictionaries in 'dataFromEndpoint'\nWhen I create the reflow identity of all objects in 'dataFromEndpoint'\n# Then print the 'array'\n# Then print the 'reflow identity' as 'base58'\nThen print data\n"> ./zencode/reflow-print-data.zen
RUN echo -e '{"endpoint":"http://reflow-demo.dyne.org:4000/api/json/trace"}' > ./zencode/reflow-print-data.keys

# yarn install and run
CMD yarn start


