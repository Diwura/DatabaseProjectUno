MERGE INTO [dbo].[Customers] AS target
USING (VALUES
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com')
) AS source (CustomerID, FirstName, LastName, Email)
ON target.CustomerID = source.CustomerID
WHEN MATCHED THEN 
    UPDATE SET FirstName = source.FirstName, LastName = source.LastName, Email = source.Email
WHEN NOT MATCHED THEN
    INSERT (CustomerID, FirstName, LastName, Email)
    VALUES (source.CustomerID, source.FirstName, source.LastName, source.Email);

