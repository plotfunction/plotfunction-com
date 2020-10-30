
CONTAINER_NAME=plotfunction/website

run: build
	docker run -it -v $(PWD):/var/www/html -p 8000:8000 $(CONTAINER_NAME)

build:
	docker build -t $(CONTAINER_NAME) .

