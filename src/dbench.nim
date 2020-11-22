import ./benchmarks/redisbench

proc redis(url: string, db: int): void =
  ## redis benchmarks
  helloworld(url)
  redisbench.helloworld(url)
  discard

proc mysql(url: string): void =
  ## mysql benchmarks
  discard

proc mongodb(url: string): void =
  ## mongodb benchmarks
  discard

when isMainModule:
  import cligen
  dispatchMulti([redis], [mysql], [mongodb]) 