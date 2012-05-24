
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/21/2012 18:46:28
-- Generated from EDMX file: D:\Projects\ghostmonk\GhostmonkWeb\GhostmonkMainSiteModel\GhostmonkMainSiteModelContainer.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GhostmonkMainSite];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CVWorkExperiences]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkExperiences] DROP CONSTRAINT [FK_CVWorkExperiences];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkExperiencesSkills_WorkExperience]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkExperiencesSkills] DROP CONSTRAINT [FK_WorkExperiencesSkills_WorkExperience];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkExperiencesSkills_Skill]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkExperiencesSkills] DROP CONSTRAINT [FK_WorkExperiencesSkills_Skill];
GO
IF OBJECT_ID(N'[dbo].[FK_CVSkills]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Skills] DROP CONSTRAINT [FK_CVSkills];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_ArticleComment];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticlePullQuote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PullQuotes] DROP CONSTRAINT [FK_ArticlePullQuote];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleImage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Images] DROP CONSTRAINT [FK_ArticleImage];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleSlideshow]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Slideshows] DROP CONSTRAINT [FK_ArticleSlideshow];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleVideo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Videos] DROP CONSTRAINT [FK_ArticleVideo];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleCategory_Article]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticleCategory] DROP CONSTRAINT [FK_ArticleCategory_Article];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleCategory_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticleCategory] DROP CONSTRAINT [FK_ArticleCategory_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleTag_Article]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticleTag] DROP CONSTRAINT [FK_ArticleTag_Article];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleTag_Tag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticleTag] DROP CONSTRAINT [FK_ArticleTag_Tag];
GO
IF OBJECT_ID(N'[dbo].[FK_SlideshowImage_Slideshow]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SlideshowImage] DROP CONSTRAINT [FK_SlideshowImage_Slideshow];
GO
IF OBJECT_ID(N'[dbo].[FK_SlideshowImage_Image]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SlideshowImage] DROP CONSTRAINT [FK_SlideshowImage_Image];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [FK_JournalCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalTag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [FK_JournalTag];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalArticle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_JournalArticle];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Articles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articles];
GO
IF OBJECT_ID(N'[dbo].[Journals]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Journals];
GO
IF OBJECT_ID(N'[dbo].[Tags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tags];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[CVs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CVs];
GO
IF OBJECT_ID(N'[dbo].[WorkExperiences]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkExperiences];
GO
IF OBJECT_ID(N'[dbo].[Skills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Skills];
GO
IF OBJECT_ID(N'[dbo].[PullQuotes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PullQuotes];
GO
IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[Slideshows]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Slideshows];
GO
IF OBJECT_ID(N'[dbo].[Images]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Images];
GO
IF OBJECT_ID(N'[dbo].[Videos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Videos];
GO
IF OBJECT_ID(N'[dbo].[WorkExperiencesSkills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkExperiencesSkills];
GO
IF OBJECT_ID(N'[dbo].[ArticleCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ArticleCategory];
GO
IF OBJECT_ID(N'[dbo].[ArticleTag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ArticleTag];
GO
IF OBJECT_ID(N'[dbo].[SlideshowImage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SlideshowImage];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Articles'
CREATE TABLE [dbo].[Articles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Body] nvarchar(max)  NOT NULL,
    [PublishDate] datetime  NOT NULL,
    [Summary] nvarchar(max)  NULL,
    [LinkText] nvarchar(max)  NOT NULL,
    [Journal_Id] int  NOT NULL,
    [aspnet_Users_UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Journals'
CREATE TABLE [dbo].[Journals] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tags'
CREATE TABLE [dbo].[Tags] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Value] nvarchar(max)  NOT NULL,
    [Journal_Id] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Value] nvarchar(max)  NOT NULL,
    [Journal_Id] int  NOT NULL
);
GO

-- Creating table 'CVs'
CREATE TABLE [dbo].[CVs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Area] nvarchar(max)  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [Summary] nvarchar(max)  NOT NULL,
    [aspnet_Users_UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'WorkExperiences'
CREATE TABLE [dbo].[WorkExperiences] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CompanyName] nvarchar(max)  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [Summary] nvarchar(max)  NOT NULL,
    [Uri] nvarchar(max)  NULL,
    [CV_Id] int  NOT NULL
);
GO

-- Creating table 'Skills'
CREATE TABLE [dbo].[Skills] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CV_Id] int  NOT NULL
);
GO

-- Creating table 'PullQuotes'
CREATE TABLE [dbo].[PullQuotes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Priority] smallint  NOT NULL,
    [Article_Id] int  NOT NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [Article_Id] int  NOT NULL
);
GO

-- Creating table 'Slideshows'
CREATE TABLE [dbo].[Slideshows] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Article_Id] int  NOT NULL
);
GO

-- Creating table 'Images'
CREATE TABLE [dbo].[Images] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Article_Id] int  NOT NULL
);
GO

-- Creating table 'Videos'
CREATE TABLE [dbo].[Videos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Article_Id] int  NOT NULL
);
GO

-- Creating table 'aspnet_Applications'
CREATE TABLE [dbo].[aspnet_Applications] (
    [ApplicationName] nvarchar(256)  NOT NULL,
    [LoweredApplicationName] nvarchar(256)  NOT NULL,
    [ApplicationId] uniqueidentifier  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'aspnet_Membership'
CREATE TABLE [dbo].[aspnet_Membership] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [Password] nvarchar(128)  NOT NULL,
    [PasswordFormat] int  NOT NULL,
    [PasswordSalt] nvarchar(128)  NOT NULL,
    [MobilePIN] nvarchar(16)  NULL,
    [Email] nvarchar(256)  NULL,
    [LoweredEmail] nvarchar(256)  NULL,
    [PasswordQuestion] nvarchar(256)  NULL,
    [PasswordAnswer] nvarchar(128)  NULL,
    [IsApproved] bit  NOT NULL,
    [IsLockedOut] bit  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastLoginDate] datetime  NOT NULL,
    [LastPasswordChangedDate] datetime  NOT NULL,
    [LastLockoutDate] datetime  NOT NULL,
    [FailedPasswordAttemptCount] int  NOT NULL,
    [FailedPasswordAttemptWindowStart] datetime  NOT NULL,
    [FailedPasswordAnswerAttemptCount] int  NOT NULL,
    [FailedPasswordAnswerAttemptWindowStart] datetime  NOT NULL,
    [Comment] nvarchar(max)  NULL
);
GO

-- Creating table 'aspnet_Paths'
CREATE TABLE [dbo].[aspnet_Paths] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NOT NULL,
    [Path] nvarchar(256)  NOT NULL,
    [LoweredPath] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'aspnet_PersonalizationAllUsers'
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers] (
    [PathId] uniqueidentifier  NOT NULL,
    [PageSettings] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_PersonalizationPerUser'
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser] (
    [Id] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NULL,
    [UserId] uniqueidentifier  NULL,
    [PageSettings] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_Profile'
CREATE TABLE [dbo].[aspnet_Profile] (
    [UserId] uniqueidentifier  NOT NULL,
    [PropertyNames] nvarchar(max)  NOT NULL,
    [PropertyValuesString] nvarchar(max)  NOT NULL,
    [PropertyValuesBinary] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_Roles'
CREATE TABLE [dbo].[aspnet_Roles] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [RoleId] uniqueidentifier  NOT NULL,
    [RoleName] nvarchar(256)  NOT NULL,
    [LoweredRoleName] nvarchar(256)  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'aspnet_SchemaVersions'
CREATE TABLE [dbo].[aspnet_SchemaVersions] (
    [Feature] nvarchar(128)  NOT NULL,
    [CompatibleSchemaVersion] nvarchar(128)  NOT NULL,
    [IsCurrentVersion] bit  NOT NULL
);
GO

-- Creating table 'aspnet_Users'
CREATE TABLE [dbo].[aspnet_Users] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [LoweredUserName] nvarchar(256)  NOT NULL,
    [MobileAlias] nvarchar(16)  NULL,
    [IsAnonymous] bit  NOT NULL,
    [LastActivityDate] datetime  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [ScreenName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'aspnet_WebEvent_Events'
CREATE TABLE [dbo].[aspnet_WebEvent_Events] (
    [EventId] char(32)  NOT NULL,
    [EventTimeUtc] datetime  NOT NULL,
    [EventTime] datetime  NOT NULL,
    [EventType] nvarchar(256)  NOT NULL,
    [EventSequence] decimal(19,0)  NOT NULL,
    [EventOccurrence] decimal(19,0)  NOT NULL,
    [EventCode] int  NOT NULL,
    [EventDetailCode] int  NOT NULL,
    [Message] nvarchar(1024)  NULL,
    [ApplicationPath] nvarchar(256)  NULL,
    [ApplicationVirtualPath] nvarchar(256)  NULL,
    [MachineName] nvarchar(256)  NOT NULL,
    [RequestUrl] nvarchar(1024)  NULL,
    [ExceptionType] nvarchar(256)  NULL,
    [Details] nvarchar(max)  NULL
);
GO

-- Creating table 'WorkExperiencesSkills'
CREATE TABLE [dbo].[WorkExperiencesSkills] (
    [WorkExperience_Id] int  NOT NULL,
    [Skill_Id] int  NOT NULL
);
GO

-- Creating table 'ArticleCategory'
CREATE TABLE [dbo].[ArticleCategory] (
    [Article_Id] int  NOT NULL,
    [Categories_Id] int  NOT NULL
);
GO

-- Creating table 'ArticleTag'
CREATE TABLE [dbo].[ArticleTag] (
    [Article_Id] int  NOT NULL,
    [Tags_Id] int  NOT NULL
);
GO

-- Creating table 'SlideshowImage'
CREATE TABLE [dbo].[SlideshowImage] (
    [Slideshow_Id] int  NOT NULL,
    [Images_Id] int  NOT NULL
);
GO

-- Creating table 'aspnet_UsersInRoles'
CREATE TABLE [dbo].[aspnet_UsersInRoles] (
    [aspnet_Roles_RoleId] uniqueidentifier  NOT NULL,
    [aspnet_Users_UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Journalaspnet_Users'
CREATE TABLE [dbo].[Journalaspnet_Users] (
    [Journal_Id] int  NOT NULL,
    [aspnet_Users_UserId] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [PK_Articles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Journals'
ALTER TABLE [dbo].[Journals]
ADD CONSTRAINT [PK_Journals]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [PK_Tags]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CVs'
ALTER TABLE [dbo].[CVs]
ADD CONSTRAINT [PK_CVs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'WorkExperiences'
ALTER TABLE [dbo].[WorkExperiences]
ADD CONSTRAINT [PK_WorkExperiences]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Skills'
ALTER TABLE [dbo].[Skills]
ADD CONSTRAINT [PK_Skills]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PullQuotes'
ALTER TABLE [dbo].[PullQuotes]
ADD CONSTRAINT [PK_PullQuotes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Slideshows'
ALTER TABLE [dbo].[Slideshows]
ADD CONSTRAINT [PK_Slideshows]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Images'
ALTER TABLE [dbo].[Images]
ADD CONSTRAINT [PK_Images]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Videos'
ALTER TABLE [dbo].[Videos]
ADD CONSTRAINT [PK_Videos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ApplicationId] in table 'aspnet_Applications'
ALTER TABLE [dbo].[aspnet_Applications]
ADD CONSTRAINT [PK_aspnet_Applications]
    PRIMARY KEY CLUSTERED ([ApplicationId] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [PK_aspnet_Membership]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [PathId] in table 'aspnet_Paths'
ALTER TABLE [dbo].[aspnet_Paths]
ADD CONSTRAINT [PK_aspnet_Paths]
    PRIMARY KEY CLUSTERED ([PathId] ASC);
GO

-- Creating primary key on [PathId] in table 'aspnet_PersonalizationAllUsers'
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
ADD CONSTRAINT [PK_aspnet_PersonalizationAllUsers]
    PRIMARY KEY CLUSTERED ([PathId] ASC);
GO

-- Creating primary key on [Id] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [PK_aspnet_PersonalizationPerUser]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Profile'
ALTER TABLE [dbo].[aspnet_Profile]
ADD CONSTRAINT [PK_aspnet_Profile]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [RoleId] in table 'aspnet_Roles'
ALTER TABLE [dbo].[aspnet_Roles]
ADD CONSTRAINT [PK_aspnet_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [Feature], [CompatibleSchemaVersion] in table 'aspnet_SchemaVersions'
ALTER TABLE [dbo].[aspnet_SchemaVersions]
ADD CONSTRAINT [PK_aspnet_SchemaVersions]
    PRIMARY KEY CLUSTERED ([Feature], [CompatibleSchemaVersion] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Users'
ALTER TABLE [dbo].[aspnet_Users]
ADD CONSTRAINT [PK_aspnet_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [EventId] in table 'aspnet_WebEvent_Events'
ALTER TABLE [dbo].[aspnet_WebEvent_Events]
ADD CONSTRAINT [PK_aspnet_WebEvent_Events]
    PRIMARY KEY CLUSTERED ([EventId] ASC);
GO

-- Creating primary key on [WorkExperience_Id], [Skill_Id] in table 'WorkExperiencesSkills'
ALTER TABLE [dbo].[WorkExperiencesSkills]
ADD CONSTRAINT [PK_WorkExperiencesSkills]
    PRIMARY KEY NONCLUSTERED ([WorkExperience_Id], [Skill_Id] ASC);
GO

-- Creating primary key on [Article_Id], [Categories_Id] in table 'ArticleCategory'
ALTER TABLE [dbo].[ArticleCategory]
ADD CONSTRAINT [PK_ArticleCategory]
    PRIMARY KEY NONCLUSTERED ([Article_Id], [Categories_Id] ASC);
GO

-- Creating primary key on [Article_Id], [Tags_Id] in table 'ArticleTag'
ALTER TABLE [dbo].[ArticleTag]
ADD CONSTRAINT [PK_ArticleTag]
    PRIMARY KEY NONCLUSTERED ([Article_Id], [Tags_Id] ASC);
GO

-- Creating primary key on [Slideshow_Id], [Images_Id] in table 'SlideshowImage'
ALTER TABLE [dbo].[SlideshowImage]
ADD CONSTRAINT [PK_SlideshowImage]
    PRIMARY KEY NONCLUSTERED ([Slideshow_Id], [Images_Id] ASC);
GO

-- Creating primary key on [aspnet_Roles_RoleId], [aspnet_Users_UserId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [PK_aspnet_UsersInRoles]
    PRIMARY KEY NONCLUSTERED ([aspnet_Roles_RoleId], [aspnet_Users_UserId] ASC);
GO

-- Creating primary key on [Journal_Id], [aspnet_Users_UserId] in table 'Journalaspnet_Users'
ALTER TABLE [dbo].[Journalaspnet_Users]
ADD CONSTRAINT [PK_Journalaspnet_Users]
    PRIMARY KEY NONCLUSTERED ([Journal_Id], [aspnet_Users_UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CV_Id] in table 'WorkExperiences'
ALTER TABLE [dbo].[WorkExperiences]
ADD CONSTRAINT [FK_CVWorkExperiences]
    FOREIGN KEY ([CV_Id])
    REFERENCES [dbo].[CVs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CVWorkExperiences'
CREATE INDEX [IX_FK_CVWorkExperiences]
ON [dbo].[WorkExperiences]
    ([CV_Id]);
GO

-- Creating foreign key on [WorkExperience_Id] in table 'WorkExperiencesSkills'
ALTER TABLE [dbo].[WorkExperiencesSkills]
ADD CONSTRAINT [FK_WorkExperiencesSkills_WorkExperience]
    FOREIGN KEY ([WorkExperience_Id])
    REFERENCES [dbo].[WorkExperiences]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Skill_Id] in table 'WorkExperiencesSkills'
ALTER TABLE [dbo].[WorkExperiencesSkills]
ADD CONSTRAINT [FK_WorkExperiencesSkills_Skill]
    FOREIGN KEY ([Skill_Id])
    REFERENCES [dbo].[Skills]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkExperiencesSkills_Skill'
CREATE INDEX [IX_FK_WorkExperiencesSkills_Skill]
ON [dbo].[WorkExperiencesSkills]
    ([Skill_Id]);
GO

-- Creating foreign key on [CV_Id] in table 'Skills'
ALTER TABLE [dbo].[Skills]
ADD CONSTRAINT [FK_CVSkills]
    FOREIGN KEY ([CV_Id])
    REFERENCES [dbo].[CVs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CVSkills'
CREATE INDEX [IX_FK_CVSkills]
ON [dbo].[Skills]
    ([CV_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_ArticleComment]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleComment'
CREATE INDEX [IX_FK_ArticleComment]
ON [dbo].[Comments]
    ([Article_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'PullQuotes'
ALTER TABLE [dbo].[PullQuotes]
ADD CONSTRAINT [FK_ArticlePullQuote]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticlePullQuote'
CREATE INDEX [IX_FK_ArticlePullQuote]
ON [dbo].[PullQuotes]
    ([Article_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'Images'
ALTER TABLE [dbo].[Images]
ADD CONSTRAINT [FK_ArticleImage]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleImage'
CREATE INDEX [IX_FK_ArticleImage]
ON [dbo].[Images]
    ([Article_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'Slideshows'
ALTER TABLE [dbo].[Slideshows]
ADD CONSTRAINT [FK_ArticleSlideshow]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleSlideshow'
CREATE INDEX [IX_FK_ArticleSlideshow]
ON [dbo].[Slideshows]
    ([Article_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'Videos'
ALTER TABLE [dbo].[Videos]
ADD CONSTRAINT [FK_ArticleVideo]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleVideo'
CREATE INDEX [IX_FK_ArticleVideo]
ON [dbo].[Videos]
    ([Article_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'ArticleCategory'
ALTER TABLE [dbo].[ArticleCategory]
ADD CONSTRAINT [FK_ArticleCategory_Article]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Categories_Id] in table 'ArticleCategory'
ALTER TABLE [dbo].[ArticleCategory]
ADD CONSTRAINT [FK_ArticleCategory_Category]
    FOREIGN KEY ([Categories_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleCategory_Category'
CREATE INDEX [IX_FK_ArticleCategory_Category]
ON [dbo].[ArticleCategory]
    ([Categories_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'ArticleTag'
ALTER TABLE [dbo].[ArticleTag]
ADD CONSTRAINT [FK_ArticleTag_Article]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Tags_Id] in table 'ArticleTag'
ALTER TABLE [dbo].[ArticleTag]
ADD CONSTRAINT [FK_ArticleTag_Tag]
    FOREIGN KEY ([Tags_Id])
    REFERENCES [dbo].[Tags]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleTag_Tag'
CREATE INDEX [IX_FK_ArticleTag_Tag]
ON [dbo].[ArticleTag]
    ([Tags_Id]);
GO

-- Creating foreign key on [Slideshow_Id] in table 'SlideshowImage'
ALTER TABLE [dbo].[SlideshowImage]
ADD CONSTRAINT [FK_SlideshowImage_Slideshow]
    FOREIGN KEY ([Slideshow_Id])
    REFERENCES [dbo].[Slideshows]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Images_Id] in table 'SlideshowImage'
ALTER TABLE [dbo].[SlideshowImage]
ADD CONSTRAINT [FK_SlideshowImage_Image]
    FOREIGN KEY ([Images_Id])
    REFERENCES [dbo].[Images]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SlideshowImage_Image'
CREATE INDEX [IX_FK_SlideshowImage_Image]
ON [dbo].[SlideshowImage]
    ([Images_Id]);
GO

-- Creating foreign key on [Journal_Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_JournalCategory]
    FOREIGN KEY ([Journal_Id])
    REFERENCES [dbo].[Journals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalCategory'
CREATE INDEX [IX_FK_JournalCategory]
ON [dbo].[Categories]
    ([Journal_Id]);
GO

-- Creating foreign key on [Journal_Id] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [FK_JournalTag]
    FOREIGN KEY ([Journal_Id])
    REFERENCES [dbo].[Journals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalTag'
CREATE INDEX [IX_FK_JournalTag]
ON [dbo].[Tags]
    ([Journal_Id]);
GO

-- Creating foreign key on [Journal_Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_JournalArticle]
    FOREIGN KEY ([Journal_Id])
    REFERENCES [dbo].[Journals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalArticle'
CREATE INDEX [IX_FK_JournalArticle]
ON [dbo].[Articles]
    ([Journal_Id]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [FK__aspnet_Me__Appli__21B6055D]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Me__Appli__21B6055D'
CREATE INDEX [IX_FK__aspnet_Me__Appli__21B6055D]
ON [dbo].[aspnet_Membership]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Paths'
ALTER TABLE [dbo].[aspnet_Paths]
ADD CONSTRAINT [FK__aspnet_Pa__Appli__5AEE82B9]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pa__Appli__5AEE82B9'
CREATE INDEX [IX_FK__aspnet_Pa__Appli__5AEE82B9]
ON [dbo].[aspnet_Paths]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Roles'
ALTER TABLE [dbo].[aspnet_Roles]
ADD CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Ro__Appli__440B1D61'
CREATE INDEX [IX_FK__aspnet_Ro__Appli__440B1D61]
ON [dbo].[aspnet_Roles]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Users'
ALTER TABLE [dbo].[aspnet_Users]
ADD CONSTRAINT [FK__aspnet_Us__Appli__0DAF0CB0]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Us__Appli__0DAF0CB0'
CREATE INDEX [IX_FK__aspnet_Us__Appli__0DAF0CB0]
ON [dbo].[aspnet_Users]
    ([ApplicationId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [FK__aspnet_Me__UserI__22AA2996]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PathId] in table 'aspnet_PersonalizationAllUsers'
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
ADD CONSTRAINT [FK__aspnet_Pe__PathI__628FA481]
    FOREIGN KEY ([PathId])
    REFERENCES [dbo].[aspnet_Paths]
        ([PathId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PathId] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [FK__aspnet_Pe__PathI__68487DD7]
    FOREIGN KEY ([PathId])
    REFERENCES [dbo].[aspnet_Paths]
        ([PathId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pe__PathI__68487DD7'
CREATE INDEX [IX_FK__aspnet_Pe__PathI__68487DD7]
ON [dbo].[aspnet_PersonalizationPerUser]
    ([PathId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [FK__aspnet_Pe__UserI__693CA210]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pe__UserI__693CA210'
CREATE INDEX [IX_FK__aspnet_Pe__UserI__693CA210]
ON [dbo].[aspnet_PersonalizationPerUser]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_Profile'
ALTER TABLE [dbo].[aspnet_Profile]
ADD CONSTRAINT [FK__aspnet_Pr__UserI__38996AB5]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [aspnet_Roles_RoleId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
    FOREIGN KEY ([aspnet_Roles_RoleId])
    REFERENCES [dbo].[aspnet_Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [aspnet_Users_UserId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Users]
    FOREIGN KEY ([aspnet_Users_UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_aspnet_UsersInRoles_aspnet_Users'
CREATE INDEX [IX_FK_aspnet_UsersInRoles_aspnet_Users]
ON [dbo].[aspnet_UsersInRoles]
    ([aspnet_Users_UserId]);
GO

-- Creating foreign key on [aspnet_Users_UserId] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_aspnet_UsersArticle]
    FOREIGN KEY ([aspnet_Users_UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_aspnet_UsersArticle'
CREATE INDEX [IX_FK_aspnet_UsersArticle]
ON [dbo].[Articles]
    ([aspnet_Users_UserId]);
GO

-- Creating foreign key on [Journal_Id] in table 'Journalaspnet_Users'
ALTER TABLE [dbo].[Journalaspnet_Users]
ADD CONSTRAINT [FK_Journalaspnet_Users_Journal]
    FOREIGN KEY ([Journal_Id])
    REFERENCES [dbo].[Journals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [aspnet_Users_UserId] in table 'Journalaspnet_Users'
ALTER TABLE [dbo].[Journalaspnet_Users]
ADD CONSTRAINT [FK_Journalaspnet_Users_aspnet_Users]
    FOREIGN KEY ([aspnet_Users_UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Journalaspnet_Users_aspnet_Users'
CREATE INDEX [IX_FK_Journalaspnet_Users_aspnet_Users]
ON [dbo].[Journalaspnet_Users]
    ([aspnet_Users_UserId]);
GO

-- Creating foreign key on [aspnet_Users_UserId] in table 'CVs'
ALTER TABLE [dbo].[CVs]
ADD CONSTRAINT [FK_aspnet_UsersCV]
    FOREIGN KEY ([aspnet_Users_UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_aspnet_UsersCV'
CREATE INDEX [IX_FK_aspnet_UsersCV]
ON [dbo].[CVs]
    ([aspnet_Users_UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------