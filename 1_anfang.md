
**FOO**



# Allgemeine Konzepte

## Vokabeln

* Objekt
	* context abhängig, meistens ="Bezugsobjekt"
* Bezugsobjekt
	* =  vpointer + alle subobjekte
	* ist struct im Speicher
	* 1 pro Instanzierung
	* Größe und relative Positionen innerhalb stehen zur compile time fest
	* Absolute Position im Speicher steht zur run time fest
* statischer Typ
	* Typ zur compile time
* dynamischer Typ
	* Typ zur run time
* up cast/down cast
	* ändern des statischen Types (bei C++ und Java)
* virtual
	* immer, wenn dem Stoustrup kein Wort eingefallen ist
* verdeckt
	* bei dynamisch: = überschrieben
	* bei statisch: = versteckt


## Dynamische Bindung

Member: immer statisch

Funktionen:

* öffentlich immer dynamisch
* privat: immer statisch

Zugriff auf verdeckte Member:

* bei Statischer Bindung:
	* upcast dann Zugriff
* bei dynamischer Bindung:
	* C++:
		*  `::`
		* scope operator
		* in Methoden: `K::c()`
		* außerhalb: `o.K::c()`
	* Java:
		* `super`
		* direkte Oberklasse
		* in Methoden: `super.c()`
		* außerhalb: verboten
	* `super` und `::` schalten dynamische Bindung ab


### Upcasts und dynamische Bindung

**Upcasts schalten nicht die dynamische Bindung ab!**

und downcasts?

### this-Zeiger

ganz normaler pointer mit statischer Typ = aktuelle Klasse.

$\Rightarrow$ es gilt dynamische Bindung

## Subobjekte

subobjekte sind der Grund, weshalb statische Bindung geht.

* pro Objekt ein supobjekt pro (geerbter) Klasse
* layout:
	* ganz oben: v-pointer
	* oben: geerbte Attribute
	* unten: eigene Attribute
* Zugriff über statische offsets zur compile time


## v-table

v-table sind Grund weshalb dynamische Bindung geht.

* global eine v-table pro Klasse
* jedes Bezugsobjekt hat einen v-pointer, der auf die v-table seiner Klasse zeigt
* enthält Einsprungadressen der Methoden:
	* 1 Eintrag pro Methode
	* redefinierte Methoden überschreiben geerbte Methoden
* Position in vtable wird zur compile time bestimmt
* Position des v-pointer: immer gleich im Bezugsobjekt (i.d.R ganz am Anfang)
* Zugriff zur run time:

		load [x + OFFSET VPTR], reg0
		load [reg0 + OFFSET g], reg1
		call reg1


## Abschalten dynamischer Bindung

bei folgendem wird immer statisch gebunden:

* private methoden
* attribute
* `super` (java only)

was ist mit `::`? (z.B. `o.K::f()`) (Vorsicht: `((K)o).f()` ist was anderes)

In den Fällen wird bereits zur compile Zeit die Adresse der Funktion eingetragen ohne den Umweg über die v-table zu gehen.

## Type Casts

		class O { int a, b; }
		class U extends O { int b, c; }

		O x = new U()

Durch casts wird *nur* ein anderes Subobjekt ausgewählt

![1 Objekt, 2 Typen](assets/markdown-img-paste-2017091416083689.png){width=500}

--> member werden sichtbar, Methoden aber nicht.

down cast: unsicher, schlechter stil

## Objektbegriff

Ziel von Objektorientierung:

* Geheimnisprinzip
* Lokalitätsprinzip

Klassifikation von OO-Sprachen

* Typisierung
	* statisch: c++, java
	* dynamisch: self, smalltalk
* Methodenaufrufe
	* echte Klassen: c++, java
	* objektbasiert ohne Klassen: javascript
* Abstraktion
	* statisch Schnittstellen
	* Zugriffsrechte für Klassen


![Historische Entwicklung](assets/markdown-img-paste-20170920155237820.png){width=500}


## Tücken der dynamischen Bindung

**Dynamische Bindung greift auch bei Rekursion!**

d.h. wenn man versucht mit `super.m()` eine Rekursive Methode `m` im parent aufzurufen, dann kann es sein, dass die zweite Iteration wieder in der cildklasse ist, auch wenn die erste Iteration im parent war. (Vorraussetzung: `m` wird in childklasse überschrieben)

**Dynamische Bindung im Konstruktor**

Im Funktionen, die im parent Konstrutor aufgerufen werden, können in Childklase überschrieben werden.

+ Kontruktoren von der Childklasse mussen immer den Kontruktor vom parent aufrufen.