#!/bin/bash

source venv/bin/activate

cd /opt/sdk/libraries/python
pip install -r requirements.txt
python setup.py install

cd /opt/sdk/testrunners/custom/python
pip install -r requirements.txt

cd /opt/sdk/testrunners/pytest-peach/src
python setup.py install

cd $WORKSPACE

python /opt/sdk/ci/generic/peach_ci_runner.py

# end
