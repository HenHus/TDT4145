import sqlite3

# Funksjon som henter ut oversikt gjennom å kjøre Oversikt.sql scriptet
def oversikt(database, sql_script_file="Oversikt.sql"):

    conn = sqlite3.connect(database)
    cur = conn.cursor()

    with open(sql_script_file, 'r', encoding='utf-8') as file:
        query = file.read()

    cur.execute(query)
    flyplasser = cur.fetchall()
    conn.close()

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