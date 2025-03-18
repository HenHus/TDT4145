# FlyDB – Del 2: Realisert Databasesystem
- Gruppemedlemmer: Birk Thomassen, Henning Kristiansen, Kristoffer Welle
## Introduksjon
Prosjektet innebærer utvikling av en databaseapplikasjon i **Python** med **SQLite**, som håndterer flyruter, flyplasser, flyselskaper, kunder og billettbestillinger for innenlandske flyvninger i Norge.

## Innhold i denne leveransen
Denne leveransen inneholder:
- **Python-kode** for databasehåndtering og spørringer.
- **SQL-skript** for å opprette og fylle databasen.
- **SQLite-databasefil** (tomme tabeller).

## Avhengigheter
Prosjektet krever følgende avhengigheter:
- **Python 3.12.x** – Hovedspråket for implementasjonen
- **SQLite3** – Innebygd databasesystem

## Brukerveiledning
For å starte applikasjonen:
```sh
python main.py
```

### Tilgjengelige funksjoner
1. Legg in data i databasen fra vedlegg 1, 2 og 3. Legg inn flyvninger for 1. april 2025 (Brukstilfelle 1-4).
2. En enkel oversikt over flyselskap, flytyper som flyselskaper bruker, og hvor mange fly av flytypene (SQL-spørring) (Brukstilfelle 5).
3. Miniprogram for oversikt over avganger og ankomster til en gitt flyplass på en gitt dag (Brukstilfelle 6).
4. Legg inn 10 bestillinger for WF1302 (BOO-TRD) tirsdag 1. april 2025 (Brukstilfelle 7).
5. Miniprogram for oversikt over ledige seter på en flyvning (Brukstilfelle 8).
<br>
NB! Output kan være lite synlig i terminalen pga. mange linjeskift (\n) og while-løkker.

## Endringer fra del 1
- Mulighet for multinasjonale flyprodusenter
- Endring av setekonfig for å støtte fly med ulike antall seter på en rad (f.eks, en rad med 4 seter og resten med 6 seter)

## Antakelser
- Ledige seter er seter som ikke er booket på den gitte flyvningen samt alle blokkerende flyvninger (f.eks for TRD-BGO-SVG er TRD-SVG blokerende for TRD-BGO)

## Bruk av KI
Vi har benyttet kunstig intelligens til følgende (Se i kode/script for spesifik bruk):
- **Feilsøking**
- **Forbedring/optimalisering**