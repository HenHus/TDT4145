import sqlite3
import AvangerOgAnkomster as AOA
import Oversikt

def insert_data(sql_file):

    conn = sqlite3.connect("Fly.db")
    try:
        with open(sql_file, 'r', encoding='utf-8') as file:
            sql_script = file.read()
        conn.executescript(sql_script)
        conn.commit()
        print("Data fra vedleggene ble lagt inn.")
    except Exception as e:
        conn.rollback()
        print(f"Error: {e}")
    
    conn.close()

def intro():
    print("\n\n\n\nVi har følgende funksjonaliteter:", end="\n\n\n")
    print("1 -- Legg in data i databasen fra vedlegg 1, 2 og 3", end="\n\n")
    print("2 -- En enklel oversikt over flyselskap, flytyper som flyselskaper bruker, og hvor mange fly av flytypene (SQL-spørring)", end="\n\n")
    print("3 -- Oversikt over avganger og ankomster til en gitt flyplass på en gitt dag", end="\n\n")


def main():
    print("\n\nDette er en simpel applikasjon som henter ut imformasjon om luftfart i Norge.", end="\n\n")

    while True:
        intro()
        valg = input("\n\n\nSkriv inn hvilket nummer for funksjonaliteten du vil bruke (Trykk enter for å avslutte): ")

        if valg == "":
            print("Goodbye.")
            break
        elif valg == "1":
            insert_data("FlyplassData.sql")
        elif valg == "2":
            Oversikt.main()
        elif valg == "3":
            AOA.HentAvgangerOgAnkomster()


main()