all: generated/schema.json generated/shacl.ttl generated/model.owl

generated/schema.json: model/model.yaml
	mkdir -p generated
	linkml generate json-schema $< -o $@

generated/shacl.ttl: model/model.yaml
	mkdir -p generated
	linkml generate shacl $< -o $@

generated/model.owl: model/model.yaml
	mkdir -p generated
	linkml generate owl $< -o $@

clean:
	rm -rf generated/*.json generated/*.ttl generated/*.owl

.PHONY: all clean
