# The Sequence Ontology

Welcome to the Sequence Ontology (SO). SO is a collaborative ontology project for the definition of sequence features used in biological sequence annotation. SO was initially developed by the Gene Ontology Consortium. Contributors to SO include the GMOD community, model organism database groups such as WormBase, FlyBase, Mouse Genome Informatics group, and institutes such as the Sanger Institute and the EBI. Input to SO is welcomed from the sequence annotation community. SO is also part of the Open Biomedical Ontologies library. Our aim is to develop an ontology suitable for describing the features of biological sequences. Further information about SO can be found on the [SO home page](http://www.sequenceontology.org/).

This directory contains the 'source' for the Sequence Ontology. You can view relationships and definitions in a browser format using the [Sequence Ontology browser](http://www.sequenceontology.org/browser/obob.cgi).

Many different file types are present in this repository and will contain the same information represented in different formats or parts of the information related to source of the information (see [subsets](https://github.com/The-Sequence-Ontology/SO-Ontologies/tree/master/subsets) folder).

## Contributing

The current method used for updating terms and relationships in SO involves editing the Web Ontology Language (OWL) format file (so.owl), but the Open Biomedical Ontologies (OBO) format file (so.obo) can also be used as both of these file formats are supported. The ontology editor [Prot&eacute;g&eacute;](https://protege.stanford.edu/) is recommended for editing SO files as the software for Prot&eacute;g&eacute; is currently supported and has many available online [tutorials](https://www.youtube.com/user/TheProtegeProject).

Once you have updated an ontology file, the other files in the repository can be updated using the provided Makefile, which utilizes OWLTools Ontology Release Tool. Instructions for installing OWLTools can be found on their [GitHub page](https://github.com/owlcollab/owltools). Once OWLTools is installed, the Ontology Release Tool (ontology-release-runner) that will be used by the Makefile can be found in owltools/OWLTools-Oort/bin/. It is not required to add this to your PATH variable as this can be specified as a command line variable with the Makefile.

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

### Naming Convention

All rdfs:labels (names in OBO) must not contain spaces or special characters. Instead of spaces, underscores can be used. Most special characters can be spelled out. For example, "five_prime_UTR" is used rather than "5' UTR".

### ID Ranges

To prevent clashing of IDs when multiple users simultaneously edit SO, we have assigned ranges for groups to use. These ranges can be viewed in the tab-delimited text file ID_ranges.txt. All external users are currently assigned the range of SO:0004001 to SO:0005000. If your group would like to work on SO, please create an issue request and we will create a range of IDs specifically for your group.  

### Logs  

The log files for the make process are stored in the "Logs" folder. This folder has been added to the .gitignore file so that users can view the log files for each make without the risk of accidentally committing them. If the build process worked correctly, the file 'so-reasoner-report.txt' should be present and empty and the ontology-release-runner output will be saved to the file 'OORT_logs_{date}_{time}.txt'.

 Of note, the build process does generate lines that include ERROR messages, but these do not affect the build process. These lines typically look like `2020-03-19 15:30:03,795 ERROR (OWLAPIOwl2Obo:1064) Duplicate clause 'alt_id( SO:0000019)' generated in frame: SO:0000313`. The cause of these error messages has been discussed in an [issue thread for Prot&eacute;g&eacute;](https://github.com/protegeproject/protege/issues/501), and the files are not affected by them.  

## Legacy Files

Some of the files that have been stored on the Sequence Ontology's GitHub repository have not been updated for some time. This includes the files that contain cross product information. While these files have not been updated with the newest information for Sequence Ontology, these files may still be of use to some individuals. These files have moved to the Legacy folder for convenience.

## License

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
