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