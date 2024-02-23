use MER7;
SELECT Ticket.Num_factura, Ticket.Data_ticket, Empleat.Nom, Empleat.Cognom
FROM Ticket, Empleat, Producte, Linia_ticket
WHERE Producte.ID = Linia_ticket.Producte_ID and
	Ticket.Num = Linia_ticket.Ticket_Num and
    Empleat.ID = Ticket.Empleat_ID and
    Producte.Nom="Doritos"