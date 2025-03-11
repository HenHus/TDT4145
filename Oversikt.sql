-- Spørring for deloppgave 5
SELECT 
    f.Flyselskap AS Flyselskapkode,
    fs.Navn AS FlyselskapNavn,
    f.Flytype,
    COUNT(*) AS AntallFly
FROM Fly f
JOIN Flyselskap fs ON f.Flyselskap = fs.Flyselskapkode
GROUP BY f.Flyselskap, f.Flytype
ORDER BY fs.Navn, AntallFly DESC;
