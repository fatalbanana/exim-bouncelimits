PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE users (user text not null, max_bnc int default 1, enabled default true);
CREATE TABLE activity(user text not null, day date not null, num_bnc int default 0);
CREATE UNIQUE INDEX users_user_idx on users(user);
CREATE UNIQUE INDEX activity_user_day_idx ON activity(user, day);
COMMIT;
