-- Sett inn en kunde
INSERT INTO Kunde (KundeNr, Navn, Telefonnummer, Epost, Nasjonalitet)
VALUES (NULL, 'Ali Lee', '98765432', 'Ali.Lee@mail.com', 'Norsk');

-- Sett inn et billettkjøp og hent siste `KundeNr`
INSERT INTO Billettkjop (Referansenummer, KundeNr, TotalPris, StartFlyplass, SluttFlyplass)
VALUES (NULL, (SELECT KundeNr FROM Kunde ORDER BY KundeNr DESC LIMIT 1), 8990, 'BOO', 'TRD');


-- Oppretter 10 billetter for WF1302 1.april 2025 
INSERT INTO Billett (BillettID, Lopenummer, Flyvningsnummer, Flyrutenummer, Referansenummer, Sete, TidspunktInnsjekk, Kategori, Pris)
VALUES 
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '1C', '2025-04-01 12:00:00', 'Økonomi', 899),
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '1D', '2025-04-01 12:00:00', 'Økonomi', 899),
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '2A', '2025-04-01 12:00:00', 'Økonomi', 899),
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '2B', '2025-04-01 12:00:00', 'Økonomi', 899),
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '3A', '2025-04-01 12:00:00', 'Økonomi', 899),
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '3B', '2025-04-01 12:00:00', 'Økonomi', 899),
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '4A', '2025-04-01 12:00:00', 'Økonomi', 899),
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '4B', '2025-04-01 12:00:00', 'Økonomi', 899),
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '6A', '2025-04-01 12:00:00', 'Økonomi', 899),
    (NULL, '2025-04-01-WF1302', 0, 'WF1302', (SELECT Referansenummer FROM Billettkjop ORDER BY Referansenummer DESC LIMIT 1), '6B', '2025-04-01 12:00:00', 'Økonomi', 899);