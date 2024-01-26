#! /bin/sh

FLAMBDA_INSTALL_PREFIX="$(esy -P ./flambda-backend echo '#{self.install}')"

FLAMBDA_OCAML="$FLAMBDA_INSTALL_PREFIX/bin/ocamlopt"
OCAML5="$(esy which ocamlopt)"

"$FLAMBDA_OCAML" -g -gno-upstream-dwarf -c ./hello.ml -o flamba.o
"$OCAML5" -g -c ./hello.ml -o vanilla.o

"$FLAMBDA_OCAML" -g -gno-upstream-dwarf -o flambda.a.out hello.ml
"$OCAML5" -g -o vanilla.a.out hello.ml

dwarfdump -a ./flamba.o  > flambda-obj-dump.out
dwarfdump -a ./vanilla.o  > vanilla-obj-dump.out
