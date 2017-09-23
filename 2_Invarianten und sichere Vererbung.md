

# Invarianten und sichere Vererbung

## Motivation

**Typkonformanz**: Jedes U ist auch als O verwendbar, denn es hat mindestens die selben Members im O -Subobjekt

Problem: U kann O -Methode so umdefinieren,dass sie etwas völlig anderes macht

⇒ Stärkere Forderung:

**Subtyping**: Klientencode funktioniert auch mit U statt O

Andere Namen:

* **Verhaltenskonformanz**
* Klientencode-Wiederverwendung
* Liskov’sches Substitutionsprinzip [LW94]
* Inclusion Polymorphism

## Verhaltenskonformanz

Aus Sicht des Methodenverhaltens ist jedes U -Objekt auch ein O -Objekt.

![](assets/markdown-img-paste-20170920160746866.png){width=500}
