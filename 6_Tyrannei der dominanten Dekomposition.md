
# Tyrannei der dominanten Dekomposition

Ziel: Typsicherheit und Lokalitätsprinzip sind schwer zu veneinbaren.

Problem: Bei Erweiterungen in verschiedenen Hierarchien: Eine Hierarchie dominiert die andere

![Man kann nur schwer erweiterbare Expsennions _und_ Operationen haben](assets/markdown-img-paste-20170926133027613.png){width=200}

Objektorientierte Dekomposition:

	* Operationen als dynamisch gebundene Methoden
	* Neuer Datentyp kein Problem
	* Neue Operation erfordert Änderung aller Expression-Klassen
	* ⇒ **Datentypen dominieren Operationen**

Funktionale Dekomposition:

	* Operationen als Visitor-Objekte
	* Neue Operation kein Problem
	* Neuer Datentyp erfordert Änderung aller Visitor-Klassen
	* ⇒ **Operationen dominieren Datentypen**

Lösungsansätze:

* Multimethoden
	* z.B. in MultiJava
* Traits, Mixins und abstrakte Typmember
	* z.B. in Scala
* Virtuelle Klassen
	* z.B. in Beta
