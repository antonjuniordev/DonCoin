#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

DONCOIND=${DONCOIND:-$SRCDIR/doncoind}
DONCOINCLI=${DONCOINCLI:-$SRCDIR/doncoin-cli}
DONCOINTX=${DONCOINTX:-$SRCDIR/doncoin-tx}
DONCOINQT=${DONCOINQT:-$SRCDIR/qt/doncoin-qt}

[ ! -x $DONCOIND ] && echo "$DONCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($DONCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for doncoind if --version-string is not set,
# but has different outcomes for doncoin-qt and doncoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$DONCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $DONCOIND $DONCOINCLI $DONCOINTX $DONCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
