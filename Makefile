NAME = tomtom-mysports-cloud-databox-driver
EXECUTABLE = main.native

build:
	docker build -f Dockerfile.build -t $(NAME):build .
	docker run --rm $(NAME):build /bin/sh -c 'tar -hc $(EXECUTABLE)' | tar -x
	docker build -t $(NAME):latest .
	rm -f $(EXECUTABLE)

clean:
	docker rmi $(NAME):build
