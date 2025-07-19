# Sed conspect

## What is sed
Sed is a stream editor: reads file from stdin(or from file) processes the, according to instructions and write to stdout

#### Example:
``` bash
cat <file> | sed <instruction>
```
are equivalence
``` bash
sed <instruction> <file>
```

If we want to erite to a file:
- \> \<file\> the usual redirection
- -i(--in-place) overwrite the input file

#### Example script

* This coma is change all John to Nick
``` bash
sed 's/John/Nick/g' old.txt > new.txt
```
__\* `s` is means substitute__
* Do the same thingas the previos script, but with different linus
``` bash
sed 's/Mike/Jordan/g' old.txt --in-place new.txt
```

* Change all words, that start with J and end in k to Nick
```bash
sed -r 's/J[a-zA-Z]*k/Nick/g' old.txt -i new.txt
```
__\* if you want to use regular expressions use `-r` flag, which means `--regexp-extended`__

* Print all rows from 2 to 4 inclusive
```bash
sed -n '2,4p' file.txt
```
_`p` means print_

* Print all rows except rows from 2 to 4 inclusive
``` bash
sed '2,4d' file.txt
```
_`d` means don't print_

* 