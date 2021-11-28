#!/bin/bash
set -euo pipefail

build() {
  src=$1
  shift
  base=${src%.*}
  [ ! bin_files/${base}.bin -nt ${src} ] && (
    as65 -v -l -m -w -h0 $@ ${src}
    mv -f ${base}.{bin,lst} bin_files/
  )
}

for src in *.a65; do
  build ${src}
done

for src in *.a65c; do
  build ${src} -x
done
