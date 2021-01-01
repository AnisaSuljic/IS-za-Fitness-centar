CREATE TABLE Dokument (
  ID                int(11) NOT NULL AUTO_INCREMENT, 
  Predmet           varchar(255), 
  Sadrzaj           varchar(255), 
  DatumPotpisivanja date, 
  DatumIsteka       date, 
  UpravnikID        int(11), 
  PRIMARY KEY (ID));
CREATE TABLE `Loyalty program` (
  ID         int(11) NOT NULL AUTO_INCREMENT, 
  Naziv      varchar(255), 
  Cilj       varchar(255), 
  Opis       varchar(255), 
  Nagrade    varchar(255), 
  MarketarID int(11), 
  PRIMARY KEY (ID));
CREATE TABLE Marketar (
  ID            int(11) NOT NULL AUTO_INCREMENT, 
  Ime           varchar(255), 
  Prezime       varchar(255), 
  Spol          char(1), 
  DatumRodjenja date, 
  JMBG          varchar(255), 
  Email         varchar(255), 
  Telefon       varchar(255), 
  PRIMARY KEY (ID));
CREATE TABLE `Marketing kampanja` (
  ID              int(11) NOT NULL AUTO_INCREMENT, 
  NazivKampanje   int(10), 
  `Column`        varchar(255), 
  Cilj            varchar(255), 
  DatumPocetka    date, 
  DatumZavrsetka  date, 
  Opis            varchar(255), 
  UlozenaSredstva float, 
  CiljanaSkupina  varchar(255), 
  MarketarID      int(11), 
  PRIMARY KEY (ID));
CREATE TABLE Narudžba (
  ID            int(11) NOT NULL AUTO_INCREMENT, 
  DatumNarudžbe date, 
  Napomena      varchar(255), 
  ÈlanID        int(11), 
  PRIMARY KEY (ID));
CREATE TABLE Narudžba_Proizvod (
  NarudžbaID int(11) NOT NULL, 
  ProizvodID int(11) NOT NULL, 
  PRIMARY KEY (NarudžbaID, 
  ProizvodID));
CREATE TABLE Prodavac (
  ID            int(11) NOT NULL AUTO_INCREMENT, 
  Ime           varchar(255), 
  Prezime       varchar(255), 
  DatumRodjenja date, 
  Spol          char(1), 
  JMBG          varchar(255), 
  Email         varchar(255), 
  Telefon       varchar(255), 
  PRIMARY KEY (ID));
CREATE TABLE Proizvod (
  ID          int(11) NOT NULL AUTO_INCREMENT, 
  Naziv       varchar(255), 
  Namjena     varchar(255), 
  RokTrajanja date, 
  Kolicina    int(10), 
  Opis        varchar(255), 
  CONSTRAINT Naziv 
    PRIMARY KEY (ID));
CREATE TABLE ProizvodProdavac (
  ProizvodID int(11) NOT NULL, 
  ProdavacID int(11) NOT NULL, 
  PRIMARY KEY (ProizvodID, 
  ProdavacID));
CREATE TABLE Termin (
  ID             int(11) NOT NULL AUTO_INCREMENT, 
  DatumTermina   date, 
  VrijemePoèetka time, 
  VrijemeKraja   time, 
  Napomena       varchar(255), 
  UposlenikID    int(11), 
  ÈlanID         int(11), 
  PRIMARY KEY (ID));
CREATE TABLE `Tip èlanarine` (
  ID     int(11) NOT NULL AUTO_INCREMENT, 
  Naziv  varchar(255), 
  Cijena float, 
  PRIMARY KEY (ID));
CREATE TABLE Trener (
  ID            int(11) NOT NULL AUTO_INCREMENT, 
  Ime           varchar(255), 
  Prezime       varchar(255), 
  DatumRodjenja date, 
  Spol          char(1), 
  JMBG          varchar(255), 
  Kvalifikacije varchar(255), 
  Email         varchar(255), 
  Telefon       varchar(255), 
  UpravnikID    int(11), 
  CONSTRAINT Ime 
    PRIMARY KEY (ID));
