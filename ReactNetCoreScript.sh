#!/usr/local/bin/bash
name=${1,,}

echo Creating directory: ${name^}
mkdir ${name^}

cd ${name^}

git init

echo Generating default .Net Core template

mkdir ${name^}.Backend

cd ${name^}.Backend

dotnet new sln -n ${name^}.Backend

mkdir src tests

echo Creating backend project
dotnet new classlib -n ${name^}.Backend -o src
dotnet sln add src/${name^}.Backend.csproj

echo Creating test project for the backend
dotnet new nunit -n ${name^}.Backend.Tests -o tests
cd tests
dotnet add reference ../src/${name^}.Backend.csproj
cd ..
dotnet sln add ./tests/${name^}.Backend.tests.csproj

cd ..