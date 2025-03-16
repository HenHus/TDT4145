import sqlite3

def oversikt(database):
    conn = sqlite3.connect(database)
    cur = conn.cursor()

    cur.execute("""
        SELECT 
    f.Flyselskap AS Flyselskapkode,
    fs.Navn AS FlyselskapNavn,
    f.Flytype,
    COUNT(*) AS AntallFly
    FROM Fly f
    JOIN Flyselskap fs ON f.Flyselskap = fs.Flyselskapkode
    GROUP BY f.Flyselskap, f.Flytype
    ORDER BY fs.Navn, AntallFly DESC;

    """)
    flyplasser = cur.fetchall()
    return flyplasser

def vis_oversikt(flydata):
    if not flydata:
        print("Ingen data funnet.")
        return

    print("\n\n\n")
    print("OVERSIKT:", end="\n\n")
    print(f"{'Flyselskapkode':<15}{'FlyselskapNavn':<20}{'Flytype':<20}{'AntallFly':<10}")
    print("-" * 70)
    
    for flyselskapkode, flyselskapnavn, flytype, antallfly in flydata:
        print(f"{flyselskapkode:<15}{flyselskapnavn:<20}{flytype:<20}{antallfly:<10}")


def main():
    vis_oversikt(oversikt("Fly.db"))

if __name__ == "__main__":
    main()