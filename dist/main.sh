#!/usr/bin/env bash
set -uo pipefail
a="A"
b="B"
echo $a''$b'C'  
echo "stdout"  
echo "stderr" 2>& 1 
