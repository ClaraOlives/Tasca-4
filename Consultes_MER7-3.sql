use MER7;
SELECT count(*)
FROM Linia_ticket, Ticket, Empleat
WHERE Ticket.Num = Linia_ticket.Ticket_Num and
	Empleat.ID = Ticket.Empleat_ID and
    Empleat.Nom LIKE "0%";
