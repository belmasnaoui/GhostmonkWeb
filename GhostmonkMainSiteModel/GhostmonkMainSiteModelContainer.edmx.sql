
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/12/2012 10:11:59
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

IF OBJECT_ID(N'[dbo].[FK_JournalUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_JournalUser];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCV]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CVs] DROP CONSTRAINT [FK_UserCV];
GO
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
IF OBJECT_ID(N'[dbo].[FK_UserArticle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_UserArticle];
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
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
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
    [User_Id] int  NOT NULL,
    [Journal_Id] int  NOT NULL
);
GO

-- Creating table 'Journals'
CREATE TABLE [dbo].[Journals] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [ScreenName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [AuthorizationLevel] smallint  NOT NULL,
    [LoginName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Journal_Id] int  NOT NULL
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
    [User_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
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

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Journal_Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_JournalUser]
    FOREIGN KEY ([Journal_Id])
    REFERENCES [dbo].[Journals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalUser'
CREATE INDEX [IX_FK_JournalUser]
ON [dbo].[Users]
    ([Journal_Id]);
GO

-- Creating foreign key on [User_Id] in table 'CVs'
ALTER TABLE [dbo].[CVs]
ADD CONSTRAINT [FK_UserCV]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCV'
CREATE INDEX [IX_FK_UserCV]
ON [dbo].[CVs]
    ([User_Id]);
GO

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

-- Creating foreign key on [User_Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_UserArticle]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserArticle'
CREATE INDEX [IX_FK_UserArticle]
ON [dbo].[Articles]
    ([User_Id]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------