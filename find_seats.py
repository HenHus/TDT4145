import sqlite3

DB_FILE = "Fly.db"

# Henter alle tilgjengelige flyvninger med løpenummer fra databasen.
def get_flights():
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

# Henter setekonfigurasjon for en gitt flyvning.
def seatconfig(flyrutenummer, lopenummer):
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

# Henter opptatte seter for en flyvning basert på flyvningsnummer og tidsmessig overlapp.
def taken_seats(flyrutenummer, lopenummer, flyvningsnummer):
    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()

    # Hent tidspunkt for den valgte flyvningen
    cursor.execute("""
        SELECT PlanlagtAvgangstid, PlanlagtAnkomsttid
        FROM Flyvning 
        WHERE Lopenummer = ? AND Flyvningsnummer = ?
    """, (lopenummer, flyvningsnummer))
    valgt_avgang, valgt_ankomst = cursor.fetchone()

    # Finn overlappende flyvningsnumre
    cursor.execute("""
        SELECT Flyvningsnummer 
        FROM Flyvning 
        WHERE Flyrutenummer = ? 
        AND Flyvningsnummer != ?
        AND (PlanlagtAvgangstid <= ? 
            AND PlanlagtAnkomsttid >= ?)
        OR (PlanlagtAvgangstid >= ? AND PlanlagtAnkomsttid <= ?)
    """, (flyrutenummer, flyvningsnummer, valgt_avgang, valgt_ankomst, valgt_avgang, valgt_ankomst))

    overlappende_flyvninger = {row[0] for row in cursor.fetchall()}

    if not overlappende_flyvninger:
        conn.close()
        return set()


    placeholders = ', '.join(['?'] * len(overlappende_flyvninger))
    query = f"""
        SELECT Sete FROM Billett 
        WHERE Flyvningsnummer IN ({placeholders})
    """
    cursor.execute(query, tuple(overlappende_flyvninger))
    opptatte_seter = {row[0] for row in cursor.fetchall()}
    conn.close()
    
    return opptatte_seter

# Finner ledige seter på en flyvning.
def available_seats(flyrutenummer, lopenummer,flyvningsnummer):
    alle_seter = seatconfig(flyrutenummer, lopenummer)
    opptatte_seter = taken_seats(flyrutenummer, lopenummer, flyvningsnummer)
    
    ledige_seter = [sete for sete in alle_seter if sete not in opptatte_seter]
    
    # Sorter setene basert på radnummer først, setebokstav deretter
    def sort_seats(seat):
        return int(seat[:-1]), seat[-1]
    
    ledige_seter.sort(key=sort_seats)
    
    return ledige_seter

# Hjelpefunksjon for å hente flyrutenummer basert på løpenummer.
def get_flightNumber(lopenummer):
    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()
    cursor.execute("SELECT Flyrutenummer FROM Flyvning WHERE Lopenummer = ?", (lopenummer,))
    flyrutenummer = cursor.fetchone()[0]
    conn.close()
    return flyrutenummer

# main funksjon for å interagere med bruker
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
    seter = available_seats(flyrutenummer, lopenummer, flyvningsnummer)
    
    print(f"\nLedige seter for flyvningen {startflyplass} → {sluttflyplass}:")
    print(", ".join(seter) if seter else "Ingen ledige seter.")

if __name__ == "__main__":
    main()
