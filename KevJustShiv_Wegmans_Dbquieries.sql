USE [Wegmans];
GO



SELECT * FROM FoodSuppliers;
/* Gives all data from all the columns in the FoodSuppliers table */
SELECT * FROM WegmanKitchen;
/* Gives all data from all the columns in the WegmanKitchen table */
SELECT * FROM Recipes;
/* Gives all data from all the columns in the Recipes table */
SELECT * FROM DishItem;
/* Gives all data from all the columns in the DishItem table */
SELECT * FROM Menu;
/* Gives all data from all the columns in the Menu table */

SELECT IngredientName, SUM(OrderQuantity), SupplierID FROM WegmanKitchen GROUP BY IngredientName, OrderQuantity ORDER BY SUM(OrderQuantity) DESC;
/* Gives the sum total of the ingredients ordered from a particular supplier and is arranged in descending order, showing the most popular ingredients and suppliers first */

SELECT di.DishID, di.CuisineStyle, m.WeekDate, m.QuantityBought FROM DishItem AS di inner join Menu AS m on di.DishID = m.DishID ORDER BY m.QuantityBought DESC;
/* Gives a list of dishes ordered along with which cuisine the dish is from, the dates spanning across the week, and the quantity of that particular dish ordered listed in descending order to see which dishes are the most popular each week */

SELECT wk.IngredientID, wk.SupplierID, r.RecipeID, r.IngredientQuantity FROM WegramKitchen AS wk left outer join Recipe AS r on wk.IngredientID = r.IngredientID;
/* Gives a list of all the ingredients being used to make the various reciepes, and also shows certain ingredients that aren't being used at all, and their corresponding suppliers so that Wegram can eliminate inefficiencies. */

SELECT DishID, QuantityBought FROM Menu WHERE WeekDate > '2017-10-21' AND WeekDate < '2017-10-23' AND QuantityBought > (SELECT AVG(QuantityBought) FROM Menu WHERE WeekDate > '2017-10-21' AND WeekDate < '2017-10-23');
/* Gives a list of Dishes bought that are more than the average number of dishes bought in a day, i.e. it shows the more popular dishes in the menu. */