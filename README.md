# BlackLab indexing formats for SAFAR

The yaml files in this repository specify a custom [BlackLab](http://inl.github.io/BlackLab/index.html) indexer formats, one for safar-stemmer and one for safar-analyzer. They were developed in the context of the [Bridging the Gap](https://www.esciencecenter.nl/project/bridging-the-gap) project.

[SAFAR](http://arabic.emi.ac.ma/safar/?q=node/13) is a tool for Arabic natural language processing.

## How to use

```
git clone git@github.com:arabic-digital-humanities/index-safar.git
cd index-safar
```

Run the BlackLab IndexTool from this directory:
```
java -cp /path/to/blacklab.jar nl.inl.blacklab.tools.IndexTool create /path/to/index/directory/ /path/to/data/directory/ safar-analyzer
```

Or copy the indexing format file to the directory you are running the BlackLab IndexTool from.

### Configuring metadata

For configuring which metadata fields are shown in the corpus-frontend, we use [corpus specific metadata configuration](https://github.com/arabic-digital-humanities/corpus-blacklab-metadata-config).

More info on configuring metadata:

* [How to configure indexing in BlackLab](http://inl.github.io/BlackLab/how-to-configure-indexing.html).
* [Corpus-frontend index config](https://github.com/INL/corpus-frontend#index-config)

## Analyzer

BlackLab indexing format `safar-analyzer.blf.yaml`

Word looks like (faked data- so don't count on working ids):
```
<word w_id="242" value="بكل" total_analysis="11">
	<analysis a_id="1" vowled="بَكْلُ" stem="بكل" pattern="فَعْلُ" root="بكل" pos="مفرد مذكر مرفوع في حالة الاضافة" number="مفرد" gender="مذكر" mood="مرفوع" caze="في حالة الاضافة " type="اسم جامد" prefix="#" suffix="#" additional_info="" />
</word>
```

* All occurrences of a multiple values annotation (e.g., stem) are indexed. If
you search for a stem that is indexed multiple times, you get multiple hits,
so it seems like a good idea to filter the analyses (we are not interested in the
different vowelizations of words).


# Interface files
The contents directory `interface-defaults` are meant to specify a specific corpus-frontend interface for Arabic Digital Humanities. Define the `corporaInterfaceDataDir` property in `corpus-frontend.properties` and copy the content of `interface-defaults` to this directory.

# XSD files

**Please note that the XSD files are outdated.**

Before indexing them using Blacklab, XML files can be validated using the xsd files:

```
xmllint --schema /path/to/xsd/safar-stemmer.xsd --noout /path/to/xml/file.xml
```
