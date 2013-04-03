#!/bin/sh

sudo puppet apply --modulepath=modules -v -e 'include dashboard::production'
