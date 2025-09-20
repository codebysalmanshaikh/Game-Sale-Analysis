CREATE DATABASE game_sales;
USE game_sales;

CREATE TABLE games (
    Game_Rank INT,
    Name VARCHAR(255),
    Platform VARCHAR(50),
    Year INT,
    Genre VARCHAR(50),
    Publisher VARCHAR(255),
    NA_Sales DECIMAL(6,2),
    EU_Sales DECIMAL(6,2),
    JP_Sales DECIMAL(6,2),
    Other_Sales DECIMAL(6,2),
    Global_Sales DECIMAL(6,2)
);


SELECT 
    ROUND(SUM(Global_Sales),2) AS Total_Global_Sales,
    COUNT(*) AS Total_Games,
    ROUND(AVG(Global_Sales),2) AS Avg_Sales_Per_Game
FROM games;


SELECT Platform, 
       ROUND(SUM(Global_Sales),2) AS Total_Global_Sales,
       COUNT(*) AS Num_Games
FROM games
GROUP BY Platform
ORDER BY Total_Global_Sales DESC
LIMIT 10;


SELECT Genre, 
       ROUND(SUM(Global_Sales),2) AS Total_Global_Sales
FROM games
GROUP BY Genre
ORDER BY Total_Global_Sales DESC
LIMIT 10;


SELECT Publisher, 
       ROUND(SUM(Global_Sales),2) AS Total_Global_Sales
FROM games
GROUP BY Publisher
ORDER BY Total_Global_Sales DESC
LIMIT 10;


SELECT Year, 
       ROUND(SUM(Global_Sales),2) AS Total_Global_Sales
FROM games
GROUP BY Year
ORDER BY Year;


SELECT Year, Platform, 
       ROUND(SUM(Global_Sales),2) AS Total_Global_Sales
FROM games
GROUP BY Year, Platform
ORDER BY Year, Platform;


SELECT Genre,
       ROUND(SUM(NA_Sales),2) AS NA,
       ROUND(SUM(EU_Sales),2) AS EU,
       ROUND(SUM(JP_Sales),2) AS JP,
       ROUND(SUM(Other_Sales),2) AS Other
FROM games
GROUP BY Genre
ORDER BY NA DESC;


SELECT g.Platform, g.Name, g.Global_Sales
FROM games g
JOIN (
    SELECT Platform, MAX(Global_Sales) AS Max_Sales
    FROM games
    GROUP BY Platform
) t ON g.Platform = t.Platform AND g.Global_Sales = t.Max_Sales
ORDER BY g.Global_Sales DESC;




