use MER5;
SELECT Clients.Nom, Vehicle.Marca, Tipus_vehicle.Nom, Cites.Data_inici, Cites.Ubicacio , Cites.Temps_inici
FROM  Clients, Cites, Vehicle, Tipus_vehicle, Client_vehicle
WHERE Clients.DNI = Client_vehicle.Clients_DNI and
	Vehicle.Matricula = Client_vehicle.Vehicle_ID and
    Tipus_vehicle.ID=Vehicle.Tipus_vehicle_ID AND
    Client_vehicle.ID = Cites.Vehicle_ID 
   