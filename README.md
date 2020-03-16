## The Sequence Ontology

Welcome to the Sequence Ontology (SO). SO is a collaborative ontology project for the definition of sequence features used in biological sequence annotation. SO was initially developed by the Gene Ontology Consortium. Contributors to SO include the GMOD community, model organism database groups such as WormBase, FlyBase, Mouse Genome Informatics group, and institutes such as the Sanger Institute and the EBI. Input to SO is welcomed from the sequence annotation community. SO is also part of the Open Biomedical Ontologies library. Our aim is to develop an ontology suitable for describing the features of biological sequences. Further information about SO can be found on the [SO home page](http://www.sequenceontology.org/).

This directory contains the 'source' for the Sequence Ontology. You can view relationships and definitions in a browser format using the [Sequence Ontology browser](http://www.sequenceontology.org/browser/obob.cgi).

Many different file types are present in this repository and will contain the same information represented in different formats or parts of the information related to source of the information (see [subsets](https://github.com/The-Sequence-Ontology/SO-Ontologies/tree/master/subsets) folder).

### Updating Sequence Ontology

The current method used for updating terms and relationships in SO involves editing the Web Ontology Language (OWL) format file (so.owl), but the Open Biomedical Ontologies (OBO) format file (so.obo) can also be used as both of these file formats are supported. The ontology editor [Prot&eacute;g&eacute;](https://protege.stanford.edu/) is recommended for editing SO files as the software for Prot&eacute;g&eacute; is currently supported and has many available online [tutorials](https://www.youtube.com/user/TheProtegeProject).

Once you have updated an ontology file, the other files in the repository can be updated using the provided Makefile, which utilizes OWLTools Ontology Release Tool. Instructions for installing OWLTools can be found on their [GitHub page](https://github.com/owlcollab/owltools). Once OWLTools is installed, the Ontology Release Tool (ontology-release-runner) that will be used by the Makefile can be found in owltools/OWLTools-Oort/bin/. It is not required to add this to your PATH variable as this will be specified as a command line variable with the Makefile.

The Makefile requires the user to declare the updated file (INPUT) to use and the path to ontology-release-runner (OORT). Example usage `make OORT=/Path/to/OWLTools/ontology-release-runner INPUT=../so-updated.owl`.

For more help with using the Makefile, use `make help`.

The log files for the make process are stored in the "Logs" folder. This folder has been added to the .gitignore file so that users can view the log files for each make without the risk of accidentally committing them.

### Legacy Files

Some of the files that have been stored on the Sequence Ontology's GitHub repository have not been updated for some time. This includes the files that contain cross product information. While these files have not been updated with the newest information for Sequence Ontology, these files may still be of use to some individuals. These files have moved to the Legacy folder for convenience.
