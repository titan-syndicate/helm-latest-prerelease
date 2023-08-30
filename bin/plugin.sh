#!/bin/bash

# The name of the chart repository and chart
REPO_NAME="titan-syndicate"
CHART_NAME="next-app-chart"

# Fetch the list of all versions for the chart
ALL_VERSIONS=$(helm search repo ${REPO_NAME}/${CHART_NAME} --versions | grep ${CHART_NAME} | awk '{print $2}')

# Filter for pre-release versions and get the latest one
LATEST_PRERELEASE=$(echo "$ALL_VERSIONS" | grep -E "-(alpha|beta|rc)\." | sort -V | tail -n 1)

# Check if there are no pre-release versions
if [ -z "$LATEST_PRERELEASE" ]; then
    echo "Error: No pre-release versions found for ${REPO_NAME}/${CHART_NAME}" >&2
    exit 1
fi

# Output the latest pre-release version
echo $LATEST_PRERELEASE
