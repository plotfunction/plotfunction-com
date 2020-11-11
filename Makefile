
CONTAINER_NAME=plotfunction-website
IMAGE_NAME=plotfunction/website

start: build
	docker run -it -v $(PWD):/var/www/html -p 8000:8000 --name $(CONTAINER_NAME) $(IMAGE_NAME)

stop:
	docker stop plotfunction/website

build:
	docker build -t $(CONTAINER_NAME) .

