#!/bin/bash

eval "$(jq -r '@sh "gitlab_environment_scope=\(.gitlab_environment_scope) google_project=\(.google_project) cluster_name=\(.cluster_name) namespace=\(.namespace)"')"

if [[ -z "$gitlab_environment_scope" && -z "$google_project" ]] ; then
    >&2 echo "One of 'gitlab_environment_scope' or 'google_project' has to be specified."
    exit -1
fi

if [ -z "$gitlab_environment_scope" ] ; then
    environment_scope="kw_${google_project}_${cluster_name}_${namespace}*"
else
    environment_scope="$gitlab_environment_scope"
fi

jq -n "{environment_scope:\"$environment_scope\"}"
