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


INSERT INTO Flytype (Navn, Flyprodusent, Produksjonstart, Produksjonsslutt, Seterader, Setekolonner)
VALUES ('Boeing 737-800', 'The Boeing Company', 1997, 2020, 31, 6),
       ('Airbus a320neo', 'Airbus Group', 2016, NULL, 30, 6),
       ('Dash-8 100', 'Dash-8', 1984, 2005, 4, 2);