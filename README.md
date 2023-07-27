# PowerShell-Skript "find" von Felix-MoBu

Das PowerShell-Skript mit dem Namen "find" ermöglicht es, Dateien in einem Verzeichnisbaum basierend auf einem Suchbegriff zu finden. Es bietet auch Optionen, um die Suche auf bestimmte Weise anzupassen und ermöglicht das Filtern nach Dateitypen.

## Installation

Das Script "find.ps1" kann auch ohne Installation gestartet werden, muss aber immer in den jeweiligen Ordner kopiert werden.

1. Das zweite mitgelieferte Script "install.ps1" starten.
2. Das gestartete Fenster gibt Auskunft über Erfolg und Misserfolg der Installation.
3. Suche ausführen, indem der Aufruf "find" gefolgt von den entsprechenden Parametern eingegeben wird.

## Parameter

Wenn der Suchbegriff als erstes steht, kann "-Search" weggelassen werden.

- **-Search (Erforderlich):** Suchbegriff der in den Dateien gefunden werden soll.
- **-NoRecurse (Optional):** Parameter verwenden, um Unterverzeichnisse aus der Suche auszuschließen.
- **-UseRegEx (Optional):** Parameter verwenden, um den Suchbegriff als Regular Expression zu interpretieren.
- **-Filter (Optional):** Parameter verwenden, um nach bestimmten Dateitypen zu filtern.

## Beispiele

```
find -Search "example" <--ist genau wie--> find "example"

find "pattern" -NoRecurse -Filter "*.txt"

find "^\d{3}-\d{2}-\d{4}$" -UseRegEx -Filter "*.csv"
```

## Ergebnis

Nachdem das Skript ausgeführt wurde, werden die Dateipfade der gefundenen Dateien angezeigt.
