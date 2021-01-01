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
CREATE TABLE Narud�ba (
  ID            int NOT NULL identity(1,1)PRIMARY KEY,
  DatumNarud�be date, 
  Napomena      varchar(255), 
  �lanID        int);
CREATE TABLE Narud�ba_Proizvod (
  Narud�baID int NOT NULL, 
  ProizvodID int NOT NULL, 
  PRIMARY KEY (Narud�baID, 
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
  VrijemePo�etka time, 
  VrijemeKraja   time, 
  Napomena       varchar(255), 
  UposlenikID    int, 
  �lanID         int);
CREATE TABLE [Tip �lanarine] (
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
  Sadr�aj           varchar(255), 
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
CREATE TABLE �lan (
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
CREATE TABLE �lanarina (
  ID                int NOT NULL identity(1,1)PRIMARY KEY,
  DatumUplate       float, 
  UposlenikID       int, 
  �lanID            int, 
  [Tip �lanarineID] int);
ALTER TABLE Uposlenik ADD CONSTRAINT FKUposlenik250948 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Termin ADD CONSTRAINT FKTermin530062 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE �lan ADD CONSTRAINT FK�lan10131 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE Termin ADD CONSTRAINT FKTermin139424 FOREIGN KEY (�lanID) REFERENCES �lan (ID);
ALTER TABLE �lanarina ADD CONSTRAINT FK�lanarina805623 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE �lanarina ADD CONSTRAINT FK�lanarina196262 FOREIGN KEY (�lanID) REFERENCES �lan (ID);
ALTER TABLE Narud�ba ADD CONSTRAINT FKNarud�ba398696 FOREIGN KEY (�lanID) REFERENCES �lan (ID);
ALTER TABLE �lanarina ADD CONSTRAINT FK�lanarina581213 FOREIGN KEY ([Tip �lanarineID]) REFERENCES [Tip �lanarine] (ID);
ALTER TABLE Trener ADD CONSTRAINT FKTrener671169 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE �lan ADD CONSTRAINT FK�lan987111 FOREIGN KEY ([Loyalty programID]) REFERENCES [Loyalty program] (ID);
ALTER TABLE Dokument ADD CONSTRAINT FKDokument179917 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor447516 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor25227 FOREIGN KEY (TrenerID) REFERENCES Trener (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor925751 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE [Loyalty program] ADD CONSTRAINT [FKLoyalty pr428120] FOREIGN KEY (MarketarID) REFERENCES Marketar (ID);
ALTER TABLE [Marketing kampanja] ADD CONSTRAINT [FKMarketing 963595] FOREIGN KEY (MarketarID) REFERENCES Marketar (ID);
ALTER TABLE Narud�ba_Proizvod ADD CONSTRAINT FKNarud�ba_P44705 FOREIGN KEY (Narud�baID) REFERENCES Narud�ba (ID);
ALTER TABLE Narud�ba_Proizvod ADD CONSTRAINT FKNarud�ba_P537828 FOREIGN KEY (ProizvodID) REFERENCES Proizvod (ID);
ALTER TABLE ProizvodProdavac ADD CONSTRAINT FKProizvodPr900510 FOREIGN KEY (ProizvodID) REFERENCES Proizvod (ID);
ALTER TABLE ProizvodProdavac ADD CONSTRAINT FKProizvodPr962108 FOREIGN KEY (ProdavacID) REFERENCES Prodavac (ID);