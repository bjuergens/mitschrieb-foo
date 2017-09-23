

# Invarianten und sichere Vererbung

## Motivation

`class U extends O`

**Typkonformanz**: Jedes `U` ist auch als `O` verwendbar, denn es hat mindestens die selben Members im `O`-Subobjekt

Problem: U kann O -Methode so umdefinieren,dass sie etwas völlig anderes macht

⇒ Stärkere Forderung:

**Subtyping**: Klientencode funktioniert auch mit U statt O

Andere Namen:

* **Verhaltenskonformanz**
* Klientencode-Wiederverwendung
* Liskov’sches Substitutionsprinzip [LW94]
* Inclusion Polymorphism

## Verhaltenskonformanz

Für Klienten sichere Vererbung erfordert Verhaltenskonformanz

Aus Sicht des Methoden**verhaltens** ist jedes U -Objekt auch ein O -Objekt.

→ Man kann `O` durch `U` ersetzen und garantieren, dass nicht kaputt geht

Anwendung: Implmentierung von Oberlasse oder Interface

### Vokabeln


**Klasseninvariante**:
Wird pro Klasse definiert.
Gilt vor und nach jedem Methodenaufruf.

**Precondition**: Wird pro Methode definiert.
Muss gelten, damit die Methode aufgerufen werden darf. _Das, was die Methode braucht_

**Postcondition**: Wird pro Methode definiert. Gilt nachdem die Methode durchgelaufen ist. _Das, was die Methode tut_

### Realisierung Verhaltenskonformanz

Klasseninvariante von Unterklasse $U$ ist stärker als von Oberklasse $O$:

$$INV ( U ) ⇒ INV ( O )$$

stärkere Vorbedingung in Oberklasse: _Oberklasse verlangt mehr_

$$PRE (O.m) ⇒ PRE (U.m)$$

stärkere Nachbedingung in UnterklasseD _Unterklasse leistet mehr_

$$POST (U.m) ⇒ POST (O.m)$$


![alternative Darstellung](assets/markdown-img-paste-20170920160746866.png){width=200}


## Weitere Verhaltensbeziehungen

### Spezialisierung

= _Gegenteil von Verhaltenskonformanz_

Problem: Verhaltenskonformanz in der Praxis selten, weil schwierig umzusetzen

Häufiger: Spezialisierung. (leistet auch etwas, jedoch was ganz anderes)

![](assets/markdown-img-paste-20170923155316405.png){width=500}

Anwendung: Implementierung für Spezialfälle

### Verhaltenskovarianz

Implikation in Vererbungsrichtung

![](assets/markdown-img-paste-20170923155454321.png){width=500}

### Verhaltenskontravarianz

Implikation entgegen Vererbungsrichtung

![](assets/markdown-img-paste-20170923155507840.png){width=500}


## Inheritance is not Subtyping

Inheritance → Spezialisierung

Subtyping → Verhaltenskonformanz

→ Trennung von Klassen und Typen

Java: Interfaces für Subtyping, Klassenvererbung für Inheritance
