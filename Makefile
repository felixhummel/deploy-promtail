.PHONY: default
default: docker

.PHONY: docker
docker:
	promtail -dry-run -config.file docker.yml
	
.PHONY: varlog
varlog:
	promtail -dry-run -config.file varlog.yml

