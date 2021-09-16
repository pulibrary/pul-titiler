#!/bin/bash
# Use .env file
set -o allexport; source .env; set +o allexport
pip install -r requirements.txt
npm install

if [ $1 == "ecs" ]
then
  npm run cdk destroy "$TITILER_STACK_NAME-ecs-$TITILER_STACK_STAGE"
else
  npm run cdk destroy "$TITILER_STACK_NAME-lambda-$TITILER_STACK_STAGE"
fi
