.PHONY: build

build: ./src/ui/build_ui ./src/post-py/build_post-py ./src/comment/build_comment

./src/ui/build_ui: ./src/ui/Dockerfile ./src/ui/*.rb ./src/ui/VERSION
	docker build -t miklezzzz/ui ./src/ui/ && docker push miklezzzz/ui && touch ./src/ui/build_ui

./src/post-py/build_post-py: ./src/post-py/Dockerfile ./src/post-py/*.py ./src/post-py/VERSION
	docker build -t miklezzzz/post-py ./src/post-py/ && docker push miklezzzz/post-py && touch ./src/post-py/build_post-py

./src/comment/build_comment: ./src/comment/Dockerfile ./src/comment/*.rb ./src/comment/VERSION
	docker build -t miklezzzz/comment ./src/comment/ && docker push miklezzzz/comment && touch ./src/comment/build_comment

./src/ui/Dockerfile:

./src/comment/Dockerfile:

./src/post-py/Dockerfile:
