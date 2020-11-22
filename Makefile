
build:
	nimble build

clean:
	rm ./dbench

run: build
	./dbench
