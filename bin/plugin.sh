#!/bin/bash

# Check if a repo/chart combination was provided as an argument
if [ -z "$1" ]; then
    echo "Error: Please provide a 'repo/chart' combination as an argument." >&2
    exit 1
fi

# Split the argument into REPO_NAME and CHART_NAME
IFS='/' read -ra ADDR <<< "$1"
REPO_NAME="${ADDR[0]}"
CHART_NAME="${ADDR[1]}"

# Validate if both repo name and chart name are provided
if [ -z "$REPO_NAME" ] || [ -z "$CHART_NAME" ]; then
    echo "Error: Invalid argument. Expected format is 'repo/chart'." >&2
    exit 1
fi

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
