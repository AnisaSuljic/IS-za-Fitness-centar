IF NOT EXISTS(SELECT 1 FROM sys.tables WHERE name = 'Dokument') 
BEGIN

CREATE DATABASE FitnessCentar
GO
USE FitnessCentar
GO

CREATE TABLE Dokument
(
  ID                int NOT NULL identity(1,1) PRIMARY KEY, 
  Predmet           varchar(255), 
  Sadrzaj           varchar(255), 
  DatumPotpisivanja date, 
  DatumIsteka       date, 
  UpravnikID        int
 );
CREATE TABLE [Loyalty program] (
  ID         int NOT NULL identity(1,1) PRIMARY KEY,
  Naziv      varchar(255), 
  Cilj       varchar(255), 
  Opis       varchar(255), 
  Nagrade    varchar(255), 
  MarketarID int);
CREATE TABLE Marketar (
  ID            int NOT NULL identity(1,1)PRIMARY KEY,
  Ime           varchar(255), 
  Prezime       varchar(255), 
  Spol          char(1), 
  DatumRodjenja date, 
  JMBG          varchar(255), 
  Email         varchar(255), 
  Telefon       varchar(255));
CREATE TABLE [Marketing kampanja] (
  ID              int NOT NULL identity(1,1)PRIMARY KEY,
  NazivKampanje   int, 
  Cilj            varchar(255), 
  DatumPocetka    date, 
  DatumZavrsetka  date, 
  Opis            varchar(255), 
  UlozenaSredstva float, 
  CiljanaSkupina  varchar(255), 
  MarketarID      int);
CREATE TABLE Narudžba (
  ID            int NOT NULL identity(1,1)PRIMARY KEY,
  DatumNarudžbe date, 
  Napomena      varchar(255), 
  ÈlanID        int);
CREATE TABLE Narudžba_Proizvod (
  NarudžbaID int NOT NULL, 
  ProizvodID int NOT NULL, 
  PRIMARY KEY (NarudžbaID, 
  ProizvodID));
CREATE TABLE Prodavac (
  ID            int NOT NULL identity(1,1)PRIMARY KEY,
  Ime           varchar(255), 
  Prezime       varchar(255), 
  DatumRodjenja date, 
  Spol          char(1), 
  JMBG          varchar(255), 
  Email         varchar(255), 
  Telefon       varchar(255));
CREATE TABLE Proizvod (
  ID          int NOT NULL identity(1,1)PRIMARY KEY,
  Naziv       varchar(255), 
  Namjena     varchar(255), 
  RokTrajanja date, 
  Kolicina    int, 
  Opis        varchar(255));
CREATE TABLE ProizvodProdavac (
  ProizvodID int NOT NULL, 
  ProdavacID int NOT NULL, 
  PRIMARY KEY (ProizvodID, 
  ProdavacID));
CREATE TABLE Termin (
  ID             int NOT NULL identity(1,1)PRIMARY KEY,
  DatumTermina   date, 
  VrijemePoèetka time, 
  VrijemeKraja   time, 
  Napomena       varchar(255), 
  UposlenikID    int, 
  ÈlanID         int);
CREATE TABLE [Tip èlanarine] (
  ID     int NOT NULL identity(1,1)PRIMARY KEY, 
  Naziv  varchar(255), 
  Cijena float);
CREATE TABLE Trener (
  ID            int NOT NULL identity(1,1)PRIMARY KEY ,
  Ime           varchar(255), 
  Prezime       varchar(255), 
  DatumRodjenja date, 
  Spol          char(1), 
  JMBG          varchar(255), 
  Kvalifikacije varchar(255), 
  Email         varchar(255), 
  Telefon       varchar(255), 
  UpravnikID    int);
CREATE TABLE Ugovor (
  ID                int NOT NULL identity(1,1)PRIMARY KEY,
  PredmetUgovora    varchar(255), 
  Sadržaj           varchar(255), 
  DatumPotpisivanja date, 
  DatumIsteka       date, 
  UposlenikID       int, 
  UpravnikID        int, 
  TrenerID          int);
