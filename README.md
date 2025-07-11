# The Sequence Ontology

Welcome to the Sequence Ontology (SO). SO is a collaborative ontology project for the definition of sequence features used in biological sequence annotation. SO was initially developed by the Gene Ontology Consortium. Regular contributors include the GMOD community, model organism database groups such as WormBase, FlyBase, Mouse Genome Informatics group, and institutes such as the Sanger Institute, EMBL-EBI, and NCBI. SO is also a founding member of the Open Biomedical Ontologies (OBO) Foundry. 

This repository contains the 'source' for the Sequence Ontology. You can also view terms, definitions, and relationships in a web browser using the [the Sequence Ontology Browser "MISO"](http://www.sequenceontology.org/browser/obob.cgi) on SO's website, EMBL-EBI's [Ontology Lookup Service (OLS)](https://www.ebi.ac.uk/ols4/), or sites like [Ontobee](https://ontobee.org/). Many different file types are present in this repository and may contain the same information either whole or in part (see [subsets](https://github.com/The-Sequence-Ontology/SO-Ontologies/tree/master/subsets) folder).

Suggestions from the sequence annotation community to improve SO are welcomed. Further information about SO can be found on the [SO home page](http://www.sequenceontology.org/).

## Contributing via Pull Request

Pull requests (PRs) welcomed. Please review the lesson on [contributing to OBO ontologies](https://oboacademy.github.io/obook/lesson/contributing-to-obo-ontologies/) and the [pull requests tutorial](https://oboacademy.github.io/obook/tutorial/pull-requests/) in the [OBO Academy's OBO Semantic Engineering Training](https://oboacademy.github.io/obook/) (a.k.a. the OBOOK). 

While it is possible edit the text of an ontology file directly, it's recommended to use the [Prot&eacute;g&eacute;](https://protege.stanford.edu/) ontology editor to add, edit, and annotate ontology classes in SO. Please follow the [instructions for configuring Protégé](https://oboacademy.github.io/obook/howto/set-up-protege/) in the [OBO Academy's OBO Semantic Engineering Training](https://oboacademy.github.io/obook/) (a.k.a. the OBOOK).

The current method used for adding and updating terms and relationships in SO involves editing the ontology in Open Biomedical Ontologies (OBO) format ([so-edit.obo](https://github.com/The-Sequence-Ontology/SO-Ontologies/blob/master/so-edit.obo)). Please do not generate the other formats (OWL, JSON, etc.) as part of your PR. We will generate them after we review and merge your suggestions. 

### ID Ranges

If your group would like to regularly submit new terms to SO, please submit an issue requesting an ID range to prevent clashing of IDs. Currently assigned ranges can be viewed in the [ID_ranges.txt](https://github.com/The-Sequence-Ontology/SO-Ontologies/blob/master/ID_ranges.txt) file. Once you are assigned a range, please see the OBOOK's [tutorial for setting up your ID ranges](https://oboacademy.github.io/obook/howto/idrange/) in Protégé.

## Contributing via GitHub's built-in issue tracker

Please create a [GitHub issue](https://github.com/The-Sequence-Ontology/SO-Ontologies/issues) if: 

* You are not familiar with the file formats and software used to develop ontologies.
* Your suggestion impacts more than one SO term.
* You'd like to start a conversation on a topic related to SO's scope that could lead to new or edited terms.

Once you submit an issue, we'll review your suggestions as we're available and edit the files from our end in collaboration with you.

There are templates for three types of requests that we commonly receive:

* **New Term Requests:** if you'd like to add a term to SO
* **Update Definition or Name:** if you'd like to suggest changes to a term definition or name
* **Move Term:** if you'd like to suggest that a term be moved to a new location within SO

If your request doesn't fit into any of those templates, you're welcome to start from scratch with a blank template.

## Generating OWL, JSON, etc. from OBO

(July 11, 2025) We are working on migrating our workflow over to the [Ontology Development Kit (ODK)](https://incatools.github.io/ontology-development-kit//). In the meantime, we are still using OWLTools' Ontology Release Tool (OORT) to generate OWL, JSON, etc. from so-edit.obo.

**This detail is included here for reference. Please do not generate the other ontology files as part of a pull request.**

Once you have updated an ontology file, the other files in the repository can be updated using the provided Makefile, which utilizes OORT. Instructions for installing OWLTools can be found on their [GitHub page](https://github.com/owlcollab/owltools). Once OWLTools is installed, the Ontology Release Tool (ontology-release-runner) that will be used by the Makefile can be found in owltools/OWLTools-Oort/bin/. It is not required to add this to your PATH variable as this can be specified as a command line variable with the Makefile.

The Makefile allows the user to declare the updated file (INPUT) to use and the path to ontology-release-runner (OORT). Example usage: `make OORT=/Path/to/OWLTools/ontology-release-runner INPUT=../so-updated.owl`.

For more help with using the Makefile, use `make help`.

A successful build will update the following files:
+ so-metadata.txt
+ so-simple-metadata.txt
+ so-simple.json
+ so-simple.obo
+ so-simple.owl
+ so.json
+ so.obo
+ so.owl
+ All files in the subsets folder

A successful build process will print many lines to the screen, and the final lines should look something like:

```
2020-03-19 15:30:06,808 INFO  (OboOntologyReleaseRunner:21) Creating simple ontology completed
2020-03-19 15:30:06,920 INFO  (OboOntologyReleaseRunner:21) Finished release manager process
2020-03-19 15:30:06,920 INFO  (OboOntologyReleaseRunner:21) Done!
2020-03-19 15:30:06,920 INFO  (OboOntologyReleaseRunner:21) deleting lock file

Saving the log files to Logs folder.
```

If a mistake is found in the updated ontology file used, the build process will not complete and an error message will be printed that looks like:

```
2020-03-17 14:59:16,401 ERROR (OboOntologyReleaseRunner:37) Stopped Release process. Reason: Optional.get() cannot be called on an absent value
java.lang.IllegalStateException: Optional.get() cannot be called on an absent value
        at com.google.common.base.Absent.get(Absent.java:47)
        at org.obolibrary.obo2owl.OWLAPIOwl2Obo.getOntologyId(OWLAPIOwl2Obo.java:1178)
        at owltools.graph.OWLGraphWrapperExtended.getOntologyId(OWLGraphWrapperExtended.java:1462)
        at owltools.ontologyverification.OntologyCheckHandler.run(OntologyCheckHandler.java:98)
        at owltools.ontologyverification.OntologyCheckHandler.afterLoading(OntologyCheckHandler.java:69)
        at owltools.ontologyrelease.OboOntologyReleaseRunner.createRelease(OboOntologyReleaseRunner.java:660)
        at owltools.ontologyrelease.OboOntologyReleaseRunner.createRelease(OboOntologyReleaseRunner.java:500)
        at owltools.ontologyrelease.OboOntologyReleaseRunner.main(OboOntologyReleaseRunner.java:199)
2020-03-17 14:59:16,402 INFO  (OboOntologyReleaseRunner:21) deleting lock file
```

## Naming Conventions

All rdfs:labels (names in OBO) must not contain spaces or special characters. Instead of spaces, underscores can be used. Most special characters can be spelled out. For example, "five_prime_UTR" is used rather than "5' UTR".

## Logs  

The log files for the make process are stored in the "Logs" folder. This folder has been added to the .gitignore file so that users can view the log files for each make without the risk of accidentally committing them. If the build process worked correctly, the file 'so-reasoner-report.txt' should be present and empty and the ontology-release-runner output will be saved to the file 'OORT_logs_{date}_{time}.txt'.

 Of note, the build process does generate lines that include ERROR messages, but these do not affect the build process. These lines typically look like `2020-03-19 15:30:03,795 ERROR (OWLAPIOwl2Obo:1064) Duplicate clause 'alt_id( SO:0000019)' generated in frame: SO:0000313`. The cause of these error messages has been discussed in an [issue thread for Prot&eacute;g&eacute;](https://github.com/protegeproject/protege/issues/501), and the files are not affected by them.  

## Legacy Files

Some of the files that have been stored on the Sequence Ontology's GitHub repository have not been updated for some time. This includes the files that contain cross product information. While these files have not been updated with the newest information for Sequence Ontology, these files may still be of use to some individuals. These files have moved to the Legacy folder for convenience.

## License

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
