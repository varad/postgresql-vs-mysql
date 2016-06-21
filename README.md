# postgresql-vs-mysql

The intention of this project is to compare performance of INSERT statement on PostgreSQL and MySQL. It inserts data in batches to both databases.

Duration on Postgres: approx. 18s

Durationn on MySQL: approx. 1s

The question is: why does it take so long on Postgres?

How to build:

1. Create database "postgres-vs-mysql" in both PosqtgreSQL and MySQL servers
2. Create a table "u_test_change_request" in both databases. You can find the scripts in "src/main/resources"
3. Run "mvn package"
4. Run LetsGo class.
