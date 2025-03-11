INSERT INTO Flyplass (Flyplasskode, Flyplassnavn)
VALUES ('OSL', 'Oslo Lufthavn, Gardermoen'),
       ('SVG', 'Stavanger Lufthavn, Sola'),
       ('BGO', 'Bergen Lufthavn, Flesland'),
       ('TRD', 'Trondheim Lufthavn, Værnes'),
       ('BOO', 'Bodø Lufthavn');

INSERT INTO Flyselskap (Flyselskapkode, Navn)
VALUES ('SK', 'SAS'),
       ('DY', 'Norwegian'),
       ('WF', 'Widerøe');

INSERT INTO Flyprodusent (Navn, Stiftelsesaar)
VALUES ('The Boeing Company', 1916),
       ('Airbus Group', 1970),
       ('De Havilland Canada', 1928);

INSERT INTO Produsentnasjonalitet (Flyprodusent, Nasjonalitet)
VALUES ('The Boeing Company', 'USA'),
       ('Airbus Group', 'Frankrike'),
       ('Airbus Group', 'Tyskland'),
       ('Airbus Group', 'Spania'),
       ('Airbus Group', 'Storbritannia'),
       ('De Havilland Canada', 'Canada');


INSERT INTO Flytype (Navn, Flyprodusent, Produksjonstart, Produksjonsslutt)
VALUES ('Boeing 737-800', 'The Boeing Company', 1997, 2020),
       ('Airbus a320neo', 'Airbus Group', 2016, NULL),
       ('Dash-8 100', 'De Havilland Canada', 1984, 2005);

-- Tabell delvis generert med GitHub Copilot for å spare tid
INSERT INTO Flyradkonfigurasjon (Flytype, Radnummer, Setekonfigurasjon)
VALUES ('Boeing 737-800', 1, 'ABC DEF'),
         ('Boeing 737-800', 2, 'ABC DEF'),
         ('Boeing 737-800', 3, 'ABC DEF'),
         ('Boeing 737-800', 4, 'ABC DEF'),
         ('Boeing 737-800', 5, 'ABC DEF'),
         ('Boeing 737-800', 6, 'ABC DEF'),
         ('Boeing 737-800', 7, 'ABC DEF'),
         ('Boeing 737-800', 8, 'ABC DEF'),
         ('Boeing 737-800', 9, 'ABC DEF'),
         ('Boeing 737-800', 10, 'ABC DEF'),
         ('Boeing 737-800', 11, 'ABC DEF'),
         ('Boeing 737-800', 12, 'ABC DEF'),
         ('Boeing 737-800', 14, 'ABC DEF'),
         ('Boeing 737-800', 15, 'ABC DEF'),
         ('Boeing 737-800', 16, 'ABC DEF'),
         ('Boeing 737-800', 17, 'ABC DEF'),
         ('Boeing 737-800', 18, 'ABC DEF'),
         ('Boeing 737-800', 19, 'ABC DEF'),
         ('Boeing 737-800', 20, 'ABC DEF'),
         ('Boeing 737-800', 21, 'ABC DEF'),
         ('Boeing 737-800', 22, 'ABC DEF'),
         ('Boeing 737-800', 23, 'ABC DEF'),
         ('Boeing 737-800', 24, 'ABC DEF'),
         ('Boeing 737-800', 25, 'ABC DEF'),
         ('Boeing 737-800', 26, 'ABC DEF'),
         ('Boeing 737-800', 27, 'ABC DEF'),
         ('Boeing 737-800', 28, 'ABC DEF'),
         ('Boeing 737-800', 29, 'ABC DEF'),
         ('Boeing 737-800', 30, 'ABC DEF'),
         ('Boeing 737-800', 31, 'ABC DEF'),
         ('Airbus a320neo', 1, 'ABC DEF'),
         ('Airbus a320neo', 2, 'ABC DEF'),
         ('Airbus a320neo', 3, 'ABC DEF'),
         ('Airbus a320neo', 4, 'ABC DEF'),
         ('Airbus a320neo', 5, 'ABC DEF'),
         ('Airbus a320neo', 6, 'ABC DEF'),
         ('Airbus a320neo', 7, 'ABC DEF'),
         ('Airbus a320neo', 8, 'ABC DEF'),
         ('Airbus a320neo', 9, 'ABC DEF'),
         ('Airbus a320neo', 10, 'ABC DEF'),
         ('Airbus a320neo', 13, 'ABC DEF'),
         ('Airbus a320neo', 14, 'ABC DEF'),
         ('Airbus a320neo', 15, 'ABC DEF'),
         ('Airbus a320neo', 16, 'ABC DEF'),
         ('Airbus a320neo', 17, 'ABC DEF'),
         ('Airbus a320neo', 18, 'ABC DEF'),
         ('Airbus a320neo', 19, 'ABC DEF'),
         ('Airbus a320neo', 20, 'ABC DEF'),
         ('Airbus a320neo', 21, 'ABC DEF'),
         ('Airbus a320neo', 22, 'ABC DEF'),
         ('Airbus a320neo', 23, 'ABC DEF'),
         ('Airbus a320neo', 24, 'ABC DEF'),
         ('Airbus a320neo', 25, 'ABC DEF'),
         ('Airbus a320neo', 26, 'ABC DEF'),
         ('Airbus a320neo', 27, 'ABC DEF'),
         ('Airbus a320neo', 28, 'ABC DEF'),
         ('Airbus a320neo', 29, 'ABC DEF'),
         ('Airbus a320neo', 30, 'ABC DEF'),
         ('Airbus a320neo', 31, 'ABC DEF'),
         ('Dash-8 100', 1, ' CD'),
         ('Dash-8 100', 2, 'AB CD'),
         ('Dash-8 100', 3, 'AB CD'),
         ('Dash-8 100', 4, 'AB CD'),
         ('Dash-8 100', 6, 'AB CD'),
         ('Dash-8 100', 7, 'AB CD'),
         ('Dash-8 100', 8, 'AB CD'),
         ('Dash-8 100', 9, 'AB CD'),
         ('Dash-8 100', 10, 'AB CD');

