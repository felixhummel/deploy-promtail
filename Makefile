.PHONY: default
default: docker

.PHONY: docker
docker:
	INSTANCE=t promtail -dry-run -config.expand-env -config.file docker.yml
	
.PHONY: varlog
varlog:
	promtail -dry-run -config.file varlog.yml

