# DevX Base Platform

This platform provides a quick, unified, and standard means of launching an application with almost any stack. It is easily customizable but also provides a starting point for apps of all types.

The platform is built around containers. Everything is a container — each database, each backend, etc. An app can therefore scale horizontally with no effort and can have multiple databases and backends connected together. Simply describe the stack you want in `docker-compose.yml`, generate it with `make stack`, write your code, and launch it with `make run`.

## Supported Stacks

Currently, the platform supports a limited number of backends and databases. More will be added soon, but if you don't see the stack you want, it is easy to add.

#### Backends

- Node.js
- Python
- Golang
- Rails
- PHP
- Nginx

#### Databases

- Mongo DB
- MySQL
- PostgreSQL
- Redis

You can select any combination of these stacks.

## Getting Started

Each developer should fork this repo as the start of their base repository. **If you're a new developer and haven't used this platform before, run `make setup`**.

We use docker to create and manage containers. We use docker-compose to orchestrate them and describe how they interact. Edit the `docker-compose.yml` file to include the backend and database technologies you want for your app. Then, run `make stack`. This will generate all the files and configuration needed to deploy the stack. **Make sure to only do this once unless you add something to your stack**. If you remove a technology, you need to manually remove the old files (for safety reasons).

Finally, write your code and develop your application. **To test your app, run `make dev`.** This will launch your app in a dockerized container. Backends should listen on port 3000. To access your app (both inside and outside the virtual machine), go to `http://localhost:3000`. To restart the app (after making some changes), type `ctrl+c` and then `make dev` again.

To launch your app in production mode, use `make run`. 

**If you're cloning the repository and someone has already run `make stack`, do not run it again.**