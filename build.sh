#/bin/sh

# Install python requirements
# Launch target

cd /opt/sdk/libraries/python
pip install -r requirements.txt
#python setup.py install

cd /opt/sdk/testrunners/custom/python
pip install -r requirements.txt

cd $WORKSPACE
pip install -r requirements.txt

killall python || true
BUILD_ID=dontKillMe python rest_target.py &
pytest --junitxml test_target.xml tests.py

# end
