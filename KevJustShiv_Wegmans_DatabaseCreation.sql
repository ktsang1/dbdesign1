/* CREATE DATABASE [Wegmans];
GO */

USE [Wegmans];
GO

CREATE TABLE [dbo].[FoodSuppliers]
(
	[SupplierID] INT NOT NULL PRIMARY KEY, 
    [PhoneNumber] BIGINT NULL, 
    [Address] VARCHAR(50) NULL, 
    [First Name] VARCHAR(50) NULL, 
    [Last Name] VARCHAR(50) NULL, 

)

INSERT INTO FoodSuppliers(SupplierID, PhoneNumber, Address, [First Name], [Last Name]) VALUES
(1, 1423523192, '2 Pratt Street', 'John', 'Park'),
(2, 1234523192, '4 Pratt Street', 'James', 'John'),
(3, 2938104829, '6 Pratt Street', 'Gordon', 'Hayward'),
(4, 7382717392, '8 Pratt Street', 'Kyrie', 'Irving'),
(5, 1234381923, '10 Pratt Street', 'Kevin', 'Tsang'),
(6, 1786872913, '12 Pratt Street', 'Jim', 'Beam'),
(7, 3819283828, '13 Pratt Street', 'Jimmy', 'Butler'),
(8, 3829991199, '14 Pratt Street', 'Lonzo', 'Ball'),
(9, 3928129181, '15 Pratt Street', 'Justin', 'Lee'),
(10, 121111111, '16 Pratt Street', 'Kyle', 'Kuzma'),


CREATE TABLE [dbo].[WegmanKitchen]
(
	[IngredientID] INT NOT NULL , 
    [SupplierID] INT NOT NULL,
    [IngredientName] VARCHAR(50) NULL, 
    [OrderQuantity] NCHAR(10) NULL, 
    [OrderDate] DATETIME NULL, 
    PRIMARY KEY ([IngredientID]), 
    CONSTRAINT [FK_WegmanKitchen_FoodSuppliers] FOREIGN KEY (SupplierID) REFERENCES FoodSuppliers(SupplierID),

)

INSERT INTO WegmanKitchen(IngredientID, SupplierID, IngredientName, OrderQuantity, OrderDate) VALUES
(1, 1, 'Rice', 5, '2017-10-20'),
(2, 1, 'Seaweed', 5, '2017-10-21'),
(3, 3, 'Cheese', 15, '2017-10-21'),
(4, 2, 'Buns', 15, '2017-10-22'),
(5, 2, 'Beef', 15, '2017-10-19'),
(6, 5, 'Pasta', 4, '2017-10-10'),
(7, 6, 'Olives', 5, '2017-10-10'),
(8, 9, 'Lettuce', 15, '2017-10-19'),
(9, 9, 'Tuna', 3, '2017-10-20'),
(10, 10, 'Salt', 30, '2017-10-20'),
(11, 10, 'Cayenne', 30, '2017-10-09')


CREATE TABLE [dbo].[DishItem]
(
	[DishID] INT NOT NULL PRIMARY KEY, 
    [RecipeID] INT NOT NULL, 
    [CuisineStyle] VARCHAR(50) NULL, 
    CONSTRAINT [FK_DishItem_Recipes] FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID) 
)

INSERT INTO DishItem(DishID, RecipeID, CuisineStyle) VALUES
(1, 1, 'Asian'),
(2, 2, 'Italian'),
(3, 3, 'American'),
(4, 4, 'Asian'),
(5, 5, 'Italian'),
(6, 6, 'Italian'),
(7, 7, 'American'),
(8, 8, 'American'),
(9, 9, 'American'),
(10, 10, 'American')



CREATE TABLE [dbo].[Recipes]
(
	[RecipeID] INT NOT NULL PRIMARY KEY, 
    [IngredientID] INT NOT NULL, 
    [DishID] INT NOT NULL, 
    [RecipeName] VARCHAR(50) NULL, 
    [RecipeQuantity] INT NULL, 
    [IngredientQuantity] INT NULL, 
    CONSTRAINT [FK_Recipes_WegmanKitchen] FOREIGN KEY (IngredientID) REFERENCES WegmanKitchen(IngredientID), 
    CONSTRAINT [FK_Recipes_DishItem] FOREIGN KEY (DishID) REFERENCES DishItem(DishID), 
)

INSERT INTO Recipes(RecipeID, IngredientID, DishID, RecipeName, RecipeQuantity, IngredientQuantity) VALUES
(1, 1, 1, 'Rice Bowl', 2, 2),
(2, 6, 3, 'Penne', 2, 1),
(3, 4, 2, 'Burger', 5, 1),
(4, 2, 4, 'Seaweed Salad', 1, 2),
(5, 3, 5, 'Cheese Platter', 3, 2),
(6, 7, 6, 'Olive Skewer', 1, 4),
(7, 5, 7, 'Steak', 1, 1),
(8, 8, 8, 'Salad', 2, 1),
(9, 9, 9, 'Seared Tuna', 1, 1),
(10, 4, 10, 'Filet Mignon', 1, 1)



CREATE TABLE [dbo].[Menu]
(
	[MenuID] INT NOT NULL PRIMARY KEY, 
    [DishID] INT NOT NULL, 
    [Week Date] DATE NULL, 
    [Price] FLOAT NULL, 
    [QuantityBought] INT NULL, 
    [TimeofDayMade] DATETIME NULL, 
    CONSTRAINT [FK_Menu_DishItem] FOREIGN KEY (DishID) REFERENCES DishItem(DishID)
)

INSERT INTO Menu(MenuID, DishID, [Week Date], Price, QuantityBought, TimeofDayMade) VALUES
(1, 1, '2017-10-22', 10, 2, '2017-10-22 13:00:00'),
(2, 2, '2017-10-22', 8 , 3, '2017-10-22 16:00:00'),
(3, 3, '2017-10-22', 6 , 5, '2017-10-22 18:00:00'),
(4, 4, '2017-10-22', 10, 2, '2017-10-22 13:00:00'),
(5, 5, '2017-10-22', 8 , 3, '2017-10-22 16:00:00'),
(6, 6, '2017-10-22', 6 , 5, '2017-10-22 18:00:00'),
(7, 7, '2017-10-22', 10, 2, '2017-10-22 13:00:00'),
(8, 8, '2017-10-22', 8 , 3, '2017-10-22 15:00:00'),
(9, 9, '2017-10-22', 6 , 5, '2017-10-22 18:00:00'),
(10, 10, '2017-10-22', 10, 2, '2017-10-22 15:00:00')


