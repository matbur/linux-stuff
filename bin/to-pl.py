#!/usr/bin/env python

from pathlib import Path
import chardet
import sys

fn = sys.argv[1]
b = Path(fn).read_bytes()
Path(fn + '.bytes.backup').write_bytes(b)

enc = chardet.detect(b)['encoding']

t = b.decode(enc)
Path(fn + '.txt.backup').write_text(t)

m = {
    '¹': 'ą',
    'Æ': 'Ć',
    'æ': 'ć',
    'Ê': 'Ę',
    'ê': 'ę',
    '£': 'Ł',
    '³': 'ł',
    'ñ': 'ń',
    'Œ': 'Ś',
    'œ': 'ś',
    'Ÿ': 'ź',
    '¯': 'Ż',
    '¿': 'ż',
}

tt = t.translate(str.maketrans(m))

Path(fn).write_text(tt)

