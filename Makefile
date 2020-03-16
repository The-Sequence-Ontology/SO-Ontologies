INPUT? = "so-normal.obo"
OORT? = "ontology-release-runner"

release: $(INPUT) $(ORT)
	@$(OORT) $(INPUT) --prefix so --simple --allow-overwrite > OORT_logs.txt
	@rm -r extensions
	@rm -r staging
	@rm -r releases
	@if [ ! -d "Logs" ]; then mkdir Logs; fi
	@mv so-reasoner-report.txt Logs
	@mv OORT_logs.txt Logs
	@rm *.owx
	@rm subsets/*.owx

help:
	@echo "This Makefile takes variables for the updated ontology file and the OwlTools ontology-release runner."
	@echo "INPUT: The updated ontology file. This can be in either obo or owl format."
	@echo "OORT: Path to your OwlTools ontology release tool (ontology-release-runner). If ontology-release-runner is added to your path, simply use 'ontology-release-runner'."
	@echo "Example usage: make release OORT=/path/to/OwlTools/Ontology_Release_tool/ontology-release-runner INPUT=so-updated.owl"
