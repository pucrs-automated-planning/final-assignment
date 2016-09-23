#!/usr/bin/env bash
mkdir submissions.old
cp -R ./submissions/* ./submissions.old
pushd submissions.old
wget https://raw.githubusercontent.com/github/gitignore/master/C%2B%2B.gitignore
wget https://raw.githubusercontent.com/github/gitignore/master/Java.gitignore
wget https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore
wget https://raw.githubusercontent.com/github/gitignore/master/Ruby.gitignore
wget https://raw.githubusercontent.com/github/gitignore/master/TeX.gitignore
cat *.gitignore >>.gitignore