-- Tabell for Flyplasser
CREATE TABLE Flyplass (
    Flyplasskode TEXT PRIMARY KEY,
    Flyplassnavn TEXT NOT NULL
);

-- Tabell for Flyselskaper
CREATE TABLE Flyselskap (
    Flyselskapkode TEXT PRIMARY KEY,
    Navn TEXT NOT NULL
);

-- Tabell for Flyprodusenter
CREATE TABLE Flyprodusent (
    Navn TEXT PRIMARY KEY,
    Nasjonalitet TEXT NOT NULL,
    Stiftelsesar INTEGER NOT NULL
);

-- Tabell for Flytyper
CREATE TABLE Flytype (
    Navn TEXT PRIMARY KEY,
    Flyprodusent TEXT NOT NULL,
    Produksjonstart INTEGER NOT NULL,
    Produksjonsslutt INTEGER,
    Setekapasitet INTEGER NOT NULL,
    FOREIGN KEY (Flyprodusent) REFERENCES Flyprodusent(Navn) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Fly
CREATE TABLE Fly (
    RegNr TEXT PRIMARY KEY,
    SerieNr TEXT NOT NULL,
    Navn TEXT,
    DriftetSiden INTEGER NOT NULL,
    Flytype TEXT NOT NULL,
    Flyselskap TEXT NOT NULL,
    FOREIGN KEY (Flytype) REFERENCES Flytype(Navn) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Flyselskap) REFERENCES Flyselskap(Flyselskapkode) ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (SerieNr, Flyselskap)
);

-- Tabell for Flyruter
CREATE TABLE Flyrute (
    Flyrutenummer TEXT PRIMARY KEY,
    StartFlyplass TEXT NOT NULL,
    SluttFlyplass TEXT NOT NULL,
    Ukedagskode TEXT NOT NULL,
    Flyselskap TEXT NOT NULL,
    Flytype TEXT NOT NULL,
    PlanlagtAvgang TEXT NOT NULL,
    PlanlagtAnkomst TEXT NOT NULL,
    Oppstartsdato TEXT NOT NULL,
    SluttDato TEXT,
    UNIQUE (Flyrutenummer, Flyselskap),
    FOREIGN KEY (Flytype) REFERENCES Flytype(Navn) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Flyselskap) REFERENCES Flyselskap(Flyselskapkode) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (StartFlyplass) REFERENCES Flyplass(Flyplasskode) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SluttFlyplass) REFERENCES Flyplass(Flyplasskode) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Flyvninger
CREATE TABLE Flyvning (
    Lopenummer TEXT NOT NULL,
    Flyrutenummer TEXT NOT NULL,
    FlyRegNr TEXT NOT NULL,
    FlyStatus TEXT,
    FaktiskAvgangstid TEXT,
    FaktiskAnkomsttid TEXT,
    PRIMARY KEY (Lopenummer, Flyrutenummer),
    FOREIGN KEY (Flyrutenummer) REFERENCES Flyrute(Flyrutenummer) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (FlyRegNr) REFERENCES Fly(RegNr) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Priser
CREATE TABLE FlyPriser (
    Lopenummer TEXT NOT NULL,
    Flyrutenummer TEXT NOT NULL,
    Kategori TEXT,
    Pris INTEGER NOT NULL,
    PRIMARY KEY (Lopenummer, Flyrutenummer, Kategori),
    FOREIGN KEY (Lopenummer, Flyrutenummer) REFERENCES Flyvning(Lopenummer, Flyrutenummer) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Kunder
CREATE TABLE Kunde (
    KundeNr INTEGER PRIMARY KEY,
    Navn TEXT NOT NULL,
    Telefonnummer TEXT NOT NULL,
    Epost TEXT NOT NULL,
    Nasjonalitet TEXT NOT NULL
);

-- Tabell for Fordelsprogram
CREATE TABLE Fordelsprogram (
    Referanse TEXT PRIMARY KEY,
    KundeNr INTEGER NOT NULL,
    Flyselskap TEXT NOT NULL,
    FOREIGN KEY (KundeNr) REFERENCES Kunde(KundeNr) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Flyselskap) REFERENCES Flyselskap(Flyselskapkode) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Billetter
CREATE TABLE Billett (
    BillettId INTEGER PRIMARY KEY,
    Lopenummer TEXT NOT NULL,
    Rutenummer TEXT NOT NULL,
    Kategori TEXT NOT NULL,
    Sete TEXT,
    TidspunktInnsjekk TEXT NOT NULL,
    FOREIGN KEY (Lopenummer, Rutenummer) REFERENCES Flyvning(Lopenummer, Flyrutenummer) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for kjøpte billetter
CREATE TABLE KjoptBillett (
    BillettId INTEGER PRIMARY KEY,
    Referansenummer TEXT NOT NULL,
    Kjopspris INTEGER NOT NULL,
    FOREIGN KEY (BillettId) REFERENCES Billett(BillettId) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Referansenummer) REFERENCES Billettkjop(Referansenummer) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Billettkjøp
CREATE TABLE Billettkjop (
    Referansenummer TEXT PRIMARY KEY,
    KundeNr INTEGER NOT NULL,
    Rutenummer TEXT NOT NULL,
    Startflyplass TEXT NOT NULL,
    Sluttflyplass TEXT NOT NULL,
    Totalpris INTEGER NOT NULL,
    FOREIGN KEY (KundeNr) REFERENCES Kunde(KundeNr) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Startflyplass) REFERENCES Flyplass(Flyplasskode) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Sluttflyplass) REFERENCES Flyplass(Flyplasskode) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Rutenummer) REFERENCES Flyrute(Flyrutenummer) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Bagasje
CREATE TABLE Bagasje (
    Registreringsnummer TEXT PRIMARY KEY,
    Vekt INTEGER NOT NULL,
    Innleveringstidspunkt TEXT NOT NULL,
    BillettId INTEGER NOT NULL,
    FOREIGN KEY (BillettId) REFERENCES Billett(BillettId) ON UPDATE CASCADE ON DELETE CASCADE
);