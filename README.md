
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

Das markdown kompiliere ich mit `pandoc` über eine makefile. D.h. wenn pandoc installiert ist, reicht ein Aufruf von

`make html`

, um das HTML zu erstellen
Das Ergebnis schaue ich mir mit Firefox (ggf. mit Addon _Owl - Dark Background_) an.


## Workflow

Atom Texteditor mit Plugins:

* [markdown-preview-enhanced](https://atom.io/packages/markdown-preview-enhanced)
* [markdown-img-paste](https://atom.io/packages/markdown-img-paste)

wobei ich markdown-img-paste erweitert habe, sodass eine default width von 500 gesetzt wird.

ggf. müssen bei `markdown-preview-enhanced` die pandoc-parameter aus der makefile eingestellt werden.

Wenn ich nur lesen will, benutze ich dieses Nemo-Plugin:  https://github.com/wotanii/nemo-action-pandoc2ff
