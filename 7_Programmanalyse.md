
# Programmanalyse

Ziel:

* Optimierung:
	* wenig Speicher
	* entfernen von dynamischer Bindung
* Verständnis & debugging


**Beispiel**:

	class A { void f() { ... } }
	class B extends A { void f() { ... } }
	A p = new B();
	p.f();

⇒ `A.f()` wird neimals aufgerufen und kann entfernt werden

⇒ und `B::f()` kann statisich gebunden werden


## Eigenschaften:

* Statische Analyse: ohne Kompilat auszuführen
* Whole-Program-Analyse: Gesamtes Programm (inklusive Klassenhierarchie) bekannt


### Fluss-Sensitivität

Flusssensitive Programmanalysen

* Beachten Reihenfolge der Anweisungen
* Analyseergebnis pro Programmpunkt
* präziser und aufwendiger als Fluss-insensitive Analysen

Fluss**in**sensitive Programmanalysen

* Berechnen Analyseergebnis pro Programm
* ⇒ gleiches Ergebnis für alle Programmpunkte
* Sind unpräziser, aber schneller
* Ergebnis für p im Beispiel: p kann auf o 1 oder o 2 zeigen

Beispiel:

	Object p = new Object(); // o 1
	Object q = new Object(); // o 2
	p = q;

### Kontext-Sensitivität

Kontextsensitive Programmanalysen

* Beachten den Aufrufkontext einer Methode
* Berechnen Analyseergebnis pro Aufrufkontext und pro Methode
* Ergebnis im Beispiel:
	* Bei Aufruf aus f() kann x nur auf o 1 zeigen
	* Bei Aufruf aus g() kann x nur auf o 2 zeigen
* Sind präziser und aufwendiger

Kontext**in**sensitive Programmanalysen

* Ignorieren den Aufrufkontext einer Methode
* Berechnen Analyseergebnis pro Methode
* Ergebnis im Beispiel:
	* x kann auf o 1 oder o 2 zeigen
* Sind unpräziser, aber schneller

Beispiel:

	Object foo(Object x) { return x; }
	void f() { Object p = new Object(); /∗ o 1 ∗/ foo(p); }
	void g() { Object q = new Object(); /∗ o 2 ∗/ foo(q); }


## Rapid Type Analysis

Einfach und schnell, aber wirkungsvoll

**Ziele**: Entfernen toter Members, Eingrenzen dynamischer Bindung

**Idee**: Wenn nie ein C-Objekt erzeugt wird, dann kann
auch nie eine C-Methode aufgerufen werden! (außer von Unterklassen von C)

### Call Graph

**Knoten**: Alle Methoden `C::m(P1, ..., Pn)`, inklusive main()-Methode, Konstruktoren und Überladungen

**Kanten**: Kante von `C::f()` nach `D::g()` ⇔ `C::f()`  hat einen Aufruf `d.g()` mit d vom statischen Typ `D`

![_links_: Beispielprogramm, _rechts_: zugehöriger call graph](assets/markdown-img-paste-20170926171854747.png){width=500}

**Achtung bei dynamischer Bindung**: Alle potentiellen Ziele des Aufrufs `d.g()` müssen berücksichtigt werden, also auch alle `E::g()` für alle Unterklassen `E` von `D`

### Umgang mit dynamischer Bindung

Konservative Approximation:

Es wird nie ein möglicher Aufruf vergessen, aber manche Aufrufe werden fälschlich als möglich angenommen.

⇒ Menge der Aufrufziele ist manchmal zu groß, aber nie zu klein!

### Reduktion des Call-Graphs

Problem: Durch dyn. Bindung viele unnötige Kanten im Call-Graph

Lösung: finde Konstruktoren, die **nie** aufgerufen werden und entferne alle Methoden dieser Klasse

![Klasse, die niemals instanziiert wird, kann entfernt werden](assets/markdown-img-paste-20170926172427452.png){width=500}

**Algorithmus**:

1. starte mit Call-Graph (, der dynamische Bindung berücksichtigt)
2. markiere alle Kanten zu virtuellen Methoden als _verboten_
3. markiere alle Kanten **von** `main()` **zu** Konstruktoren als _erlaubt_
4. while (keine neuen Kanten):
	5. Starte bei `main()` und markiere Knoten, die über _erlaubte_ Kanten erreichbar sind
	6. Wenn markierter Knoten Konstruktor von Klasse C ist, markiere alle Kanten als erlaubt, die die **von** markierten Knoten **zu** Methoden der VTable von C zeigen als _erlaubt_
7. Entferne alles, was von `main()` aus nicht über erlaubte Kanten erreichbar isr

**Achtung:** VTable von C kann auch ererbte Methoden enthalten ⇒ Methoden der Oberklasse können erlaubt werden, obwohl nie ein Oberklassenobjekt erstellt wird

Beispiel:

![Initialisierung](assets/markdown-img-paste-20170926173906937.png){width=500}

![Ergebnis](assets/markdown-img-paste-20170926173833208.png){width=500}

### RTA als Constraint-Problem

RTA auch als Constraint-Problem formulierbar:

* Menge R: Menge der „lebendigen“ Methoden
* Menge S: Menge der „lebendigen“ Klassen

![Inferenzregeln zur Bestimmung der Mengen R, S](assets/markdown-img-paste-20170926174214488.png){width=500}


### Fazit

* sehr schnell
	* da fluss- und kontext-insensitiv
	* Overhead bei Kompilierdauer < 5%
* Sehr effektiv bei Klassenbibliotheken
* sehr ungenau:
	* von vieln Objekten wird **nicht** jede Methode aufgerufen
	* Lösung ⇒ Zeiger-Analyse (nächstes Kapitel)

## Points-To-Analyse

Ziel: Bestimme für jeden Zeiger p , auf welche Objekte er zeigen
könnte

Points-To-Menge

$$PT (p) = \{ o_1 , o_2 , … , o_n \}$$

Problem: Potentiell werden unendlich viele Objekte erstellt (z.B. wegen `new` in Schleife)

⇒ betrachte nur einen Repräsentanten von jedem `new` im Programm

fun fact: Exakte Points-To-Analyse ist sogar mit Repräsentantentrick
unentscheidbar [Ramalingam 1994]


### Points-To-Graph

todo: hier morgen weitermachen

### nach Anderson

### nach Stengaard
