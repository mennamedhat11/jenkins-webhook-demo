#!/bin/bash
# Demo script used by the Jenkins pipeline.
# By default it passes. To simulate a failing build (and trigger the
# failure email), run it with FAIL=1, or uncomment the line at the bottom.

echo "print from script"

if [ "${FAIL:-0}" = "1" ]; then
  echo "Simulating a failure..."
  exit 1
fi

# exit 1
