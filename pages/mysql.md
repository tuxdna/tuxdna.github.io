---
layout: page
title: "MySQL"
description: "Notes on MySQL"
---

{% include JB/setup %}

# Export / Import

## Export H2DB data and Import into MySQL

Export data to CSV files from with in H2DB console

    CALL CSVWRITE('/path/to/output.csv', 'SELECT * FROM MY_ABCD_TABLE');

Import data into MySQL from CLI:

    CREATE TABLE MY_ABCD_TABLE(....);
    LOAD DATA INFILE '/path/to/output.csv' INTO TABLE MY_ABCD_TABLE FIELDS  TERMINATED BY ',' ENCLOSED BY '"'  LINES TERMINATED BY '\n' (.columns...);


## References

 * [MySQL return a "file not found error" when the file exists](http://ubuntuforums.org/showthread.php?t=822084)
 * [How can I get around MySQL Errcode 13 with SELECT INTO OUTFILE?](http://stackoverflow.com/questions/2783313/how-can-i-get-around-mysql-errcode-13-with-select-into-outfile)

