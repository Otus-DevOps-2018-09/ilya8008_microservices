all: ui comment post-py prometheus

.PHONY: ui
ui: 
		export USER_NAME=$(username); cd ../src/ui; ./docker_build.sh; \
		docker push $(username)/ui

.PHONY: comment
comment: 
		export USER_NAME=$(username); cd ../src/comment; ./docker_build.sh; \
		docker push $(username)/comment

.PHONY: post-py
post-py: 
		export USER_NAME=$(username); cd ../src/post-py; ./docker_build.sh; \
		docker push $(username)/post

.PHONY: prometheus
prometheus: 
		cd ./prometheus; docker build -t $(username)/prometheus .; \
		docker push $(username)/prometheus

.PHONY: alertmanager
alertmanager: 
		cd ./alertmanager; docker build -t $(username)/alertmanager .; \
		docker push $(username)/alertmanager

.PHONY: fluentd
fluentd: 
		cd ../logging/fluentd; docker build -t $(username)/fluentd .; \
		docker push $(username)/fluentd
