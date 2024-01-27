# Network

## Unix socket vs TCP / IP sockets

- A `UNIX socket` is an inter-process communication mechanism that allows bidirectional data exchange between processes running on the **same** machine.
  - UNIX domain sockets know that they’re executing on the same system, so they can avoid some checks and operations (like routing); which makes them _faster_ and _lighter_ than IP sockets.
  - You can list your own machine local unix sockets

```shell
# linux
netstat -a -p --unix

# macOs
netstat -a -f unix
```

- `IP socket` (especially TCP/IP sockets) are a mechanism allowing communication between processes **over the network**.
