#!/usr/bin/env bash 

# echo "${red}red text ${green}green text${reset}"
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${reset} "
echo "   "
echo "Make sure you have node 12, the version you have is" 
echo "   "
node -v
echo "   "
echo "   "
# Installing restroom
npx degit dyne/restroom-template restroom-mw --force



# setup docker
cd ./restroom-mw

touch .env
echo 'ZENCODE_DIR=./zencode
CUSTOM_404_MESSAGE=nothing to see here
HTTP_PORT=3300
HTTPS_PORT=3301' > .env


# Adding the exported files
echo "   "
echo "Adding exported contracts from apiroom"

echo Creating directory "./zencode/dyneorg/"
mkdir -p "./zencode/dyneorg"

echo Creating file "reflow-print-data.zen":
echo "Rule unknown ignore
Scenario 'reflow': "create dpp"
Given I have a 'string dictionary' named 'dataFromEndpoint'
# Given I have a 'string dictionary' named 'myDataToPOST'
#  Given that I have an endpoint named 'endpoint'  
Given I connect to 'endpoint' and pass it the content of 'myDataToPOST' and save the output into 'dataFromEndpoint'
When I create the array of elements named 'id' for dictionaries in 'dataFromEndpoint'
When I create the reflow identity of all objects in 'dataFromEndpoint'
# Then print the 'array'
# Then print the 'reflow identity' as 'base58'
Then print data
"> ./zencode/reflow-print-data.zen

echo Creating file "reflow-print-data.keys":
echo '{"endpoint":"http://reflow-demo.dyne.org:4000/api/json/trace"}' > ./zencode/reflow-print-data.keys

echo Creating file "create-dpp-demo.zen":
echo "Rule unknown ignore
Scenario 'reflow': "create dpp"
Given I have a 'string dictionary' named 'dataFromEndpoint'
Given that I have an endpoint named 'outputEndpoint'  
Given I connect to 'endpoint' and pass it the content of 'myDataToPOST' and save the output into 'dataFromEndpoint'
When I create the array of elements named 'id' for dictionaries in 'dataFromEndpoint'
When I create the reflow identity of all objects in 'dataFromEndpoint'
# When I create the hash of 'dataFromEndpoint'
Then print the 'array'
Then print the 'reflow identity' as 'base58'

"> ./zencode/create-dpp-demo.zen

echo Creating file "create-dpp-demo.keys":
echo '{"endpoint":"http://reflow-demo.dyne.org:4000/api/json/trace"}' > ./zencode/create-dpp-demo.keys



# Finished exported files
echo "   "
echo "Finished exporting contracts from apiroom"
echo "   "

# Debbing
echo "   "
echo "Printing the .env file:"
echo "   "
cat .env

# cd restroom-mw
yarn 
# yarn add @restroom-mw/core@next @restroom-mw/db@next @restroom-mw/http@next @restroom-mw/sawroom@next @restroom-mw/utils@next



cd zencode 
rm  confkeys.conf confkeys.keys confkeys.zen random.zen keypair_username.zen keypair_username.keys
rm -rf restroom-mw/
rm -rf misc/

echo " -------------------------- "
echo " ---- End debloating ---- "
echo " -------------------------- "


# instructions 
echo "   "
echo "${reset} "
echo "To launch restroom-mw, type:"
echo "${reset} "
echo "${red}cd restroom-mw"
echo "${reset} "
echo "${red}yarn start"
echo "${reset} "


