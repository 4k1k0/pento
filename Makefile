.PHONY: clean
clean:
	docker container ls -aq \
		| xargs docker container rm -f

.PHONY: dev
dev:
	docker run --name postgres-pento \
		-p 5432:5432 \
		-e POSTGRES_PASSWORD=postgres \
		-e POSTGRES_USER=postgres \
		-e POSTGRES_DB=pento_dev \
		-d postgres

