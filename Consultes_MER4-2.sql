use MER4;
SELECT Polissa.NumPolissa, Tipus_Polissa.Nom as 'Número de la pòlissa', Tipus_Polissa.Nom as 'Nom  pòlissa',
Client.DNI, Client.Nom as 'Nom client', Client.Cognom as 'Cognom client'
FROM Client, Polissa, Tipus_Polissa
WHERE Client.DNI = Polissa.ClientDNI and 
	Tipus_Polissa.ID = Polissa.TipusPolissaID and 
    Tipus_Polissa.Nom = 'Viatje';