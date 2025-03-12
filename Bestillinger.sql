-- Sett inn en kunde hvis de ikke allerede finnes
INSERT INTO Kunde (KundeNr, Navn, Telefonnummer, Epost, Nasjonalitet)
VALUES (15, 'Ola Nordmann', '98765432', 'ola.nordmann@example.com', 'Norsk');

-- Sett inn et billettkjøp for kunden Ola Nordmann
INSERT INTO Billettkjop (Referansenummer, KundeNr, TotalPris, StartFlyplass, SluttFlyplass)
VALUES (1012, 15, 8990, 'BOO', 'TRD');

-- Sett inn 10 billetter for flyvning WF1302 den 1. april 2025
INSERT INTO Billett (BillettID, Lopenummer, Flyvningsnummer, Flyrutenummer, Referansenummer, Sete, TidspunktInnsjekk, Kategori, Pris)
VALUES 
    (2051, '2025-04-01-WF1302', 0, 'WF1302', 1012, '1C', '2025-04-01 12:00:00', 'Økonomi', 899),
    (2052, '2025-04-01-WF1302', 0, 'WF1302', 1012, '1D', '2025-04-01 12:00:00', 'Økonomi', 899),
    (2053, '2025-04-01-WF1302', 0, 'WF1302', 1012, '2A', '2025-04-01 12:00:00', 'Økonomi', 899),
    (2054, '2025-04-01-WF1302', 0, 'WF1302', 1012, '2B', '2025-04-01 12:00:00', 'Økonomi', 899),
    (2055, '2025-04-01-WF1302', 0, 'WF1302', 1012, '3A', '2025-04-01 12:00:00', 'Økonomi', 899),
    (2056, '2025-04-01-WF1302', 0, 'WF1302', 1012, '3B', '2025-04-01 12:00:00', 'Økonomi', 899),
    (2057, '2025-04-01-WF1302', 0, 'WF1302', 1012, '4A', '2025-04-01 12:00:00', 'Økonomi', 899),
    (2058, '2025-04-01-WF1302', 0, 'WF1302', 1012, '4B', '2025-04-01 12:00:00', 'Økonomi', 899),
    (2059, '2025-04-01-WF1302', 0, 'WF1302', 1012, '6A', '2025-04-01 12:00:00', 'Økonomi', 899),
    (2060, '2025-04-01-WF1302', 0, 'WF1302', 1012, '6B', '2025-04-01 12:00:00', 'Økonomi', 899);

