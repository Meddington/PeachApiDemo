#!/bin/bash

source venv/bin/activate
pytest --junitxml test_target.xml tests.py
