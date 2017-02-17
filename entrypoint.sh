#!/bin/bash

if [[ $LICENSE_KEY ]]; then
	sed -i -e "s/^.*license_key:.*$/license_key: ${LICENSE_KEY}/" /etc/newrelic-infra.yml
else
	echo "You must set LICENSE_KEY environment variable to run the New Relic Infrastructure Agent container."
	exit 1
fi

# Run the agent
/usr/bin/newrelic-infra -config /etc/newrelic-infra.yml