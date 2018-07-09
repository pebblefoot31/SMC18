#!/usr/bin/env awk -f

# Problem Statement
#   Identify the individual or group of individuals who appear to be the expert in
#   a particular field or sub-field.
#   
#   Experts are people with high level of knowledge in a certain area. The
#   goal of this task is to employ different methods, for example modelling or
#   graph-based algorithms, and apply them on the dataset to discover people
#   with high level of expertise. The response to this task should include
#   example output, such as the model or graph developed with highlighted
#   important nodes or a list of names, and a description of tools and methods
#   used to produce the output. 

# step1. Filter the input to relevant columns: title, n_citation, author(s), year
# step2. Eliminate unnecessary content such as punctuation, non-printable chars and small words such as 1 letter and 2 letter words
# step3. Find the papers with high number of citations; authors of these papers would be considered experts.

BEGIN{
    FS="qwqw"
    OFS="\t"
    IGNORECASE=1

    # Field names
    id=1; title=2; num_authors=3; doi=4; fos_isbn=5; doctype_issn=6;
    lang=7; n_citation=8; issue=9; url=10; volume=11; page_start=12;
    page_end=13; year=14; venue=15; publisher_pdf=16; references=17;
    keywords=18; abstract=19; authors=20;
}

($0~topic && $num_authors > 0 && $n_citation!~/null/ && $n_citation>500){
    print $n_citation, $title, $authors, $year
}
