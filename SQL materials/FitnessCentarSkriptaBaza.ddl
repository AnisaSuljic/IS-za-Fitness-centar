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
CREATE TABLE Narud�ba (
  ID            int(11) NOT NULL AUTO_INCREMENT, 
  DatumNarud�be date, 
  Napomena      varchar(255), 
  �lanID        int(11), 
  PRIMARY KEY (ID));
CREATE TABLE Narud�ba_Proizvod (
  Narud�baID int(11) NOT NULL, 
  ProizvodID int(11) NOT NULL, 
  PRIMARY KEY (Narud�baID, 
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
  VrijemePo�etka time, 
  VrijemeKraja   time, 
  Napomena       varchar(255), 
  UposlenikID    int(11), 
  �lanID         int(11), 
  PRIMARY KEY (ID));
CREATE TABLE `Tip �lanarine` (
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
  Sadr�aj           varchar(255), 
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
CREATE TABLE �lan (
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
CREATE TABLE �lanarina (
  ID                int(11) NOT NULL AUTO_INCREMENT, 
  DatumUplate       float, 
  UposlenikID       int(11), 
  �lanID            int(11), 
  `Tip �lanarineID` int(11), 
  PRIMARY KEY (ID));
ALTER TABLE Uposlenik ADD CONSTRAINT FKUposlenik250948 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Termin ADD CONSTRAINT FKTermin530062 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE �lan ADD CONSTRAINT FK�lan10131 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE Termin ADD CONSTRAINT FKTermin139424 FOREIGN KEY (�lanID) REFERENCES �lan (ID);
ALTER TABLE �lanarina ADD CONSTRAINT FK�lanarina805623 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE �lanarina ADD CONSTRAINT FK�lanarina196262 FOREIGN KEY (�lanID) REFERENCES �lan (ID);
ALTER TABLE Narud�ba ADD CONSTRAINT FKNarud�ba398696 FOREIGN KEY (�lanID) REFERENCES �lan (ID);
ALTER TABLE �lanarina ADD CONSTRAINT FK�lanarina581213 FOREIGN KEY (`Tip �lanarineID`) REFERENCES `Tip �lanarine` (ID);
ALTER TABLE Trener ADD CONSTRAINT FKTrener671169 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE �lan ADD CONSTRAINT FK�lan987111 FOREIGN KEY (`Loyalty programID`) REFERENCES `Loyalty program` (ID);
ALTER TABLE Dokument ADD CONSTRAINT FKDokument179917 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor447516 FOREIGN KEY (UpravnikID) REFERENCES Upravnik (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor25227 FOREIGN KEY (TrenerID) REFERENCES Trener (ID);
ALTER TABLE Ugovor ADD CONSTRAINT FKUgovor925751 FOREIGN KEY (UposlenikID) REFERENCES Uposlenik (ID);
ALTER TABLE `Loyalty program` ADD CONSTRAINT `FKLoyalty pr428120` FOREIGN KEY (MarketarID) REFERENCES Marketar (ID);
ALTER TABLE `Marketing kampanja` ADD CONSTRAINT `FKMarketing 963595` FOREIGN KEY (MarketarID) REFERENCES Marketar (ID);
ALTER TABLE Narud�ba_Proizvod ADD CONSTRAINT FKNarud�ba_P44705 FOREIGN KEY (Narud�baID) REFERENCES Narud�ba (ID);
ALTER TABLE Narud�ba_Proizvod ADD CONSTRAINT FKNarud�ba_P537828 FOREIGN KEY (ProizvodID) REFERENCES Proizvod (ID);
ALTER TABLE ProizvodProdavac ADD CONSTRAINT FKProizvodPr900510 FOREIGN KEY (ProizvodID) REFERENCES Proizvod (ID);
ALTER TABLE ProizvodProdavac ADD CONSTRAINT FKProizvodPr962108 FOREIGN KEY (ProdavacID) REFERENCES Prodavac (ID);

