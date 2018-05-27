#!/bin/bash

echo << EOF >> 111.txt
#!/bin/sh

echo hello
echo var1=$VAR1

EOF
chmod +x 111.txt
./111.txt
