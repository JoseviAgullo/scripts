#!/usr/local/bin/bash
name=${1,,}

echo Creating directory: ${name^}
mkdir ${name^}

cd ${name^}