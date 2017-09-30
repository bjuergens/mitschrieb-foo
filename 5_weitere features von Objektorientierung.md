
# weitere features von Objektorientierung

## TOC

<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=3 orderedList=true} -->
<!-- code_chunk_output -->

1. [TOC](#toc)
2. [Überladungen](#überladungen)
    1. [lookup](#lookup)
    2. [aufruf](#aufruf)
    3. [Smart-Pointer](#smart-pointer)
3. [Innere Klassen](#innere-klassen)
    1. [statische innere Klasse:](#statische-innere-klasse)
    2. [Dynamische innere Klassen](#dynamische-innere-klassen)
4. [Generics](#generics)
    1. [Typschranken](#typschranken)
    2. [Type Erasure](#type-erasure)
    3. [Vererbung bei generischen Klassen](#vererbung-bei-generischen-klassen)
    4. [Wildcards](#wildcards)

<!-- /code_chunk_output -->


## Überladungen

Jede überladene Variante hat eigenen vtable-Eintrag

Übliche Anwendung: Überladener Konstruktor

### lookup

* Java:
	* static lookup direkt mit Signatur
* C++:
	* static lookup mit Namen und bei Mehrdeutigkeit vergleich der Signatur
	* bei mehreren Kandidaten: wähle spezifischste Methode

"spezifischer": Alle parameter sind Unterklassen

⇒ Java findet andere Methode als c++

### aufruf

ganz normale Methodenaufruf mit dynamischer Bindung

Problem: Funktionen, die in Kindklasse gleich heißen, aber andere  Signatur haben, sehen aus als würden sie uberschreiben, tun sie aber nicht

### Smart-Pointer

Realisiert durch Überladung des `->` operators

## Innere Klassen

Klassendefinition innerhalb einer anderen Klassendefinition

übliche Anwendung: Iteratoren

### statische innere Klasse:

	* statisch
	* Zugriff nur auf statische Member der Äußeren Klasse
	* Äußeren Klasse kann auf nur statische Member zugreifen
	* Erstellung: `new AußenKlasse.InnenKlasse()`
		* Warum?

	class A {
		int x = 42;
		private static int y = B.u; // Okay
		public static class B {
			private static int u = 17; // Okay
			int z = x; // Fehler
		}
	}
	A.B b = new A.B();


### Dynamische innere Klassen

* dynamische innere Klasse darf auf nicht-statische Member der
äußeren Klasse zugreifen, auh private
* Jede Instanz von innerer Klasse hat impliziten Verweis auf Instanz der äußeren Klasse, ansprechbar über Outer.this

	class C {
	private int x = 42;
	private static int y =
	private int w = 17;
	class D {
		int z = x + y; // Okay
		int w = C.this.w; // Okay
		}
	}
	C	c = new C();
	C.D d = c.new D();

## Generics

Ziel: bessere Wiederverwendbarkeit in Libaries

* Java, C#: Bounded Polymorphism:
	* Parameter muss Unterklasse einer gewissen Klasse sein
	* ⇒ Verfügbarkeit von Methoden kann auch in generischen Klassen statisch geprüft werden

* Eiffel, C++: Parameterklasse kann mit irgendwas instanziiert werden
	*	⇒ generische Klasse nicht isoliert typcheckbar,	nur konkrete Instanzen
	*	⇒ Bibliotheken nicht statisch typprüfbar


### Typschranken

Ab java 1.5

Am Anfang von Klassen oder Methoden steht eine Typschranke und innerhalb der Klaase/Methode kann der Typ dann wie eine nermale Klaase benutzt werden.

### Type Erasure

implementierung in Java

Zur compile time alle verwendeten Varianten von Methoden vom compiler angelegt. Im Byte cod sieht man dann nur noch die Überladungen, und nichs mehr von den generics

### Vererbung bei generischen Klassen

Vererbung ganz normal

Typschranken dürfen spezieller werden


### Wildcards

für generics im Methodenparameter
