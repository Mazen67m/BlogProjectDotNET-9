-- =============================================
-- BlogProjectDotNET-9 Database Schema Script
-- Generated: 2025-12-20
-- Database: BlogSiteDb
-- =============================================

-- Create Database (if not exists)
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'BlogSiteDb')
BEGIN
    CREATE DATABASE [BlogSiteDb];
END
GO

USE [BlogSiteDb];
GO

-- =============================================
-- ASP.NET Identity Tables
-- =============================================

-- AspNetRoles Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AspNetRoles] (
        [Id] NVARCHAR(450) NOT NULL,
        [Name] NVARCHAR(256) NULL,
        [NormalizedName] NVARCHAR(256) NULL,
        [ConcurrencyStamp] NVARCHAR(MAX) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END
GO

-- AspNetUsers Table (Extended with ApplicationUser properties)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AspNetUsers] (
        [Id] NVARCHAR(450) NOT NULL,
        [FullName] NVARCHAR(MAX) NOT NULL,
        [IsApproved] BIT NOT NULL DEFAULT 0,
        [RegisteredAt] DATETIME2 NOT NULL DEFAULT GETDATE(),
        [ProfilePictureUrl] NVARCHAR(MAX) NULL DEFAULT '/Images/default.jpg',
        [UserName] NVARCHAR(256) NULL,
        [NormalizedUserName] NVARCHAR(256) NULL,
        [Email] NVARCHAR(256) NULL,
        [NormalizedEmail] NVARCHAR(256) NULL,
        [EmailConfirmed] BIT NOT NULL DEFAULT 0,
        [PasswordHash] NVARCHAR(MAX) NULL,
        [SecurityStamp] NVARCHAR(MAX) NULL,
        [ConcurrencyStamp] NVARCHAR(MAX) NULL,
        [PhoneNumber] NVARCHAR(MAX) NULL,
        [PhoneNumberConfirmed] BIT NOT NULL DEFAULT 0,
        [TwoFactorEnabled] BIT NOT NULL DEFAULT 0,
        [LockoutEnd] DATETIMEOFFSET NULL,
        [LockoutEnabled] BIT NOT NULL DEFAULT 1,
        [AccessFailedCount] INT NOT NULL DEFAULT 0,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END
GO

-- AspNetRoleClaims Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AspNetRoleClaims] (
        [Id] INT IDENTITY(1,1) NOT NULL,
        [RoleId] NVARCHAR(450) NOT NULL,
        [ClaimType] NVARCHAR(MAX) NULL,
        [ClaimValue] NVARCHAR(MAX) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END
GO

-- AspNetUserClaims Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AspNetUserClaims] (
        [Id] INT IDENTITY(1,1) NOT NULL,
        [UserId] NVARCHAR(450) NOT NULL,
        [ClaimType] NVARCHAR(MAX) NULL,
        [ClaimValue] NVARCHAR(MAX) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END
GO

-- AspNetUserLogins Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AspNetUserLogins] (
        [LoginProvider] NVARCHAR(450) NOT NULL,
        [ProviderKey] NVARCHAR(450) NOT NULL,
        [ProviderDisplayName] NVARCHAR(MAX) NULL,
        [UserId] NVARCHAR(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED ([LoginProvider] ASC, [ProviderKey] ASC),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END
GO

-- AspNetUserRoles Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AspNetUserRoles] (
        [UserId] NVARCHAR(450) NOT NULL,
        [RoleId] NVARCHAR(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END
GO

-- AspNetUserTokens Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserTokens]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[AspNetUserTokens] (
        [UserId] NVARCHAR(450) NOT NULL,
        [LoginProvider] NVARCHAR(450) NOT NULL,
        [Name] NVARCHAR(450) NOT NULL,
        [Value] NVARCHAR(MAX) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED ([UserId] ASC, [LoginProvider] ASC, [Name] ASC),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END
GO

-- =============================================
-- Application Tables
-- =============================================

-- Categories Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Categories] (
        [Id] INT IDENTITY(1,1) NOT NULL,
        [Name] NVARCHAR(100) NOT NULL,
        [Description] NVARCHAR(MAX) NOT NULL,
        CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END
GO

-- Posts Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Posts] (
        [Id] INT IDENTITY(1,1) NOT NULL,
        [Title] NVARCHAR(100) NOT NULL,
        [Content] NVARCHAR(MAX) NOT NULL,
        [PublishedDate] DATETIME2 NOT NULL DEFAULT GETDATE(),
        [FeatureImagePath] NVARCHAR(MAX) NULL,
        [AuthorId] NVARCHAR(450) NOT NULL,
        [CategoryId] INT NOT NULL,
        CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_Posts_AspNetUsers_AuthorId] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([Id]) ON DELETE CASCADE
    );
END
GO

-- Comments Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comments]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Comments] (
        [Id] INT IDENTITY(1,1) NOT NULL,
        [CommentText] NVARCHAR(MAX) NOT NULL,
        [CommentDate] DATETIME2 NOT NULL DEFAULT GETDATE(),
        [PostId] INT NOT NULL,
        [UserId] NVARCHAR(450) NOT NULL,
        CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED ([Id] ASC),
        CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Posts] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Comments_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END
GO

-- =============================================
-- Create Indexes
-- =============================================

-- Index on AspNetUsers.NormalizedUserName
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'UserNameIndex' AND object_id = OBJECT_ID('AspNetUsers'))
BEGIN
    CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
END
GO

-- Index on AspNetUsers.NormalizedEmail
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'EmailIndex' AND object_id = OBJECT_ID('AspNetUsers'))
BEGIN
    CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers] ([NormalizedEmail]);
END
GO

-- Index on AspNetRoles.NormalizedName
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'RoleNameIndex' AND object_id = OBJECT_ID('AspNetRoles'))
BEGIN
    CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
END
GO

-- Index on Posts.AuthorId
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Posts_AuthorId' AND object_id = OBJECT_ID('Posts'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Posts_AuthorId] ON [dbo].[Posts] ([AuthorId]);
END
GO

-- Index on Posts.CategoryId
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Posts_CategoryId' AND object_id = OBJECT_ID('Posts'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Posts_CategoryId] ON [dbo].[Posts] ([CategoryId]);
END
GO

-- Index on Comments.PostId
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Comments_PostId' AND object_id = OBJECT_ID('Comments'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments] ([PostId]);
END
GO

-- Index on Comments.UserId
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Comments_UserId' AND object_id = OBJECT_ID('Comments'))
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments] ([UserId]);
END
GO

PRINT 'Database schema created successfully!';
GO
