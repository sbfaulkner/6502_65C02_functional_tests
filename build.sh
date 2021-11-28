#!/bin/bash
set -euo pipefail

build() {
  src=$1
  shift
  as65 -l -m -w -h0 $@ ${src}
  mv -f ${src%.*}.{bin,lst} bin_files/
}

for src in *.a65; do
  build ${src}
done

for src in *.a65c; do
  build ${src} -x
done
