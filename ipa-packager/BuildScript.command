#!/bin/sh

#  BuildScript.command
#  ipa-packager
#
#  Created by Shanaka Senevirathne on 20/6/20.
#  Copyright © 2020 shanaka. All rights reserved.

echo "*********************************"
echo "Build Started"
echo "*********************************"
echo

echo "*********************************"
echo "Beginning Build Process"
echo "*********************************"
echo

echo "*********************************"
echo "These command line inputs were provided to BuildScript"
echo "project : ${1}"
echo "target : ${2}"
echo "CONFIGURATION_BUILD_DIR : ${3}"
echo ".app : ${4}"
echo "folder : ${5}"
echo "*********************************"
echo

xcodebuild -project "${1}" -target "${2}" -sdk iphoneos -verbose CONFIGURATION_BUILD_DIR="${3}"

 echo "*********************************"
 echo "Creating IPA"
 echo "*********************************"

#/usr/bin/xcrun -verbose -sdk iphoneos PackageApplication -v "${3}/${4}.app" -o "${5}/app.ipa"
