#!/bin.sh

source venv/bin/activate
pytest --junitxml test_target.xml tests.py