CREATE TABLE Uposlenik (
  ID            int NOT NULL identity(1,1)PRIMARY KEY, 
  Ime           varchar(255), 
  Prezime       varchar(255), 
  JMBG          varchar(255), 
  DatumRodjenja date, 
  Spol          char(1), 
  Telefon       varchar(255), 
  UpravnikID    int);
CREATE TABLE Upravnik (
  ID      int NOT NULL identity(1,1)PRIMARY KEY, 
  Ime     varchar(255), 
  Prezime varchar(255), 
  JMBG    varchar(255), 
  Telefon varchar(255), 
  Email   varchar(255));
CREATE TABLE Èlan (
  ID                  int NOT NULL identity(1,1)PRIMARY KEY,
  Ime                 varchar(255), 
  Prezime             varchar(255), 
  DatumRodjenja       date, 
  Spol                char(1), 
  Email               varchar(255), 
  Visina              int, 
  Tezina              int, 
  BMI                 float, 
  Telefon             varchar(255), 
  UposlenikID         int, 
  [Loyalty programID] int);
CREATE TABLE Èlanarina (
  ID                int NOT NULL identity(1,1)PRIMARY KEY,
  DatumUplate       float, 
  UposlenikID       int, 
  ÈlanID            int, 
  [Tip èlanarineID] int);
ALTER TABLE Uposlenik ADD CONSTRAINT FKUposlenik250948 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Termin ADD CONSTRAINT FKTermin530062 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE Èlan ADD CONSTRAINT FKÈlan10131 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE Termin ADD CONSTRAINT FKTermin139424 FOREIGN KEY (ÈlanID) REFERENCES Èlan (ID);
ALTER TABLE Èlanarina ADD CONSTRAINT FKÈlanarina805623 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE Èlanarina ADD CONSTRAINT FKÈlanarina196262 FOREIGN KEY (ÈlanID) REFERENCES Èlan (ID);
ALTER TABLE Narudžba ADD CONSTRAINT FKNarudžba398696 FOREIGN KEY (ÈlanID) REFERENCES Èlan (ID);
ALTER TABLE Èlanarina ADD CONSTRAINT FKÈlanarina581213 FOREIGN KEY ([Tip èlanarineID]) REFERENCES [Tip èlanarine] (ID);
ALTER TABLE Trener ADD CONSTRAINT FKTrener671169 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Èlan ADD CONSTRAINT FKÈlan987111 FOREIGN KEY ([Loyalty programID]) REFERENCES [Loyalty program] (ID);
ALTER TABLE Dokument ADD CONSTRAINT FKDokument179917 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor447516 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor25227 FOREIGN KEY (TrenerID) REFERENCES Trener (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor925751 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE [Loyalty program] ADD CONSTRAINT [FKLoyalty pr428120] FOREIGN KEY (MarketarID) REFERENCES Marketar (ID);
ALTER TABLE [Marketing kampanja] ADD CONSTRAINT [FKMarketing 963595] FOREIGN KEY (MarketarID) REFERENCES Marketar (ID);
ALTER TABLE Narudžba_Proizvod ADD CONSTRAINT FKNarudžba_P44705 FOREIGN KEY (NarudžbaID) REFERENCES Narudžba (ID);
ALTER TABLE Narudžba_Proizvod ADD CONSTRAINT FKNarudžba_P537828 FOREIGN KEY (ProizvodID) REFERENCES Proizvod (ID);
ALTER TABLE ProizvodProdavac ADD CONSTRAINT FKProizvodPr900510 FOREIGN KEY (ProizvodID) REFERENCES Proizvod (ID);
ALTER TABLE ProizvodProdavac ADD CONSTRAINT FKProizvodPr962108 FOREIGN KEY (ProdavacID) REFERENCES Prodavac (ID);