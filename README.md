# BlackLab indexing formats for SAFAR


## Analyzer

BlackLab indexing format `safar-analyzer.blf.yaml`

Word looks like (faked data- so don't count on working ids):
```
<word w_id="242" value="بكل" total_analysis="11">
	<analysis a_id="1" vowled="بَكْلُ" stem="بكل" pattern="فَعْلُ" root="بكل" pos="مفرد مذكر مرفوع في حالة الاضافة" number="مفرد" gender="مذكر" mood="مرفوع" caze="في حالة الاضافة " type="اسم جامد" prefix="#" suffix="#" additional_info="" />
</word>
```

* Empty word (`<word>` without `<analysis>`) is not a problem; the document is
indexed without error messages and the user can search for the word. It just
doesn't have stems, etc. associated with it.
* All occurrences of a multiple values annotation (e.g., stem) are indexed. If
you search for a stem that is indexed multiple times, you get multiple hits,
so it seems like a good idea to filter the analyses (we are not interested in the
different vowelizations of words).
