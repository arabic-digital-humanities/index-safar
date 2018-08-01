# BlackLab indexing formats for SAFAR

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

## Analyzer

BlackLab indexing format `safar-analyzer.blf.yaml`

Word looks like (faked data- so don't count on working ids):
```
<word w_id="242" value="بكل" total_analysis="11">
	<analysis a_id="1" vowled="بَكْلُ" stem="بكل" pattern="فَعْلُ" root="بكل" pos="مفرد مذكر مرفوع في حالة الاضافة" number="مفرد" gender="مذكر" mood="مرفوع" caze="في حالة الاضافة " type="اسم جامد" prefix="#" suffix="#" additional_info="" />
</word>
```

* Empty word (`<word>` without `<analysis>`) is a problem. Although the document is
indexed without error messages and the user can search for the word, the word
that doesn't have `<analysis>` elements is erroneously associated with the stem
of the next word. This seems to be [a bug in BlackLab](https://github.com/INL/BlackLab/issues/43).  
* All occurrences of a multiple values annotation (e.g., stem) are indexed. If
you search for a stem that is indexed multiple times, you get multiple hits,
so it seems like a good idea to filter the analyses (we are not interested in the
different vowelizations of words).


# Interface files
The contents directory `interface-defaults` are meant to specify a specific corpus-frontend interface for Arabic Digital Humanities. Define the `corporaInterfaceDataDir` property in `corpus-frontend.properties` and copy the content of `interface-defaults` to this directory.

# XSD files

Before indexing them using Blacklab, XML files can be validated using the xsd files:

```
xmllint --schema /path/to/xsd/safar-stemmer.xsd --noout /path/to/xml/file.xml
```
