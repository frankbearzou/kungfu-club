# KungFu club

## Installation
1. node.js
2. MySQL

Open a terminal, clone this project.
```
git clone https://github.com/frankbearzou/kungfu-club.git
cd kungfu-club
```

Install packages:
```
npm install
```

Create a .env file and set MySQL connection string
```
touch .env
echo "MYSQL='mysql://username:password@localhost/KungFuClub?debug=true';" >> .env
```

Importing sql into MySQL database.
The dump file name is `Dump.sql`. You can use any tools to import the table structures and testing data.

## Running
```
npm start
```
