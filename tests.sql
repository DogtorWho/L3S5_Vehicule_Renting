-- Test pour l'évaluation du projet --
---------------------------------------------------
SET SERVEROUTPUT ON
prompt -- Début du test PAIR --
prompt
prompt Suppression des données existantes...
DELETE FROM Location;
DELETE FROM Vehicule;
DELETE FROM Modeles;
DELETE FROM Tarif;
DELETE FROM Formules;
DELETE FROM Types;
prompt Insertion des données pour le test...
prompt Types
INSERT INTO Types(IdType, Type) VALUES (1, 'Citadine');
INSERT INTO Types(IdType, Type) VALUES (2, 'Berline');
INSERT INTO Types(IdType, Type) VALUES (3, 'Monospace');
INSERT INTO Types(IdType, Type) VALUES (4, 'SUV');
INSERT INTO Types(IdType, Type) VALUES (5, '3m3');
INSERT INTO Types(IdType, Type) VALUES (6, '9m3');
INSERT INTO Types(IdType, Type) VALUES (7, '14m3');
prompt Modeles
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('CLIO','RENAULT',1);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('SCENIC','RENAULT',3);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('208','PEUGEOT',1);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('508','PEUGEOT',2);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('PICASSO','CITROEN',3);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('C3','CITROEN',1);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('A4','AUDI',2);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('TIGUAN','VW',4);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('5008','PEUGEOT',4);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('KANGOO','RENAULT',5);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('VITO','MERCEDES',6);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('TRANSIT','FORD',6);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('DUCATO','FIAT',7);
INSERT INTO Modeles(Modele, Marque, IdType) VALUES('MASTER','RENAULT',7);
prompt Formules
INSERT INTO Formules(Formule, NbJours, KmMax) VALUES('jour', 1, 100);
INSERT INTO Formules(Formule, NbJours, KmMax) VALUES('fin-semaine', 2, 200);
INSERT INTO Formules(Formule, NbJours, KmMax) VALUES('semaine', 7, 500);
INSERT INTO Formules(Formule, NbJours, KmMax) VALUES('mois', 30, 1500);
prompt Tarif
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(1, 'jour', 39, 0.3);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(1, 'fin-semaine', 69, 0.3);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(1, 'semaine', 199, 0.3);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(1, 'mois', 499, 0.3);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(2, 'jour', 59, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(2, 'fin-semaine', 99, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(2, 'semaine', 299, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(2, 'mois', 799, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(3, 'jour', 69, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(3, 'fin-semaine', 129, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(3, 'semaine', 499, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(3, 'mois', 1099, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(4, 'jour', 69, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(4, 'fin-semaine', 129, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(4, 'semaine', 499, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(4, 'mois', 1099, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(5, 'jour', 39, 0.3);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(5, 'fin-semaine', 79, 0.3);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(5, 'semaine', 199, 0.3);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(5, 'mois', 599, 0.3);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(6, 'jour', 49, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(6, 'fin-semaine', 99, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(6, 'semaine', 259, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(6, 'mois', 899, 0.4);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(7, 'jour', 79, 0.45);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(7, 'fin-semaine', 159, 0.45);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(7, 'semaine', 359, 0.45);
INSERT INTO Tarif(IdType, Formule, Prix, PrixKmSupp) VALUES(7, 'mois', 1199, 0.45);
COMMIT;
prompt
prompt ATTENTION : La numérotation des véhicules doit débuter à 1.
prompt
prompt // procedure : AjouterVehicule //
prompt Ajout de 10 véhicules
EXECUTE AjouterVehicule('CLIO','GA001AG','01/09/2021',1400);
EXECUTE AjouterVehicule('208','GA002AG','01/09/2021',1500);
EXECUTE AjouterVehicule('C3','GB003BG','15/09/2021',1000);
EXECUTE AjouterVehicule('A4','GB004BG','15/09/2021',500);
EXECUTE AjouterVehicule('508','GC006CG','01/10/2021',900);
EXECUTE AjouterVehicule('PICASSO','GF007FG','15/10/2021',300);
EXECUTE AjouterVehicule('SCENIC','GF008FG','15/10/2021',400);
EXECUTE AjouterVehicule('5008','GF009FG','15/10/2021',1000);
EXECUTE AjouterVehicule('KANGOO','GA010AG','01/09/2021',2000);
EXECUTE AjouterVehicule('TRANSIT','GA011AG','01/09/2021',2500);
prompt Modification d'un véhicule existant (Matricule en double)
EXECUTE AjouterVehicule('MASTER','GA011AG','11/09/2021',1500);
prompt Erreur : Kilométrage négatif
EXECUTE AjouterVehicule('DUCATO','GB013BG','15/09/2021',-1000);
prompt Erreur : Modèle inexistant
EXECUTE AjouterVehicule('PASSAT','GC005CG','01/10/2021',1200);
prompt Erreur : Valeur NULL (ou absente)
EXECUTE AjouterVehicule('208','GF005FG',NULL,1200);
prompt
prompt Insertion dans Location et Mise à jour Situation et Km (si Retour après location) dans Vehicule
INSERT INTO Location(NumLocation,NumVehicule,Formule,DateDepart,DateRetour,NbKm,Montant) VALUES(1001,1,'jour',SYSDATE,SYSDATE+1,120,45);
INSERT INTO Location(NumLocation,NumVehicule,Formule,DateDepart,DateRetour) VALUES(1002,2,'mois',SYSDATE+1,SYSDATE+31);
INSERT INTO Location(NumLocation,NumVehicule,Formule,DateDepart,DateRetour,NbKm,Montant) VALUES(1003,4,'jour',SYSDATE,SYSDATE+1,100,59);
INSERT INTO Location(NumLocation,NumVehicule,Formule,DateDepart,DateRetour) VALUES(1004,6,'fin-semaine',SYSDATE+2,SYSDATE+4);
INSERT INTO Location(NumLocation,NumVehicule,Formule,DateDepart,DateRetour,NbKm,Montant) VALUES(1005,7,'semaine',SYSDATE,SYSDATE+7,900,659);
INSERT INTO Location(NumLocation,NumVehicule,Formule,DateDepart,DateRetour) VALUES(1006,10,'fin-semaine',SYSDATE+1,SYSDATE+3);
UPDATE Vehicule SET Situation='location' WHERE Numvehicule IN (2, 6, 10);
UPDATE Vehicule SET Kilometrage=Kilometrage+120 WHERE NumVehicule=1;
UPDATE Vehicule SET Kilometrage=Kilometrage+100 WHERE NumVehicule=4;
UPDATE Vehicule SET Kilometrage=Kilometrage+900 WHERE NumVehicule=7;
COMMIT;
prompt
prompt // procedure : VehiculesDisponibles //
prompt les véhicules de type 'Citadine' disponibles
EXECUTE VehiculesDisponibles('Citadine');
prompt Erreur : Pas de véhicule disponible pour le type '14m3'
EXECUTE VehiculesDisponibles('14m3');
prompt Erreur : Type 'Utilitaire' inconnu
EXECUTE VehiculesDisponibles('Utilitaire');
prompt
prompt // fonction : ChiffreAffaires //
prompt CA - Jour - Citadine
SELECT ChiffreAffaires('jour','Citadine') FROM Dual;
prompt CA - NULL - Monospace
SELECT ChiffreAffaires(null,'Monospace') FROM Dual;
prompt CA - Jour - NULL
SELECT ChiffreAffaires('jour',null) FROM Dual;
prompt CA - NULL - NULL
SELECT ChiffreAffaires(null,null) FROM Dual;
prompt Erreur - Formule inconnue (-1)
SELECT ChiffreAffaires('week-end','Berline') FROM Dual;
prompt Erreur - Type inconnu (-2)
SELECT ChiffreAffaires('semaine', 'Utilitaire') FROM Dual;
prompt
prompt -- Fin du test  PAIR --
