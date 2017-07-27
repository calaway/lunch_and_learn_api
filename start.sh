#!/bin/sh

if [ -z "$APP_PATH" ]; then
echo You need to pass in APP_PATH
exit 1
else
bundle exec parallel_rspec spec/features/${APP_PATH}
fi
