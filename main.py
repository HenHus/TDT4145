import AvangerOgAnkomster as AOA
import Oversikt

def intro():
    print("\n\n\n\nVi har følgende funksjonaliteter:", end="\n\n\n")
    print("1 -- En enklel oversikt over flyselskap, flytyper som flyselskaper bruker, og hvor mange fly av flytypene (SQL-spørring)", end="\n\n")
    print("2 -- Oversikt over avganger og ankomster til en gitt flyplass på en gitt dag", end="\n\n")


def main():
    print("\n\nDette er en simpel applikasjon som henter ut imformasjon om luftfart i Norge.", end="\n\n")

    while True:
        intro()
        valg = input("\n\n\nSkriv inn hvilket nummer for funksjonaliteten du vil bruke (Trykk enter for å avslutte): ")

        if valg == "":
            print("Goodbye.")
            break
        elif valg == "1":
            Oversikt.main()
        elif valg == "2":
            AOA.HentAvgangerOgAnkomster()


main()