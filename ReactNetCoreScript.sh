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

echo Generating default React template
npx create-react-app $name.frontend

echo ${name^}

mkdir $name.frontend
mv $name.frontend ${name^}.Frontend

echo Adding Eslint and Prettier

cd ${name^}.Frontend

touch .eslintrc

cat >> .eslintrc <<'EOF'
{ "extends": [ "react-app", "plugin:prettier/recommended" ] }
EOF

npm i prettier eslint-config-prettier eslint-plugin-prettier --save-dev

npm i husky lint-staged --save-dev
npm i pretty-quick --save-dev

# Add "precommit": "pretty-quick --staged" into scripts section of package.json

echo DONE