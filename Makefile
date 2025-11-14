all: generated/schema.json generated/shacl.ttl generated/model.owl

generated/schema.json: model/model.yaml
	mkdir -p generated
	linkml generate json-schema model/model.yaml > generated/schema.json

generated/shacl.ttl: model/model.yaml
	mkdir -p generated
	linkml generate shacl model/model.yaml > generated/shacl.ttl

generated/model.owl: model/model.yaml
	mkdir -p generated
	linkml generate owl model/model.yaml > generated/model.owl

clean:
	rm -rf generated/*.json generated/*.ttl generated/*.owl

.PHONY: all clean
