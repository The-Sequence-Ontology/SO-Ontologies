INPUT ?=so-edit.obo
OORT ?=ontology-release-runner
date_time=$(shell date +"%F_%T")

release: $(INPUT) $(ORT)
	$(OORT) $(INPUT) --outdir Ontology_Files --prefix so --simple --allow-overwrite | tee OORT_logs_$(date_time).txt
	@echo ""
	@echo "Saving the log files to Logs folder."
	@if [ ! -d "Logs" ]; then mkdir Logs; fi
	@mv OORT_logs_$(date_time).txt Logs
	@mv Ontology_Files/so-reasoner-report.txt Logs

help:
	@echo "This Makefile is used to generate the several formats of ontology files from one that has been updated."
	@echo "Two input variables can be used for this Makefile."
	@echo "INPUT: The updated ontology file. This can be in either obo or owl format. Default is so-edit.obo."
	@echo "OORT: Path to your OwlTools ontology release tool (ontology-release-runner). Default is 'ontology-release-runner', which requires the program to be added to your global PATH or be in the present working directory."
	@echo "Example usage: make release OORT=/path/to/OwlTools/Ontology_Release_tool/ontology-release-runner INPUT=so-edit_my_version.obo"
