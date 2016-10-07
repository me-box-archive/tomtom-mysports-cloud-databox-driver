NAME = tomtom-runner-databox-driver
EXECUTABLE = main.native

build:
	docker build -f Dockerfile.build -t $(NAME):build .
	docker run --rm $(NAME):build /bin/sh -c 'tar -hc $(EXECUTABLE)' | tar -x
	docker build -t $(NAME) .
	rm -f $(EXECUTABLE)
	
run:
	docker run $(NAME)

clean:
	docker rmi $(NAME):build
