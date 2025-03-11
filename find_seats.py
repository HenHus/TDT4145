import sqlite3

DB_FILE = "FFly.db"

def seatconfig(flyrutenummer, lopenummer):

    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()

    cursor.execute("""
            SELECT F.Radnummer, F.Setekonfigurasjon
            FROM Flyradkonfigurasjon AS F
            JOIN Fly ON F.Flytype = Fly.Flytype
            JOIN Flyvning ON Fly.RegNr = Flyvning.FlyRegNr
            WHERE Flyvning.Lopenummer = ? AND Flyvning.Flyrutenummer = ?
        """, (lopenummer, flyrutenummer))
    
    rader = cursor.fetchall()
    conn.close

    seter = []

    for radnummer, setestreng in rader:
        setebokstaver = setestreng.replace(" ", "")
        for plass in setestreng:
            seter.append(f"{radnummer}{plass}")
    return seter

def taken_seats(flyrutenummer, lopenummer):
    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()

    cursor.execute("""
        SELECT Sete FROM Billett 
        WHERE Lopenummer = ? AND Flyrutenummer = ?
    """, (lopenummer, flyrutenummer))
    opptatteseter = cursor.fetchall()
    conn.close

    opptatteseter2 = set()
    for sete in opptatteseter:
        opptatteseter2.add(sete[0])

    return opptatteseter2

def available_seats(flyrutenummer, lopenummer):
    alle_seter = seatconfig(flyrutenummer, lopenummer)
    
    opptatte_seter = taken_seats(flyrutenummer, lopenummer)
    
    ledige_seter = [sete for sete in alle_seter if sete not in opptatte_seter]

    return ledige_seter

def main():
    available_seats()

main()


    