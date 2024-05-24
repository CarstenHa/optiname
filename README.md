# optiname
Ein kleines Tool, um Ordner-/Dateinamen unter Linux anzupassen.

**Vorbereitung**

Repo klonen:  
```bash
git clone https://github.com/CarstenHa/optiname
```

Installieren:  
```bash
cd optiname
./install.sh
```

Deinstallieren:  
```bash
./install.sh -u
```

Empfohlen ist das Installieren mit einem Symlink. Dann kann das Programm einfach mit:  
```bash
git pull
```
aktualisiert werden.

**Nutzung**

Hilfe:  
```bash
optiname -h
```
Standardmaßig werden ohne Aufruf von weiteren Optionen die Ordnernamen auf 64 Zeichen und die Dateinamen auf 128 Zeichen gekürzt. Die Anzahl der Zeichen kann aber individuell mit den Optionen -d (Ordner) und -f (Dateien) angepasst werden.  
Leer- und Sonderzeichen werden entfernt.

Viel Spaß mit diesem kleinen Programm :)

<https://github.com/CarstenHa/optiname>
