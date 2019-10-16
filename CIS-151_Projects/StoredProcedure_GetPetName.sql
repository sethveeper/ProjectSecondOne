CREATE PROCEDURE GetPetName

@carId int,
@petName char(50) output

AS
SELECT @petName = PetName
	FROM Inventory
	WHERE CarId = @carId;