#!/bin/bash
# Use .env file*
set -o allexport; source .env; set +o allexport
pip install -r requirements.txt
npm install
npm run cdk bootstrap "aws://$AWS_ACC_ID/$AWS_REGION"
npm run cdk synth

if [ $1 == "ecs" ]
then
  npm run cdk deploy "$TITILER_STACK_NAME-ecs-$TITILER_STACK_STAGE"
else
  npm run cdk deploy "$TITILER_STACK_NAME-lambda-$TITILER_STACK_STAGE"
fi
