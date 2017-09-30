
# Typsysteme für Objektorientierung

_Anm. d. Red._: Kommt zwar vermutlich in Klausur dran, aber brauche ich in meinem Programmieralltag nicht. Daher wird hier nur sehr oberflächlich darauf eingegangen.

## TOC

<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=3 orderedList=true} -->
<!-- code_chunk_output -->

1. [TOC](#toc)
2. [Basis](#basis)
3. [Erweiterungen des Typsystems](#erweiterungen-des-typsystems)

<!-- /code_chunk_output -->



## Basis

## Erweiterungen des Typsystems

Bisher: Objekte als Records mit Subtyping und veränderbarem Zustand

Erweiterungen:

* this -Zeiger für Methoden
* Generische Klassen
	* Was ist der Typ einer generischen Klasse?
	* Kann man zwischen generischen Klassen oder ihren Instanzen Subtypen definieren?
* Rekursive Typen
	* Wie kann man einen Typ in sich selbst wiederverwenden?
	* `class Node { int data; Node next; }`
* Abstrakte Klassen
	* Was ist der Typ einer abstrakten Klasse?
	* Wie garantiert man, dass es eine Implementierung gibt?
