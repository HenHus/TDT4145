import sqlite3

DB_FILE = "Fly.db"

def get_flights():
    """Henter alle tilgjengelige flyvninger med løpenummer fra databasen."""
    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT Lopenummer, StartFlyplass, SluttFlyplass, PlanlagtAvgangstid, Flyvningsnummer
        FROM Flyvning 
        ORDER BY PlanlagtAvgangstid
    """)
    
    flyvninger = cursor.fetchall()
    conn.close()
    
    return flyvninger

def seatconfig(flyrutenummer, lopenummer):
    """Henter setekonfigurasjon for en gitt flyvning og unngår duplikater."""
    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()
    
    cursor.execute("""
        SELECT DISTINCT F.Radnummer, F.Setekonfigurasjon
        FROM Flyradkonfigurasjon AS F
        JOIN Fly ON F.Flytype = Fly.Flytype
        JOIN Flyvning ON Fly.RegNr = Flyvning.FlyRegNr
        WHERE Flyvning.Lopenummer = ? AND Flyvning.Flyrutenummer = ?
    """, (lopenummer, flyrutenummer))
    
    rader = cursor.fetchall()
    conn.close()
    
    seter = set()
    for radnummer, setestreng in rader:
        setebokstaver = setestreng.replace(" ", "")
        for plass in setebokstaver:
            seter.add(f"{radnummer}{plass}")
    
    return sorted(seter)

def taken_seats(flyrutenummer, lopenummer):
    """Henter opptatte seter for en flyvning basert kun på tidsmessig overlapp."""
    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()
    
    # Hent tidspunkt for den valgte flyvningen
    cursor.execute("""
        SELECT PlanlagtAvgangstid, PlanlagtAnkomsttid 
        FROM Flyvning 
        WHERE Lopenummer = ?
    """, (lopenummer,))
    valgt_avgang, valgt_ankomst = cursor.fetchone()
    
    # Finn alle flyvninger på samme rute som overlapper i tid
    cursor.execute("""
        SELECT Lopenummer 
        FROM Flyvning 
        WHERE Flyrutenummer = ? 
        AND PlanlagtAvgangstid < ? 
        AND PlanlagtAnkomsttid > ?
    """, (flyrutenummer, valgt_ankomst, valgt_avgang))
    
    overlappende_lopenumre = {row[0] for row in cursor.fetchall()}
    
    # Inkluder alltid den valgte flyvningen i søket etter opptatte seter
    overlappende_lopenumre.add(lopenummer)

    # Hent opptatte seter på den valgte flyvningen + overlappende flyvninger
    cursor.execute(f"""
        SELECT Sete FROM Billett 
        WHERE Lopenummer IN ({','.join('?' * len(overlappende_lopenumre))})
    """, tuple(overlappende_lopenumre))

    opptatte_seter = {row[0] for row in cursor.fetchall()}
    conn.close()

    return opptatte_seter


def available_seats(flyrutenummer, lopenummer):
    """Finner ledige seter på en flyvning basert på tidsmessig overlapp."""
    alle_seter = seatconfig(flyrutenummer, lopenummer)
    opptatte_seter = taken_seats(flyrutenummer, lopenummer)
    
    ledige_seter = [sete for sete in alle_seter if sete not in opptatte_seter]
    ledige_seter.sort(key=lambda s: (int(s[:-1]), s[-1]))
    
    return ledige_seter

def get_flightNumber(lopenummer):
    """Henter flyrutenummer basert på løpenummer."""
    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()
    cursor.execute("SELECT Flyrutenummer FROM Flyvning WHERE Lopenummer = ?", (lopenummer,))
    flyrutenummer = cursor.fetchone()[0]
    conn.close()
    return flyrutenummer

def main():
    print("\nTilgjengelige flyvninger:")
    flyvninger = get_flights()
    
    if not flyvninger:
        print("Ingen flyvninger funnet.")
        return
    
    unike_flyvninger = []
    sett = set()
    
    for lopenummer, start, slutt, avgang, flyvningsnummer in flyvninger:
        if (lopenummer, start, slutt) not in sett:
            sett.add((lopenummer, start, slutt))
            unike_flyvninger.append((lopenummer, start, slutt, avgang, flyvningsnummer))
    
    for i, (lopenummer, start, slutt, avgang, flyvningsnummer) in enumerate(unike_flyvninger, start=1):
        print(f"{i}. {lopenummer} | {start} → {slutt} | Avgang: {avgang} | Flyvning #{flyvningsnummer}")
    
    try:
        valg = int(input("\nVelg en flyvning (tall): ").strip()) - 1
        lopenummer, startflyplass, sluttflyplass, _, flyvningsnummer = unike_flyvninger[valg]
    except (ValueError, IndexError):
        print("Ugyldig valg!")
        return
    
    flyrutenummer = get_flightNumber(lopenummer)
    seter = available_seats(flyrutenummer, lopenummer)
    
    print(f"\nLedige seter for flyvningen {startflyplass} → {sluttflyplass}:")
    print(", ".join(seter) if seter else "Ingen ledige seter.")

if __name__ == "__main__":
    main()
