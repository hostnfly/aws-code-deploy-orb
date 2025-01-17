#!/bin/sh
ORB_EVAL_APPLICATION_NAME="$(eval echo "${ORB_EVAL_APPLICATION_NAME}")"
ORB_EVAL_BUNDLE_BUCKET="$(eval echo "${ORB_EVAL_BUNDLE_BUCKET}")"
ORB_EVAL_BUNDLE_KEY="$(eval echo "${ORB_EVAL_BUNDLE_KEY}")"
ORB_EVAL_REGION="$(eval echo "${ORB_EVAL_REGION}")"

if [ -n "${ORB_VAL_ARGUMENTS}" ]; then 
    set -- "$@" "${ORB_VAL_ARGUMENTS}"
fi 

aws deploy push \
    --application-name "${ORB_EVAL_APPLICATION_NAME}" \
    --source "${ORB_VAL_BUNDLE_SOURCE}" \
    --profile "${ORB_VAL_PROFILE_NAME}" \
    --region "${ORB_EVAL_REGION}" \
    --s3-location s3://"${ORB_EVAL_BUNDLE_BUCKET}/${ORB_EVAL_BUNDLE_KEY}.${ORB_VAL_BUNDLE_TYPE}" "$@"
