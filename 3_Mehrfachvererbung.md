

# Mehrfachvererbung

![](assets/markdown-img-paste-20170923193841785.png){width=500}

## Mehrfachvererbung in C++

C++ erlaubt Klassen-Mehrfachvererbung

Beispielanwendung: GUI-Fenster mit Rand und Menüleiste

![](assets/markdown-img-paste-20170923193812170.png){width=500}


	class Window {
		virtual int area() { ... }
		virtual void g() { ... }
		virtual void h() { ... }
	};
	class BW : public virtual Window {
		virtual int area() { ... }
	};
	class MW : public virtual Window {
		virtual void g() { ... }
	};
	class BMW : public BW, public MW {
		virtual void h() { ... }
	};


	BMW* bmw = new BMW(); // bmw i s t Zeiger auf BMW −Objekt
	MW* mw = bmw; // I m p l i z i t e r Upcast
	mw->area(); // Ruft BW: : area ( ) auf !

### Nicht-virtuelle Vererbung in C++

* Standardvererbungstyp
* Durchgezogene Linie im Klassendiagramm
* nur von historischer Bedeutung

class BW : public W { ... };

![Klassendiagramm mit nicht-virtueller Vererbung](assets/markdown-img-paste-20170923194859283.png){width=500}

![Subobjekte im Speicher. Mit Pointer `bmw` auf Hauptobjekt ](assets/markdown-img-paste-20170923194449338.png){width=500}


### virtuelle Vererbung in C++

* Schlüsselwort `virtual`
* Gestrichelte Linie im Klassendiagramm
* Unterklassenobjekt enthält Zeiger auf Oberklassenobjekt
* in der Praxis verwendet

	class BW : public virtual W { ... };

![Virtuelle Vererbung im Speicher](assets/markdown-img-paste-2017092319471080.png){width=500}

![Klassendiagramm mit virtueller Vererbung](assets/markdown-img-paste-20170923194728155.png){width=500}

![virtuelle Vererbung](assets/markdown-img-paste-20170923194216745.png){width=200}


## Subobjektgraphen

![links: Klassendiagramm, mitte: Subobjektgraph, rechts: Objektlayout ](assets/markdown-img-paste-20170923195314298.png){width=500}
