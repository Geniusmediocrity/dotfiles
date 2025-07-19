# Grep Conspect

* command: ``` grep -l "\<string\>" \<file\> ``` -- give list of files with this row
* command: ``` grep -L "\<string\>" \<file\> ``` -- give list of files where no this row

* command: ``` grep -n "\<string\>" \<file\> ``` -- show row number of finding string
* command: ``` grep -m "\<string\>" \<file\> ``` -- don't search any further after mentioned number of occurrences

* command: ``` grep -A \<number\> "\<string\>" \<file\> ``` -- output the number of lines [A]fter the occurrence
* command: ``` grep -B \<number\> "\<string\>" \<file\> ``` -- output this number [B]efore occurrence
* command: ``` grep -C \<number\> "\<string\>" \<file\> ``` -- output this number [C]ontenx arround(after and before) the occurrence