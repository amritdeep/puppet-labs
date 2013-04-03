#!/bin/sh

puppet apply --modulepath=modules -v -e 'include dashboard::production'
