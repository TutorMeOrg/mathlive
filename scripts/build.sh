#!/bin/bash

set -e  # exit immediately on error
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes
set -x    # for debuging, trace what is being executed.

rm -rf dist

npx tsc

find dist -name '*.js' -exec sed -i '' -e 's/\.less/\.css?raw/g' {} \;

for f in css/*.less; do
  npx lessc "$f" "${f%.less}.css"
done
