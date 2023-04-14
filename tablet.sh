#!/usr/bin/env bash

set -o errexit
set -o nounset

sudo rmmod hid-uclogic
kamvas start
