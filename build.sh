#!/bin/bash

# Install python requirements
# Launch target

virtualenv --system-site-packages venv
source venv/bin/activate

pip install pytest
pip install -r /opt/sdk/libraries/python/requirements.txt
pip install -r requirements.txt

killall python || true

rm -f *.log
rm -f *.db

BUILD_ID=dontKillMe python rest_target.py &
pytest --junitxml test_target.xml tests.py

# end
