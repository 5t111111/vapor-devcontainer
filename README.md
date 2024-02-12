# Vapor Devcontainer

This is a PoC for developing Vapor with Visual Studio Code + Development Container (Devcontainer).

- [x] Development in VS Code Dev Container
- [x] Breakpoint debugging via CodeLLDB
- [x] Auto formatting via apple/swift-format
- [x] Persistent data in PostgreSQL database via Fluent

## Getting started

Update Swift packages:

```shell
swift package update
```

Build once:

```shell
swift build
```

Run migrations:

```shell
swift run App migrate
```

Up and run Vapor server:

```shell
swift run App
```

Create new todo:

```shell
curl -X POST http://127.0.0.1:8080/todos -H "Content-Type: application/json" -d '{ "title": "Learn Vapor for the win" }'
```

Get todos:

```shell
curl http://127.0.0.1:8080/todos
```

Automatically restart application on file changes via [Reflex](https://github.com/cespare/reflex):

```shell
reflex -r '\.swift$' -R '^.build/' -s -- swift run App
```
