
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 03/25/2011 00:13:07
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
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_JournalJournalEntry];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalEntryTag_JournalEntry]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[JournalEntryTag] DROP CONSTRAINT [FK_JournalEntryTag_JournalEntry];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalEntryTag_Tag]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[JournalEntryTag] DROP CONSTRAINT [FK_JournalEntryTag_Tag];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryJournalEntry]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_CategoryJournalEntry];
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
IF OBJECT_ID(N'[dbo].[FK_JournalEntryPullQuote]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PullQuotes] DROP CONSTRAINT [FK_JournalEntryPullQuote];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectProjectImages]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Assets] DROP CONSTRAINT [FK_ProjectProjectImages];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_UserProject];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkExperienceProject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_WorkExperienceProject];
GO
IF OBJECT_ID(N'[dbo].[FK_SkillProject_Skill]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SkillProject] DROP CONSTRAINT [FK_SkillProject_Skill];
GO
IF OBJECT_ID(N'[dbo].[FK_SkillProject_Project]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SkillProject] DROP CONSTRAINT [FK_SkillProject_Project];
GO
IF OBJECT_ID(N'[dbo].[FK_JournalEntryProjectAsset]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Assets] DROP CONSTRAINT [FK_JournalEntryProjectAsset];
GO
IF OBJECT_ID(N'[dbo].[FK_CVSkill]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Skills] DROP CONSTRAINT [FK_CVSkill];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_ArticleComment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_UserComment];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_ProjectComment];
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
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[Assets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Assets];
GO
IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[JournalEntryTag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[JournalEntryTag];
GO
IF OBJECT_ID(N'[dbo].[WorkExperienceSkill]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkExperienceSkill];
GO
IF OBJECT_ID(N'[dbo].[SkillProject]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SkillProject];
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
    [NumberOfPages] smallint  NOT NULL,
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
    [AuthorizationLevel] smallint  NOT NULL,
    [LoginName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [CV_Id] int  NOT NULL
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

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Summary] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [Company] nvarchar(max)  NOT NULL,
    [FullText] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL,
    [WorkExperience_Id] int  NOT NULL
);
GO

-- Creating table 'Assets'
CREATE TABLE [dbo].[Assets] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Uri] nvarchar(max)  NOT NULL,
    [Project_Id] int  NOT NULL,
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
    [Article_Id] int  NOT NULL,
    [User_Id] int  NOT NULL,
    [Project_Id] int  NOT NULL
);
GO

-- Creating table 'ArticlesTags'
CREATE TABLE [dbo].[ArticlesTags] (
    [Articles_Id] int  NOT NULL,
    [Tags_Id] int  NOT NULL
);
GO

-- Creating table 'WorkExperienceSkills'
CREATE TABLE [dbo].[WorkExperienceSkills] (
    [WorkExperiences_Id] int  NOT NULL,
    [Skills_Id] int  NOT NULL
);
GO

-- Creating table 'SkillsProjects'
CREATE TABLE [dbo].[SkillsProjects] (
    [Skills_Id] int  NOT NULL,
    [Projects_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Assets'
ALTER TABLE [dbo].[Assets]
ADD CONSTRAINT [PK_Assets]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Articles_Id], [Tags_Id] in table 'ArticlesTags'
ALTER TABLE [dbo].[ArticlesTags]
ADD CONSTRAINT [PK_ArticlesTags]
    PRIMARY KEY NONCLUSTERED ([Articles_Id], [Tags_Id] ASC);
GO

-- Creating primary key on [WorkExperiences_Id], [Skills_Id] in table 'WorkExperienceSkills'
ALTER TABLE [dbo].[WorkExperienceSkills]
ADD CONSTRAINT [PK_WorkExperienceSkills]
    PRIMARY KEY NONCLUSTERED ([WorkExperiences_Id], [Skills_Id] ASC);
GO

-- Creating primary key on [Skills_Id], [Projects_Id] in table 'SkillsProjects'
ALTER TABLE [dbo].[SkillsProjects]
ADD CONSTRAINT [PK_SkillsProjects]
    PRIMARY KEY NONCLUSTERED ([Skills_Id], [Projects_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Journal_Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_JournalArticles]
    FOREIGN KEY ([Journal_Id])
    REFERENCES [dbo].[Journals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalArticles'
CREATE INDEX [IX_FK_JournalArticles]
ON [dbo].[Articles]
    ([Journal_Id]);
GO

-- Creating foreign key on [Articles_Id] in table 'ArticlesTags'
ALTER TABLE [dbo].[ArticlesTags]
ADD CONSTRAINT [FK_ArticlesTags_Article]
    FOREIGN KEY ([Articles_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Tags_Id] in table 'ArticlesTags'
ALTER TABLE [dbo].[ArticlesTags]
ADD CONSTRAINT [FK_ArticlesTags_Tag]
    FOREIGN KEY ([Tags_Id])
    REFERENCES [dbo].[Tags]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticlesTags_Tag'
CREATE INDEX [IX_FK_ArticlesTags_Tag]
ON [dbo].[ArticlesTags]
    ([Tags_Id]);
GO

-- Creating foreign key on [Category_Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_CategoryArticles]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryArticles'
CREATE INDEX [IX_FK_CategoryArticles]
ON [dbo].[Articles]
    ([Category_Id]);
GO

-- Creating foreign key on [Journal_Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_JournalCategories]
    FOREIGN KEY ([Journal_Id])
    REFERENCES [dbo].[Journals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JournalCategories'
CREATE INDEX [IX_FK_JournalCategories]
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

-- Creating foreign key on [WorkExperiences_Id] in table 'WorkExperienceSkills'
ALTER TABLE [dbo].[WorkExperienceSkills]
ADD CONSTRAINT [FK_WorkExperienceSkills_WorkExperience]
    FOREIGN KEY ([WorkExperiences_Id])
    REFERENCES [dbo].[WorkExperiences]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Skills_Id] in table 'WorkExperienceSkills'
ALTER TABLE [dbo].[WorkExperienceSkills]
ADD CONSTRAINT [FK_WorkExperienceSkills_Skill]
    FOREIGN KEY ([Skills_Id])
    REFERENCES [dbo].[Skills]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkExperienceSkills_Skill'
CREATE INDEX [IX_FK_WorkExperienceSkills_Skill]
ON [dbo].[WorkExperienceSkills]
    ([Skills_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'PullQuotes'
ALTER TABLE [dbo].[PullQuotes]
ADD CONSTRAINT [FK_ArticlePullQuotes]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticlePullQuotes'
CREATE INDEX [IX_FK_ArticlePullQuotes]
ON [dbo].[PullQuotes]
    ([Article_Id]);
GO

-- Creating foreign key on [Project_Id] in table 'Assets'
ALTER TABLE [dbo].[Assets]
ADD CONSTRAINT [FK_ProjectAssets]
    FOREIGN KEY ([Project_Id])
    REFERENCES [dbo].[Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectAssets'
CREATE INDEX [IX_FK_ProjectAssets]
ON [dbo].[Assets]
    ([Project_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_UserProjects]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProjects'
CREATE INDEX [IX_FK_UserProjects]
ON [dbo].[Projects]
    ([User_Id]);
GO

-- Creating foreign key on [WorkExperience_Id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_WorkExperienceProject]
    FOREIGN KEY ([WorkExperience_Id])
    REFERENCES [dbo].[WorkExperiences]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkExperienceProject'
CREATE INDEX [IX_FK_WorkExperienceProject]
ON [dbo].[Projects]
    ([WorkExperience_Id]);
GO

-- Creating foreign key on [Skills_Id] in table 'SkillsProjects'
ALTER TABLE [dbo].[SkillsProjects]
ADD CONSTRAINT [FK_SkillsProjects_Skill]
    FOREIGN KEY ([Skills_Id])
    REFERENCES [dbo].[Skills]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Projects_Id] in table 'SkillsProjects'
ALTER TABLE [dbo].[SkillsProjects]
ADD CONSTRAINT [FK_SkillsProjects_Project]
    FOREIGN KEY ([Projects_Id])
    REFERENCES [dbo].[Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SkillsProjects_Project'
CREATE INDEX [IX_FK_SkillsProjects_Project]
ON [dbo].[SkillsProjects]
    ([Projects_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'Assets'
ALTER TABLE [dbo].[Assets]
ADD CONSTRAINT [FK_ArticleAssets]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleAssets'
CREATE INDEX [IX_FK_ArticleAssets]
ON [dbo].[Assets]
    ([Article_Id]);
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
ADD CONSTRAINT [FK_ArticleComments]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleComments'
CREATE INDEX [IX_FK_ArticleComments]
ON [dbo].[Comments]
    ([Article_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_UserComments]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserComments'
CREATE INDEX [IX_FK_UserComments]
ON [dbo].[Comments]
    ([User_Id]);
GO

-- Creating foreign key on [Project_Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_ProjectComments]
    FOREIGN KEY ([Project_Id])
    REFERENCES [dbo].[Projects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectComments'
CREATE INDEX [IX_FK_ProjectComments]
ON [dbo].[Comments]
    ([Project_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------