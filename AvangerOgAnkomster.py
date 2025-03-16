import sqlite3

def hent_flyplasser(database):
    conn = sqlite3.connect(database)
    cur = conn.cursor()
    cur.execute("""
        SELECT Flyplasskode, Flyplassnavn
        FROM Flyplass
    """)
    flyplasser = cur.fetchall()
    conn.close()
    return flyplasser

def vis_flyplasser(flyplasser):
    if not flyplasser:
        print("Ingen flyplasser funnet.")
        return

    print(f"{'Flyplasskode':<15} | {'Flyplassnavn'}")
    print("-" * 40)
    for kode, navn in flyplasser:
        print(f"{kode:<15} | {navn}")


def finn_ruter(database, flyplass, ukedag, ankomst_eller_avgang):

    conn = sqlite3.connect(database)
    cur = conn.cursor()

    if ankomst_eller_avgang == "avgang":
        cur.execute("""
            SELECT Flyrutenummer, PlanlagtAvgang, StartFlyplass, SluttFlyplass
            FROM Flyrute
            WHERE StartFlyplass = ? AND Ukedagskode LIKE ?
            ORDER BY PlanlagtAvgang
        """, (flyplass,  f'%{ukedag}%'))
    else:
        cur.execute("""
            SELECT Flyrutenummer, PlanlagtAnkomst, StartFlyplass, SluttFlyplass
            FROM Flyrute
            WHERE SluttFlyplass = ? AND Ukedagskode LIKE ?
            ORDER BY PlanlagtAnkomst
        """, (flyplass,  f'%{ukedag}%'))
        
    resultat = cur.fetchall()

    ruter_med_mellomlandinger = []
    for rute in resultat:
        flyrutenummer = rute[0]
        cur.execute("""
            SELECT Flyplasskode FROM Mellomlanding
            WHERE Flyrutenummer = ?
        """, (flyrutenummer,))
        mellomlandinger = [row[0] for row in cur.fetchall()]
        rute_mellomlanding = []

        for mellomlanding in mellomlandinger:
            add = False
            if ankomst_eller_avgang == "avgang" and mellomlanding != flyplass:
                rute_mellomlanding.append(mellomlanding)
            elif ankomst_eller_avgang == "avgang" and mellomlanding == flyplass:
                break
            elif ankomst_eller_avgang == "ankomst" and mellomlanding == flyplass:
                add = True
            elif ankomst_eller_avgang == "ankomst" and add:
                rute_mellomlanding.append(mellomlanding)




        ruter_med_mellomlandinger.append(rute + (rute_mellomlanding,))

    conn.close()
    return ruter_med_mellomlandinger

def vis_resultater(ruter, ankomst_eller_avgang):
    if not ruter:
        print("Ingen ruter funnet.")
        return

    header_tid = "Avgangstid" if ankomst_eller_avgang == "avgang" else "Ankomsttid"
    print(f"{'Flyrutenummer':<15}{header_tid:<12}{'Fra':<10}{'Til':<10}{'Mellomlandinger'}")
    print("-" * 60)

    for rute in ruter:
        flyrutenummer, tidspunkt, start, slutt, mellomlandinger = rute
        mellomlandinger_str = ", ".join(mellomlandinger) if mellomlandinger else "Flyr direkte"
        print(f"{flyrutenummer:<15}{tidspunkt:<12}{start:<10}{slutt:<10}{mellomlandinger_str}")
    
    print("\n")
    print("-" * 60)

def HentAvgangerOgAnkomster():

    print("Her kan du sjekke avganger og ankomster til flyplasser.\n\nSkriv inn en flyplasskode i listen under:", end="\n\n")

    while True:
        vis_flyplasser(hent_flyplasser('Fly.db'))
        print("\n\n\n")
        kode = input("Skriv flyplasskode her (Enter for å avslutte): ").upper()
        if kode:
            flyplasser = hent_flyplasser('Fly.db')
            gyldig_kode = any(kode == flyplass[0] for flyplass in flyplasser)
            if not gyldig_kode:
                print("Ugyldig flyplasskode. Vennligst prøv igjen.")
                continue

        if kode == "":
            print("Exiting...")
            break

        else:
            print("1 -- Mandag\n2 -- Tirsdag\n3 -- Onsdag\n4 -- Torsdag\n5 -- Fredag\n6 -- Lørdag\n7 -- Søndag", end="\n\n\n")
            while True:
                try:
                    ukedag = int(input("Velg ukedag (Skriv inn ETT tall): "))
                    if 1 <= ukedag <= 7:
                        break
                    else:
                        print("Ukedagen må være et tall mellom 1 og 7.")
                except ValueError:
                    print("Vennligst skriv inn et gyldig tall.")
            

            while True:
                type = input("Vil du se avganger eller ankomster? Spesifiser avgang eller ankomst: ").lower()
                if type in ["avgang", "ankomst"]:
                    break
                else:
                    print("Ugyldig valg. Vennligst spesifiser enten 'avgang' eller 'ankomst'.")
        

            ruter = finn_ruter('Fly.db', kode, ukedag, type)
            print("\n\n")
            vis_resultater(ruter, type)
            print("\n\n")

if __name__ == "__main__":
    HentAvgangerOgAnkomster()