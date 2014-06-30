CREATE TABLE 'passwordsafe' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'account' TEXT NULL, 'description' TEXT NULL, 'externallogin' TEXT NULL, 'externalpassword' TEXT NULL, 'url' TEXT NULL, 'comments' TEXT NULL);

CREATE TABLE 'wiki' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'name' TEXT, 'content' TEXT, 'lastcontent' TEXT);
