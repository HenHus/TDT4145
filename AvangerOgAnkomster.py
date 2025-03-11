import sqlite3

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

def main():

    ruter = finn_ruter('Fly.db', 'TRD', '1', "avgang")

    vis_resultater(ruter, "avgang")

main()