PRAGMA foreign_keys = ON;

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
    Stiftelsesaar INTEGER NOT NULL
);

-- Tabell for Produsentnasjonaliteter
CREATE TABLE Produsentnasjonalitet (
    Flyprodusent TEXT,
    Nasjonalitet TEXT,
    PRIMARY KEY (Flyprodusent, Nasjonalitet),
    FOREIGN KEY (Flyprodusent) REFERENCES Flyprodusent(Navn) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Flytyper
CREATE TABLE Flytype (
    Navn TEXT PRIMARY KEY,
    Flyprodusent TEXT NOT NULL,
    Produksjonstart INTEGER NOT NULL,
    Produksjonsslutt INTEGER,
    FOREIGN KEY (Flyprodusent) REFERENCES Flyprodusent(Navn) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Nødutganger
CREATE TABLE Flyradkonfigurasjon (
    Flytype TEXT,
    Radnummer INTEGER,
    Setekonfigurasjon TEXT NOT NULL,
    Nodutgang BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY (Flytype, Radnummer),
    FOREIGN KEY (Flytype) REFERENCES Flytype(Navn) ON UPDATE CASCADE ON DELETE CASCADE
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
    Flyvningsnummer INTEGER NOT NULL,
    FlyRegNr TEXT NOT NULL,
    FlyStatus TEXT,
    StartFlyplass TEXT NOT NULL,
    SluttFlyplass TEXT NOT NULL,
    PlanlagtAvgangstid TEXT NOT NULL,
    PlanlagtAnkomsttid TEXT NOT NULL,
    FaktiskAvgangstid TEXT,
    FaktiskAnkomsttid TEXT,
    BudsjettPris INTEGER NOT NULL,
    OkonomiPris INTEGER NOT NULL,
    PremiumPris INTEGER NOT NULL,
    PRIMARY KEY (Lopenummer, Flyrutenummer, Flyvningsnummer),
    FOREIGN KEY (StartFlyplass) REFERENCES Flyplass(Flyplasskode) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (SluttFlyplass) REFERENCES Flyplass(Flyplasskode) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Flyrutenummer) REFERENCES Flyrute(Flyrutenummer) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (FlyRegNr) REFERENCES Fly(RegNr) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Mellomlandinger
CREATE TABLE Mellomlanding (
    Flyrutenummer TEXT NOT NULL,
    Flyplasskode TEXT NOT NULL,
    PRIMARY KEY (Flyrutenummer, Flyplasskode),
    FOREIGN KEY (Flyrutenummer) REFERENCES Flyrute(Flyrutenummer) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Flyplasskode) REFERENCES Flyplass(Flyplasskode) ON UPDATE CASCADE ON DELETE CASCADE
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
    UNIQUE (KundeNr, Flyselskap),
    FOREIGN KEY (KundeNr) REFERENCES Kunde(KundeNr) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Flyselskap) REFERENCES Flyselskap(Flyselskapkode) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Billetter
CREATE TABLE Billett (
    BillettID INTEGER PRIMARY KEY,
    Lopenummer TEXT NOT NULL,
    Flyrutenummer TEXT NOT NULL,
    Flyvningsnummer INTEGER NOT NULL,
    Kategori TEXT NOT NULL,
    Sete TEXT,
    Pris INTEGER NOT NULL,
    TidspunktInnsjekk TEXT NOT NULL,
    Referansenummer TEXT,
    FOREIGN KEY (Referansenummer) REFERENCES Billettkjop(Referansenummer) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Lopenummer, Flyrutenummer, Flyvningsnummer) REFERENCES Flyvning(Lopenummer, Flyrutenummer, Flyvningsnummer) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Billettkjøp
CREATE TABLE Billettkjop (
    Referansenummer INTEGER PRIMARY KEY,
    KundeNr INTEGER NOT NULL,
    Startflyplass TEXT NOT NULL,
    Sluttflyplass TEXT NOT NULL,
    Totalpris INTEGER NOT NULL,
    FOREIGN KEY (KundeNr) REFERENCES Kunde(KundeNr) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Startflyplass) REFERENCES Flyplass(Flyplasskode) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Sluttflyplass) REFERENCES Flyplass(Flyplasskode) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabell for Bagasje
CREATE TABLE Bagasje (
    Registreringsnummer TEXT PRIMARY KEY,
    Vekt INTEGER NOT NULL,
    Innleveringstidspunkt TEXT NOT NULL,
    BillettId INTEGER NOT NULL,
    FOREIGN KEY (BillettId) REFERENCES Billett(BillettId) ON UPDATE CASCADE ON DELETE CASCADE
);