#!/bin/bash
# First run the default template processing
/docker-entrypoint.sh &
# Wait for template processing to complete
sleep 2
# Remove conflicting default nginx configuration
rm -f /etc/nginx/conf.d/default.conf
# Reload nginx configuration
nginx -s reload
# Wait for the background process
wait