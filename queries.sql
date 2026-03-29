/*----------------QUERIES-------------------
Everything beginning with @ is an example/placeholder variable
*/

-- Assign table to reservation
DECLARE @UpdateReservationID INT = 192334532
DECLARE @UpdateReservationTable INT = 1 
UPDATE Reservation
SET AssignedToTable = @UpdateReservationTable
WHERE ReservationID = @UpdateReservationID

-- Update status for reservation
DECLARE @UpdateReservationStatusID INT = 192334532
DECLARE @UpdateReservationStatus CHAR(10) = 'WAITING'
UPDATE Reservation
SET ResStatus = @UpdateReservationStatus
WHERE ReservationID = @UpdateReservationStatusID

-- View reservations for a specific date range
SELECT *
FROM Reservation
WHERE ResDate > '2026-03-01' AND ResDate < '2026-04-01'
ORDER BY ResTime

-- View all reservations that are not finished
SELECT *
FROM Reservation
WHERE ResStatus != 'FINISHED'

-- View reservation by ID
DECLARE @SearchResID INT = 192334532 
SELECT *
FROM Reservation
WHERE ReservationID = @SearchResID

-- Find table details for reservation
DECLARE @SearchReservationID INT = 192334532
DECLARE @SearchReservationTable INT
DECLARE @SearchReservationRestaurant INT 
SELECT @SearchReservationRestaurant = RestaurantAt, @SearchReservationTable = AssignedToTable
FROM Reservation
WHERE ReservationID = 192334532
SELECT * 
FROM RestaurantTable
WHERE RestaurantID = @SearchReservationRestaurant AND TableNumber = @SearchReservationTable