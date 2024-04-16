

#!/bin/bash

find ~/mybash/sorted/ -name '*.txt' -exec mv -t ~/mybash/sorted/txtfiles/ -- {} +

find ~/mybash/sorted/ -name '*.key' -exec mv -t ~/mybash/sorted/keysfiles/ -- {} +
