all:
	linkml-generate-json-schema model/model.yaml -o generated/schema.json
	linkml-generate-shacl model/model.yaml -o generated/shacl.ttl
	linkml-generate-owl model/model.yaml -o generated/model.owl
