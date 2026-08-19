# 10 — Databases & Services

All have official **arm64** builds (Debian/Ubuntu arm64, Docker arm64 images,
or official tarballs). ✅

| Tool | Type | Install |
|------|------|---------|
| **PostgreSQL** | Relational DB | `sudo apt install postgresql` |
| **MySQL** | Relational DB | `sudo apt install mysql-server` |
| **MariaDB** | Relational DB | `sudo apt install mariadb-server` |
| **SQLite** | Embedded DB | `sudo apt install sqlite3` |
| **Redis** | In-memory store | `sudo apt install redis-server` |
| **MongoDB** | Document DB | official arm64 tarball / repo |
| **RabbitMQ** | Message broker | `sudo apt install rabbitmq-server` (Erlang, arm64) |
| **Apache Kafka** | Stream platform | JVM — runs on arm64 JDK |

> JVM-based services (Kafka) and Erlang (RabbitMQ) are architecture-independent;
> the rest ship official arm64 packages/images.

*License: respective upstream licenses. Collector holds no rights.*
