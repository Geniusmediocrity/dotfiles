# Grep Conspect

* command: ``` grep -l "\<string\>" \<file\> ``` -- give list of files with this row
* command: ``` grep -L "\<string\>" \<file\> ``` -- give list of files where no this row

* command: ``` grep -n "\<string\>" \<file\> ``` -- show row number of finding string
* command: ``` grep -m "\<string\>" \<file\> ``` -- don't search any further after mentioned number of occurrences

* command: ``` grep -A "\<string\>" \<file\> ``` -- output the number of lines after the occurrence
* command: ``` grep -! "\<string\>" \<file\> ``` -- output this number before occurrence
* command: ``` grep -! "\<string\>" \<file\> ``` -- output this number arround(aftervand before) the occurrence