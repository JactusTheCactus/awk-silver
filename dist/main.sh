#!/usr/bin/env bash
set -uo pipefail
s() { echo "#include <$1>"; }
cat <(s conf.ag)
a="A"
b="B"
echo $a''$b'C'  
echo "stdout"  
echo "stderr" 2>& 1 
