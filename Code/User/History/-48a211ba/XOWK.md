# Find conspect

1. Search files and dirs mentioned size
``` find \<start-dir\> -s \<size\> ```

    Example:
    ``` find -s 100c ```

2. Search files and dirs, which weight less then mentioned size
``` find \<start-dir\> -s -\<size\> ```

    Example:
    ``` find -s -100k ```

3. Search files and dirs, which weight greater then mentioned size
``` find \<start-dir\> -s +\<size\> ```

    Example:
    ``` find -s +1G ```

## Notation for size search

* `c` - Bytes
* `k` - Kilo Bytes
* `M` - Mega Bytes
* `G` - Giga Bytes
* `b` - these are not bytes, but 512-Byte blocks (by default)


### P.S.

You can also search by file/dir access rights using `perm` and type `-type \<type\>` (f - regular file, d - directory). And generally build guiant searching expressions. 