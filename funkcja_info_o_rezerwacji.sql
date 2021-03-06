USE [Domki_letniskowe]
GO

IF exists (select * from sys.objects where type='FN' AND name='funkcja_info_o_rezerwacji')
BEGIN
	DROP FUNCTION funkcja_info_o_rezerwacji
END;
GO

CREATE FUNCTION funkcja_info_o_rezerwacji(@NrRezerwacji  int = 0)
RETURNS TABLE 
AS
RETURN 
(
   SELECT Rezerwacje.nr_rezerwacji, Rezerwacje.nr_domku, Rezerwacje.id_klienta, Rezerwacje.nazwa_domku, Rezerwacje.Miejscowość, Rezerwacje.data_przyjazdu, Rezerwacje.data_odjazdu, Rezerwacje.Rodzaj_domku, Rezerwacje.nr_telefonu, Rezerwacje.platnosc FROM Rezerwacje
);
GO

--Wywołanie
select *
from funkcja_info_o_rezerwacji(6)