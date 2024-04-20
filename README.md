# pandaku

An attempt to run `pandoc server` on Docker and subsequently on [fly.io](https://fly.io) as a service inspired by [this tweet](https://twitter.com/btbytes/status/1781580932010439056).

Status: INCOMPLETE

I tried installing the latest ubuntu version (`ubuntu:noble-20240407.1`), but it does not ship with a version of pandoc (`3.1.3`)
that is compiled with the `server` option.

```
docker run -it pandaku bash


root@040d50a4de2e:/data# pandoc -v
pandoc 3.1.3
Features: -server +lua
Scripting engine: Lua 5.4
User data directory: /root/.local/share/pandoc

root@040d50a4de2e:/data# pandoc server
Server mode unsupported.
Pandoc was not compiled with the 'server' flag.
```
