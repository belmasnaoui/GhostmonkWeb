INSERT INTO [GhostmonkMainSite].[dbo].[JournalEntries]
           ([Title]
           ,[Body]
           ,[PublishDate]
           ,[MainImage]
           ,[Journal_Id]
           ,[Category_Id])
     VALUES
           (<Title, nvarchar(max),>
           ,<Body, nvarchar(max),>
           ,<PublishDate, datetime,>
           ,<MainImage, nvarchar(max),>
           ,<Journal_Id, int,>
           ,<Category_Id, int,>)
GO

