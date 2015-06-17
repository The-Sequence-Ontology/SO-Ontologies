
release: so_refactored.owl
	ontology-release-runner --ignoreLock --skip-release-folder --outdir main --simple --allow-overwrite --reasoner elk $<
