use MER4;
SELECT Client.Nom, Client.Cognom,Venedor.Nom, Venedor.Cognom,Polissa.NumPolissa, Tipus_Polissa.Nom 
FROM Client,Venedor, Polissa, Tipus_Polissa
WHERE Client.DNI = Polissa.ClientDNI and 
	Venedor.DNI = Polissa.VenedorDNI and
	Tipus_Polissa.ID = Polissa.TipusPolissaID 
  