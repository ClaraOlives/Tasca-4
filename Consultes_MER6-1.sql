use MER6;
SELECT Passatger.DNI, Passatger.Nom, Passatger.Cognom, Vol.Num_vol, Vol.Origen, Vol.Desti
FROM Passatger, Vol, Reserva
WHERE Passatger.ID = Reserva.Passatger_ID and
	Vol.ID = Reserva.Vol_ID  