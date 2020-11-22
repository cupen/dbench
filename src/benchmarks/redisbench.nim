import redis
import uri
import strutils
import nativesockets
import timeit

type
  Benchmarks = object
    url*: string
    host: string
    port: Port
    db: int
    client: redis.Redis


proc new*(url: string): Benchmarks =
  var u = uri.parseUri(url)
  var obj = Benchmarks(url:url, host:u.hostname, port:parseInt(u.port).Port)
  obj.client = redis.open(host=u.hostname, port=parseInt(u.port).Port)

  var key = "nim_redis:test"
  var val = "Hello World"
  obj.client.setk(key, val)
  var resp = obj.client.get(key)
  assert resp == val
  echo "ping ok"
  return obj


proc set*(this: Benchmarks, count: int): void =
  for i in 0..count:
    this.client.setk("nim_redis:test", "Hello World")
  return

proc get*(this: Benchmarks, count:int): void =
  var value = "Hello World"
  this.client.setk("nim_redis:test", value)
  for i in 0..count:
    var resp = this.client.get("nim_redis:test")
    discard resp
  return

when isMainModule:
  var bm = new(url="redis://127.0.0.1:6379/0")
  echo timeGo(bm.set(1), 10, 100000)
