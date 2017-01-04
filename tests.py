#!/usr/bin/env python

'''Example automated test script for flask_rest_target

This example automated test/unittest uses pytest.  With
the pytest-peach module this test script can be used
with Peach Web Proxy.

  pytest test_target.py --peach=auto

'''

from __future__ import print_function
import pytest, os, json
from requests import put, get, delete, post

# HTTP target
target = 'http://127.0.0.1:7777'
req_args = {'headers': {"X-API-Key":"b5638ae7-6e77-4585-b035-7d9de2e3f6b3"}}

	
def setup_function(self):
	'''
	Setup the test by clearing out created users.
	'''
	
	try:
		delete(target+'/api/users?user=dd', **req_args)
	except:
		pass
	
def teardown_function(self):
	'''
	Teardown test by clearing out created users.
	'''
	
	try:
		delete(target+'/api/users?user=dd', **req_args)
	except:
		pass

def test_user_create():
	r = post(target+'/api/users',
		 data=json.dumps({"user":"dd", "first":"mike", "last":"smith", "password":"hello"}),
		 **req_args)
	user = r.json()
	assert int(user['user_id']) > -1

if __name__ == "__main__":
	print()
	print("This script is intended to be run using pytest module.")
	print("Please see README for more information.")
	print()
	print("Example usage with pytest and pytest-peach:")
	print()
	print("  pytest test_target.py --peach=auto")
	print()

# end
