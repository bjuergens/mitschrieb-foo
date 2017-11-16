
# mitschrieb-foo

Preview: https://rawgit.com/wotanii/mitschrieb-foo/master/build.html

Dies ist meine Prüfungsvorbereitung für _Fortgeschrittene Objektorientierung_ bei _Prof. Snelting_ am _KIT_

Schwerpunkt meiner Vorbereitung ist alles, was:

* praxisrelevant ist
* sicher in der Klausur drann kommt

Mit dieser Vorbereitung wurde die End Note 2.7 erreicht (SS 2017). 

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