INSERT INTO Flyradkonfigurasjon (Flytype, Radnummer, Setekonfigurasjon, Nodutgang)
VALUES ('Boeing 737-800', 13, 'ABC DEF', 1),
         ('Airbus a320neo', 11, 'ABC DEF', 1),
         ('Airbus a320neo', 12, 'ABC DEF', 1),
        ('Dash-8 100', 5, 'AB CD', 1);

INSERT INTO Fly (RegNr, SerieNr, Navn, DriftetSiden, Flytype, Flyselskap)
VALUES ('LN-ENU', 42069, NULL, 2015, 'Boeing 737-800', 'DY'),
('LN-ENR', 42093, 'Jan Bålsrud', 2018, 'Boeing 737-800', 'DY'),
('LN-NIQ', 39403, 'Max Manus', 2011, 'Boeing 737-800', 'DY'),
('LN-ENS', 42281, NULL, 2017, 'Boeing 737-800', 'DY'),
('SE-RUB', 9518, 'Birger Viking', 2020, 'Airbus a320neo', 'SK'),
('SE-DIR', 11421, 'Nora Viking', 2023, 'Airbus a320neo', 'SK'),
('SE-RUP', 12066, 'Ragnhild Viking', 2024, 'Airbus a320neo', 'SK'),
('SE-RZE', 12166, 'Ebbe Viking', 2024, 'Airbus a320neo', 'SK'),
('LN-WIH', 383, 'Oslo', 1994, 'Dash-8 100', 'WF'),
('LN-WIA', 359, 'Nordland', 1993, 'Dash-8 100', 'WF'),
('LN-WIL', 298, 'Narvik', 1995, 'Dash-8 100', 'WF');

INSERT INTO Flyrute(Flyrutenummer, StartFlyplass, SluttFlyplass, Ukedagskode,Flyselskap,
    Flytype, PlanlagtAvgang, PlanlagtAnkomst, Oppstartsdato, SluttDato)
VALUES
    ('WF1311', 'TRD', 'BOO', '12345', 'WF', 'Dash-8 100', '15:15', '16:20', '2025-01-01'),
    ('WF1302', 'BOO', 'TRD', '12345', 'WF', 'Dash-8 100', '07:35', '08:40', '2025-01-01'),
    ('DY753', 'TRD', 'OSL', '1234567', 'DY', 'Boeing 737-800', '10:20', '11:15', '2025-01-01'),
    ('SK332', 'OSL', 'TRD', '1234567', 'SK', 'Airbus a320neo', '08:00', '09:05', '2025-01-01'),
    ('SK888', 'TRD', 'SVG', '12345', 'SK', 'Airbus a320neo', '10:00', '12:10', '2025-01-01');


INSERT INTO Mellomlanding(Flyrutenummer, Flyplasskode)
VALUES
    ('SK888', 'BGO');

INSERT INTO Flyvning (Lopenummer, Flyrutenummer, Flyvningsnummer, FlyRegNr, FlyStatus, StartFlyplass, SluttFlyplass, PlanlagtAvgangstid, PlanlagtAnkomsttid, BudsjettPris, OkonomiPris, PremiumPris)
VALUES
    ('2025-04-01-WF1302', 'WF1302', 0, 'LN-WIA', 'Planned', 'BOO', 'TRD', '07:35', '08:40', 599, 899, 2018),
    ('2025-04-01-DY753', 'DY753', 0, 'LN-ENU', 'Planned', 'TRD', 'OSL', '10:20', '11:15', 500, 1000, 1500),
    ('2025-04-01-SK888', 'SK888', 1, 'SE-DIR', 'Planned', 'TRD', 'BGO', '10:00', '11:10', 800, 1500, 2000),
    ('2025-04-01-SK888', 'SK888', 2, 'SE-DIR', 'Planned', 'BGO', 'SVG', '11:40', '12:10', 350, 700, 1000),
    ('2025-04-01-SK888', 'SK888', 0, 'SE-DIR', 'Planned', 'TRD', 'SVG', '10:00', '12:10', 1000, 1700, 2200);