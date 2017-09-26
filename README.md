
# mitschrieb-foo

Preview: https://rawgit.com/wotanii/mitschrieb-foo/master/build.html

Dies ist meine Prüfungsvorbereitung für

_Fortgeschrittene Objektorientierung_ bei _Prof. Snelting_ am _KIT_

Für Korrekturen und Hinweise bis zum 2.10.2017 bin ich dankbar. Danach interessiert es mich nicht mehr.

Schwerpunkt meiner Vorbereitung ist alles, was:

* praxisrelevant ist
* sicher in der Klausur drann kommt

Dementsprechend ziele ich auf eine 2.3, rechne jedoch mit eine 3.3 als Endnote.

Am Ende werde ich das hier ausrdicken und mit in tie Klausur nehmen

## Kompilierung

Das markdown kompiliere ich mit `pandoc` mit folgenden Parametern:

`-f markdown-raw_tex+tex_math_single_backslash --mathjax --smart --standalone --normalize`

und das Ergebnis schaue ich mir mit Firefox (ggf. mit Addon _Owl - Dark Background_) an.

Bonus: dieses CSS: https://gist.github.com/killercup/5917178


## Workflow

Atom Texteditor mit Plugins:

* [markdown-preview-enhanced](https://atom.io/packages/markdown-preview-enhanced)
* [markdown-img-paste](https://atom.io/packages/markdown-img-paste)

wobei ich markdown-img-paste erweitert habe, sodass eine default width von 500 gosetzt wird.

Wenn ich nur lesen will, benutze ich dieses Nemo-Plugin:  https://github.com/wotanii/nemo-action-pandoc2ff
