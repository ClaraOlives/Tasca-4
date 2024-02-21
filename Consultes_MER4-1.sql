use MER4;
SELECT Client.Nom, Client.Cognom, Polissa.NumPolissa as 'Número de la pòlissa'
FROM Client, Polissa 
WHERE Client.DNI = Polissa.ClientDNI and Client.Nom='Biel';