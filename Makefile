NAME = tomtom-mysports-cloud-databox-driver
EXECUTABLE = main.native
DATABOX_DIRECTORY_ENDPOINT ?= http://localhost

build:
	docker build -f Dockerfile.build -t $(NAME):build .
	docker run --rm $(NAME):build /bin/sh -c 'tar -hc $(EXECUTABLE)' | tar -x
	docker build -t $(NAME) .
	rm -f $(EXECUTABLE)
	
run: build
	docker run -p "8080:8080" -e \
			"DATABOX_DIRECTORY_ENDPOINT=$(DATABOX_DIRECTORY_ENDPOINT)" $(NAME)

clean:
	docker rmi $(NAME):build
