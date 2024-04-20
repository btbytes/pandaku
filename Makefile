build: Dockerfile
	docker build . -t pandaku

run:
	docker run -p 127.0.0.1:3030:3030 --platform linux/amd64 pandaku