CREATE TABLE Ugovor (
  ID                int(11) NOT NULL AUTO_INCREMENT, 
  PredmetUgovora    varchar(255), 
  Sadržaj           varchar(255), 
  DatumPotpisivanja date, 
  DatumIsteka       date, 
  UposlenikID       int(11), 
  UpravnikID        int(11), 
  TrenerID          int(11), 
  PRIMARY KEY (ID));
CREATE TABLE Uposlenik (
  ID            int(11) NOT NULL AUTO_INCREMENT, 
  Ime           varchar(255), 
  Prezime       varchar(255), 
  JMBG          varchar(255), 
  DatumRodjenja date, 
  Spol          char(1), 
  Telefon       varchar(255), 
  UpravnikID    int(11), 
  PRIMARY KEY (ID));
CREATE TABLE Upravnik (
  ID      int(11) NOT NULL AUTO_INCREMENT, 
  Ime     varchar(255), 
  Prezime varchar(255), 
  JMBG    varchar(255), 
  Telefon varchar(255), 
  Email   varchar(255), 
  PRIMARY KEY (ID));
CREATE TABLE Èlan (
  ID                  int(11) NOT NULL AUTO_INCREMENT, 
  Ime                 varchar(255), 
  Prezime             varchar(255), 
  DatumRodjenja       date, 
  Spol                char(1), 
  Email               varchar(255), 
  Visina              int(10), 
  Tezina              int(10), 
  BMI                 float, 
  Telefon             varchar(255), 
  UposlenikID         int(11), 
  `Loyalty programID` int(11), 
  PRIMARY KEY (ID));
CREATE TABLE Èlanarina (
  ID                int(11) NOT NULL AUTO_INCREMENT, 
  DatumUplate       float, 
  UposlenikID       int(11), 
  ÈlanID            int(11), 
  `Tip èlanarineID` int(11), 
  PRIMARY KEY (ID));
ALTER TABLE Uposlenik ADD CONSTRAINT FKUposlenik250948 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Termin ADD CONSTRAINT FKTermin530062 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE Èlan ADD CONSTRAINT FKÈlan10131 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE Termin ADD CONSTRAINT FKTermin139424 FOREIGN KEY (ÈlanID) REFERENCES Èlan (ID);
ALTER TABLE Èlanarina ADD CONSTRAINT FKÈlanarina805623 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE Èlanarina ADD CONSTRAINT FKÈlanarina196262 FOREIGN KEY (ÈlanID) REFERENCES Èlan (ID);
ALTER TABLE Narudžba ADD CONSTRAINT FKNarudžba398696 FOREIGN KEY (ÈlanID) REFERENCES Èlan (ID);
ALTER TABLE Èlanarina ADD CONSTRAINT FKÈlanarina581213 FOREIGN KEY (`Tip èlanarineID`) REFERENCES `Tip èlanarine` (ID);
ALTER TABLE Trener ADD CONSTRAINT FKTrener671169 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Èlan ADD CONSTRAINT FKÈlan987111 FOREIGN KEY (`Loyalty programID`) REFERENCES `Loyalty program` (ID);
ALTER TABLE Dokument ADD CONSTRAINT FKDokument179917 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor447516 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor25227 FOREIGN KEY (TrenerID) REFERENCES Trener (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor925751 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE `Loyalty program` ADD CONSTRAINT `FKLoyalty pr428120` FOREIGN KEY (MarketarID) REFERENCES Marketar (ID);
ALTER TABLE `Marketing kampanja` ADD CONSTRAINT `FKMarketing 963595` FOREIGN KEY (MarketarID) REFERENCES Marketar (ID);
ALTER TABLE Narudžba_Proizvod ADD CONSTRAINT FKNarudžba_P44705 FOREIGN KEY (NarudžbaID) REFERENCES Narudžba (ID);
ALTER TABLE Narudžba_Proizvod ADD CONSTRAINT FKNarudžba_P537828 FOREIGN KEY (ProizvodID) REFERENCES Proizvod (ID);
ALTER TABLE ProizvodProdavac ADD CONSTRAINT FKProizvodPr900510 FOREIGN KEY (ProizvodID) REFERENCES Proizvod (ID);
ALTER TABLE ProizvodProdavac ADD CONSTRAINT FKProizvodPr962108 FOREIGN KEY (ProdavacID) REFERENCES Prodavac (ID);

