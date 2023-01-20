const String DATABASE_NAME = "managementinvesting2.db";
const String TABLE_USERS_NAME = "users";
const String TABLE_FOLLOWING_NAME = "fallowing";
const String SCRIPT_USERS_CREATE_TABLE =
    "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT, user TEXT, password TEXT)";
const String SCRIPT_FOLLOWING_CREATE_TABLE =
    "CREATE TABLE fallowing(id INTEGER PRIMARY KEY, symbol TEXT, usersId INTEGER)";
