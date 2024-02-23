USE MER6;
SELECT Reserva.Data_reserva, Reserva.Vol_ID, Reserva.Passatger_ID, Passatger.Nom, Passatger.Cognom 
FROM Reserva, Vol, Passatger
WHERE Passatger.ID = Reserva.Passatger_ID and
	Vol.ID = Reserva.Vol_ID and
    Vol.Hora_sortida="2022-05-06"