INSERT INTO Flyplass (Flyplasskode, Flyplassnavn)
VALUES ('OSL', 'Oslo Lufthavn, Gardermoen'),
       ('SVG', 'Stavanger Lufthavn, Sola'),
       ('BGO', 'Bergen Lufthavn, Flesland'),
       ('TRD', 'Trondheim Lufthavn, Værnes'),
       ('BOO', 'Bodø Lufthavn');

INSERT INTO Flyselskap (Flyselskapkode, Navn)
VALUES ('SK', 'SAS'),
       ('DY', 'Norwegian'),
       ('WF', 'Widerøe')

INSERT INTO Flyprodusent (Navn, Nasjonalitet, Stiftelsesar)
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
       ('Dash-8 100', 'Dash-8', 1984, 2005);

-- Tabell delvis generert med GitHub Copilot for å spare tid
INSERT INTO Flyradkonfigurasjon (Flytype, Radnummer, Setekonfigurasjon, Nodutgang)
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
         ('Boeing 737-800', 13, 'ABC DEF', 1),
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
         ('Airbus a320neo', 11, 'ABC DEF', 1),
         ('Airbus a320neo', 12, 'ABC DEF', 1),
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
         ('Dash-8 100', 5, 'AB CD', 1),
         ('Dash-8 100', 6, 'AB CD'),
         ('Dash-8 100', 7, 'AB CD'),
         ('Dash-8 100', 8, 'AB CD'),
         ('Dash-8 100', 9, 'AB CD'),
         ('Dash-8 100', 10, 'AB CD')

INSERT INTO Fly (RegNr, SerieNr, Navn, DriftetSiden, Flytype, Flyselskap)
('LN-ENU', 42069, NULL, 2015, 'Boeing 737-800', 'DY'),
('LN-ENR', 42093, 'Jan Bålsrud', 2018, 'Boeing 737-800', 'DY'),
('LN-NIQ', 39403, 'Max Manus', 2011, 'Boeing 737-800', 'DY'),
('LN-ENS', 42281, NULL, 2017, 'Boeing 737-800', 'DY'),
('SE-RUB', 9518, 'Birger Viking', 2020, 'Airbus a320neo', 'SK'),
('SE-DIR', 11421, 'Nora Viking', 2023, 'Airbus a320neo', 'SK'),
('SE-RUP', 12066, 'Ragnhild Viking', 2024, 'Airbus a320neo', 'SK'),
('SE-RZE', 12166, 'Ebbe Viking', 2024, 'Airbus a320neo', 'SK'),
('LN-WIH', 383, 'Oslo', 1994, 'Dash-8 100', 'WF'),
('LN-WIA', 359, 'Nordland', 1993, 'Dash-8 100', 'WF'),
('LN-WIL', 298, 'Narvik', 1995, 'Dash-8 100', 'WF')