#!/usr/bin/env bash

#############################################################################
## 
##   Logtalk RPM package build script
##   Last updated on November 23, 2018
## 
##   This file is part of Logtalk <https://logtalk.org/>  
##   Copyright 1998-2018 Paulo Moura <pmoura@logtalk.org>
##   
##   Licensed under the Apache License, Version 2.0 (the "License");
##   you may not use this file except in compliance with the License.
##   You may obtain a copy of the License at
##   
##       http://www.apache.org/licenses/LICENSE-2.0
##   
##   Unless required by applicable law or agreed to in writing, software
##   distributed under the License is distributed on an "AS IS" BASIS,
##   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##   See the License for the specific language governing permissions and
##   limitations under the License.
## 
#############################################################################

if [ -z "$1" ]; then
	version=$(cat ../../VERSION.txt)
else
	version="$1"
fi
version_clean=$(echo "$version" | sed -e 's/-stable$//' | sed -e 's/-/_/g')
archive=logtalk-$version

directory="$PWD"

cd ../.. || exit 1
tar -cjf "$HOME/rpmbuild/SOURCES/$archive.tar.bz2" .
mkdir -p ~/rpmbuild/RPMS/noarch

cd "$directory" || exit 1
sed -e 's/LOGTALK_VERSION/'$version_clean'/g' -e 's/LOGTALK_INSTALL_DIRECTORY/'$archive'/g' logtalk.spec.in > logtalk.spec
rpmbuild -ba --target=noarch-*-linux logtalk.spec

cd "$HOME/rpmbuild/RPMS/noarch" || exit 1
echo "$PWD"
ls -l
