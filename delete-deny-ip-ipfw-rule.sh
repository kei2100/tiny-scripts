#!/bin/sh

#
# Delete ipfw rule 'deny ip from any to any'
# @see http://superuser.com/questions/265589/disable-cisco-vpn-client-routing-for-selected-subnet-on-mac-os-x
#

set -e

RULE_NO=`sudo ipfw show | grep 'deny ip from any to any' | awk '{print $1}'`

if [ -z ${RULE_NO} ]; then
  echo "Nothing to delete"
  exit 0
fi

echo "Delete to ${RULE_NO}"

sudo ipfw delete ${RULE_NO}
