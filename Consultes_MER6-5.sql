use MER6;
select Passatger.ID,Passatger.Nom, Passatger.Cognom, Avio.ID as "Avio ID", Vol.ID as "Vol ID"
FROM Passatger,Avio,Vol,Reserva
WHERE Passatger.ID =  Reserva.Passatger_ID and
	Avio.ID = Vol.Avio_ID