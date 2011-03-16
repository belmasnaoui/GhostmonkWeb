
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 03/15/2011 21:06:25
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

IF OBJECT_ID(N'[dbo].[FK_JournalJournalEntry]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[JournalEntries] DROP CONSTRAINT [FK_JournalJournalEntry];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalEntryTag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [FK_JournalEntryTag];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryJournalEntry]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[JournalEntries] DROP CONSTRAINT [FK_CategoryJournalEntry];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [FK_JournalCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalTag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [FK_JournalTag];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Journals] DROP CONSTRAINT [FK_JournalUser];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCV]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_UserCV];
GO
IF OBJECT_ID(N'[dbo].[FK_CVWorkExperience]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkExperiences] DROP CONSTRAINT [FK_CVWorkExperience];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkExperienceSkill_WorkExperience]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkExperienceSkill] DROP CONSTRAINT [FK_WorkExperienceSkill_WorkExperience];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkExperienceSkill_Skill]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkExperienceSkill] DROP CONSTRAINT [FK_WorkExperienceSkill_Skill];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[JournalEntries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[JournalEntries];
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
IF OBJECT_ID(N'[dbo].[Pages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pages];
GO
IF OBJECT_ID(N'[dbo].[WorkExperienceSkill]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkExperienceSkill];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'JournalEntries'
CREATE TABLE [dbo].[JournalEntries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Body] nvarchar(max)  NOT NULL,
    [PublishDate] datetime  NOT NULL,
    [MainImage] nvarchar(max)  NULL,
    [Summary] nvarchar(max)  NULL,
    [Journal_Id] int  NOT NULL,
    [Category_Id] int  NOT NULL
);
GO

-- Creating table 'Journals'
CREATE TABLE [dbo].[Journals] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [ScreenName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [AuthorizationLevel] int  NOT NULL,
    [CV_Id] int  NOT NULL
);
GO

-- Creating table 'Tags'
CREATE TABLE [dbo].[Tags] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Value] nvarchar(max)  NOT NULL,
    [JournalEntry_Id] int  NOT NULL,
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
    [Summary] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'WorkExperiences'
CREATE TABLE [dbo].[WorkExperiences] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CompanyName] nvarchar(max)  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [Summary] nvarchar(max)  NOT NULL,
    [CV_Id] int  NOT NULL
);
GO

-- Creating table 'Skills'
CREATE TABLE [dbo].[Skills] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Pages'
CREATE TABLE [dbo].[Pages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Body] nvarchar(max)  NOT NULL,
    [MainImage] nvarchar(max)  NULL
);
GO

-- Creating table 'PullQuotes'
CREATE TABLE [dbo].[PullQuotes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Priority] int  NOT NULL,
    [JournalEntry_Id] int  NOT NULL
);
GO

-- Creating table 'WorkExperienceSkill'
CREATE TABLE [dbo].[WorkExperienceSkill] (
    [WorkExperience_Id] int  NOT NULL,
    [Skills_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'JournalEntries'
ALTER TABLE [dbo].[JournalEntries]
ADD CONSTRAINT [PK_JournalEntries]
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

-- Creating primary key on [Id] in table 'Pages'
ALTER TABLE [dbo].[Pages]
ADD CONSTRAINT [PK_Pages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PullQuotes'
ALTER TABLE [dbo].[PullQuotes]
ADD CONSTRAINT [PK_PullQuotes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [WorkExperience_Id], [Skills_Id] in table 'WorkExperienceSkill'
ALTER TABLE [dbo].[WorkExperienceSkill]
ADD CONSTRAINT [PK_WorkExperienceSkill]
    PRIMARY KEY NONCLUSTERED ([WorkExperience_Id], [Skills_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Journal_Id] in table 'JournalEntries'
ALTER TABLE [dbo].[JournalEntries]
ADD CONSTRAINT [FK_JournalJournalEntry]
    FOREIGN KEY ([Journal_Id])
    REFERENCES [dbo].[Journals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalJournalEntry'
CREATE INDEX [IX_FK_JournalJournalEntry]
ON [dbo].[JournalEntries]
    ([Journal_Id]);
GO

-- Creating foreign key on [JournalEntry_Id] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [FK_JournalEntryTag]
    FOREIGN KEY ([JournalEntry_Id])
    REFERENCES [dbo].[JournalEntries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalEntryTag'
CREATE INDEX [IX_FK_JournalEntryTag]
ON [dbo].[Tags]
    ([JournalEntry_Id]);
GO

-- Creating foreign key on [Category_Id] in table 'JournalEntries'
ALTER TABLE [dbo].[JournalEntries]
ADD CONSTRAINT [FK_CategoryJournalEntry]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryJournalEntry'
CREATE INDEX [IX_FK_CategoryJournalEntry]
ON [dbo].[JournalEntries]
    ([Category_Id]);
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

-- Creating foreign key on [User_Id] in table 'Journals'
ALTER TABLE [dbo].[Journals]
ADD CONSTRAINT [FK_JournalUser]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalUser'
CREATE INDEX [IX_FK_JournalUser]
ON [dbo].[Journals]
    ([User_Id]);
GO

-- Creating foreign key on [CV_Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserCV]
    FOREIGN KEY ([CV_Id])
    REFERENCES [dbo].[CVs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCV'
CREATE INDEX [IX_FK_UserCV]
ON [dbo].[Users]
    ([CV_Id]);
GO

-- Creating foreign key on [CV_Id] in table 'WorkExperiences'
ALTER TABLE [dbo].[WorkExperiences]
ADD CONSTRAINT [FK_CVWorkExperience]
    FOREIGN KEY ([CV_Id])
    REFERENCES [dbo].[CVs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CVWorkExperience'
CREATE INDEX [IX_FK_CVWorkExperience]
ON [dbo].[WorkExperiences]
    ([CV_Id]);
GO

-- Creating foreign key on [WorkExperience_Id] in table 'WorkExperienceSkill'
ALTER TABLE [dbo].[WorkExperienceSkill]
ADD CONSTRAINT [FK_WorkExperienceSkill_WorkExperience]
    FOREIGN KEY ([WorkExperience_Id])
    REFERENCES [dbo].[WorkExperiences]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Skills_Id] in table 'WorkExperienceSkill'
ALTER TABLE [dbo].[WorkExperienceSkill]
ADD CONSTRAINT [FK_WorkExperienceSkill_Skill]
    FOREIGN KEY ([Skills_Id])
    REFERENCES [dbo].[Skills]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkExperienceSkill_Skill'
CREATE INDEX [IX_FK_WorkExperienceSkill_Skill]
ON [dbo].[WorkExperienceSkill]
    ([Skills_Id]);
GO

-- Creating foreign key on [JournalEntry_Id] in table 'PullQuotes'
ALTER TABLE [dbo].[PullQuotes]
ADD CONSTRAINT [FK_JournalEntryPullQuote]
    FOREIGN KEY ([JournalEntry_Id])
    REFERENCES [dbo].[JournalEntries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalEntryPullQuote'
CREATE INDEX [IX_FK_JournalEntryPullQuote]
ON [dbo].[PullQuotes]
    ([JournalEntry_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------