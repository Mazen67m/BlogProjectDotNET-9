-- =============================================
-- BlogProjectDotNET-9 Sample Data Insert Script
-- Generated: 2025-12-20
-- Database: BlogSiteDb
-- =============================================
-- NOTE: Run DatabaseSchema.sql first before running this script
-- Password for all users is: Password123!
-- =============================================

USE [BlogSiteDb];
GO

-- =============================================
-- Insert Roles
-- =============================================
PRINT 'Inserting Roles...';

IF NOT EXISTS (SELECT 1 FROM [AspNetRoles] WHERE [Name] = 'Admin')
BEGIN
    INSERT INTO [AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp])
    VALUES 
        (NEWID(), 'Admin', 'ADMIN', NEWID()),
        (NEWID(), 'Author', 'AUTHOR', NEWID()),
        (NEWID(), 'User', 'USER', NEWID());
END
GO

-- Get Role IDs for later use
DECLARE @AdminRoleId NVARCHAR(450) = (SELECT [Id] FROM [AspNetRoles] WHERE [NormalizedName] = 'ADMIN');
DECLARE @AuthorRoleId NVARCHAR(450) = (SELECT [Id] FROM [AspNetRoles] WHERE [NormalizedName] = 'AUTHOR');
DECLARE @UserRoleId NVARCHAR(450) = (SELECT [Id] FROM [AspNetRoles] WHERE [NormalizedName] = 'USER');

-- =============================================
-- Insert Users
-- =============================================
PRINT 'Inserting Users...';

-- Admin User
DECLARE @AdminUserId NVARCHAR(450) = NEWID();
IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [NormalizedEmail] = 'ADMIN@BLOGIFY.COM')
BEGIN
    INSERT INTO [AspNetUsers] 
        ([Id], [FullName], [IsApproved], [RegisteredAt], [ProfilePictureUrl], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [LockoutEnabled], [AccessFailedCount])
    VALUES 
        (@AdminUserId, 'Admin User', 1, GETDATE(), '/Images/default.jpg', 'admin@blogify.com', 'ADMIN@BLOGIFY.COM', 'admin@blogify.com', 'ADMIN@BLOGIFY.COM', 1, 
        'AQAAAAIAAYagAAAAEL5H+3kB5gZQJZPqBZ0RZTx9q8DY7bN9ILXvhJKJyRz3K3LXk6qJ5WJfVxZf8HSZ0g==', -- Password123!
        NEWID(), NEWID(), 1, 0);
    
    -- Assign Admin Role
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (@AdminUserId, @AdminRoleId);
END

-- Author Users
DECLARE @Author1Id NVARCHAR(450) = NEWID();
DECLARE @Author2Id NVARCHAR(450) = NEWID();
DECLARE @Author3Id NVARCHAR(450) = NEWID();

IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [NormalizedEmail] = 'JOHN.DOE@BLOGIFY.COM')
BEGIN
    INSERT INTO [AspNetUsers] 
        ([Id], [FullName], [IsApproved], [RegisteredAt], [ProfilePictureUrl], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [LockoutEnabled], [AccessFailedCount])
    VALUES 
        (@Author1Id, 'John Doe', 1, DATEADD(DAY, -30, GETDATE()), '/Images/default.jpg', 'john.doe@blogify.com', 'JOHN.DOE@BLOGIFY.COM', 'john.doe@blogify.com', 'JOHN.DOE@BLOGIFY.COM', 1,
        'AQAAAAIAAYagAAAAEL5H+3kB5gZQJZPqBZ0RZTx9q8DY7bN9ILXvhJKJyRz3K3LXk6qJ5WJfVxZf8HSZ0g==',
        NEWID(), NEWID(), 1, 0);
    
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (@Author1Id, @AuthorRoleId);
END

IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [NormalizedEmail] = 'JANE.SMITH@BLOGIFY.COM')
BEGIN
    INSERT INTO [AspNetUsers] 
        ([Id], [FullName], [IsApproved], [RegisteredAt], [ProfilePictureUrl], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [LockoutEnabled], [AccessFailedCount])
    VALUES 
        (@Author2Id, 'Jane Smith', 1, DATEADD(DAY, -25, GETDATE()), '/Images/default.jpg', 'jane.smith@blogify.com', 'JANE.SMITH@BLOGIFY.COM', 'jane.smith@blogify.com', 'JANE.SMITH@BLOGIFY.COM', 1,
        'AQAAAAIAAYagAAAAEL5H+3kB5gZQJZPqBZ0RZTx9q8DY7bN9ILXvhJKJyRz3K3LXk6qJ5WJfVxZf8HSZ0g==',
        NEWID(), NEWID(), 1, 0);
    
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (@Author2Id, @AuthorRoleId);
END

IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [NormalizedEmail] = 'MIKE.JOHNSON@BLOGIFY.COM')
BEGIN
    INSERT INTO [AspNetUsers] 
        ([Id], [FullName], [IsApproved], [RegisteredAt], [ProfilePictureUrl], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [LockoutEnabled], [AccessFailedCount])
    VALUES 
        (@Author3Id, 'Mike Johnson', 1, DATEADD(DAY, -20, GETDATE()), '/Images/default.jpg', 'mike.johnson@blogify.com', 'MIKE.JOHNSON@BLOGIFY.COM', 'mike.johnson@blogify.com', 'MIKE.JOHNSON@BLOGIFY.COM', 1,
        'AQAAAAIAAYagAAAAEL5H+3kB5gZQJZPqBZ0RZTx9q8DY7bN9ILXvhJKJyRz3K3LXk6qJ5WJfVxZf8HSZ0g==',
        NEWID(), NEWID(), 1, 0);
    
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (@Author3Id, @AuthorRoleId);
END

-- Regular Users
DECLARE @User1Id NVARCHAR(450) = NEWID();
DECLARE @User2Id NVARCHAR(450) = NEWID();

IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [NormalizedEmail] = 'SARAH.WILSON@BLOGIFY.COM')
BEGIN
    INSERT INTO [AspNetUsers] 
        ([Id], [FullName], [IsApproved], [RegisteredAt], [ProfilePictureUrl], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [LockoutEnabled], [AccessFailedCount])
    VALUES 
        (@User1Id, 'Sarah Wilson', 1, DATEADD(DAY, -15, GETDATE()), '/Images/default.jpg', 'sarah.wilson@blogify.com', 'SARAH.WILSON@BLOGIFY.COM', 'sarah.wilson@blogify.com', 'SARAH.WILSON@BLOGIFY.COM', 1,
        'AQAAAAIAAYagAAAAEL5H+3kB5gZQJZPqBZ0RZTx9q8DY7bN9ILXvhJKJyRz3K3LXk6qJ5WJfVxZf8HSZ0g==',
        NEWID(), NEWID(), 1, 0);
    
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (@User1Id, @UserRoleId);
END

IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [NormalizedEmail] = 'BOB.BROWN@BLOGIFY.COM')
BEGIN
    INSERT INTO [AspNetUsers] 
        ([Id], [FullName], [IsApproved], [RegisteredAt], [ProfilePictureUrl], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [LockoutEnabled], [AccessFailedCount])
    VALUES 
        (@User2Id, 'Bob Brown', 1, DATEADD(DAY, -10, GETDATE()), '/Images/default.jpg', 'bob.brown@blogify.com', 'BOB.BROWN@BLOGIFY.COM', 'bob.brown@blogify.com', 'BOB.BROWN@BLOGIFY.COM', 1,
        'AQAAAAIAAYagAAAAEL5H+3kB5gZQJZPqBZ0RZTx9q8DY7bN9ILXvhJKJyRz3K3LXk6qJ5WJfVxZf8HSZ0g==',
        NEWID(), NEWID(), 1, 0);
    
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (@User2Id, @UserRoleId);
END

-- Pending Approval User
DECLARE @PendingUserId NVARCHAR(450) = NEWID();
IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [NormalizedEmail] = 'PENDING.USER@BLOGIFY.COM')
BEGIN
    INSERT INTO [AspNetUsers] 
        ([Id], [FullName], [IsApproved], [RegisteredAt], [ProfilePictureUrl], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [LockoutEnabled], [AccessFailedCount])
    VALUES 
        (@PendingUserId, 'Pending User', 0, DATEADD(DAY, -1, GETDATE()), '/Images/default.jpg', 'pending.user@blogify.com', 'PENDING.USER@BLOGIFY.COM', 'pending.user@blogify.com', 'PENDING.USER@BLOGIFY.COM', 1,
        'AQAAAAIAAYagAAAAEL5H+3kB5gZQJZPqBZ0RZTx9q8DY7bN9ILXvhJKJyRz3K3LXk6qJ5WJfVxZf8HSZ0g==',
        NEWID(), NEWID(), 1, 0);
    
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (@PendingUserId, @AuthorRoleId);
END
GO

-- =============================================
-- Insert Categories
-- =============================================
PRINT 'Inserting Categories...';

IF NOT EXISTS (SELECT 1 FROM [Categories] WHERE [Name] = 'Technology')
BEGIN
    INSERT INTO [Categories] ([Name], [Description])
    VALUES 
        ('Technology', 'Articles about the latest technology trends, gadgets, software, and digital innovation.'),
        ('Programming', 'Tutorials, tips, and best practices for software development and coding.'),
        ('Web Development', 'Everything related to building websites and web applications.'),
        ('Mobile Development', 'iOS, Android, and cross-platform mobile app development.'),
        ('Cloud Computing', 'AWS, Azure, Google Cloud, and cloud architecture topics.'),
        ('Artificial Intelligence', 'Machine learning, deep learning, and AI applications.'),
        ('Cybersecurity', 'Security best practices, threats, and protection strategies.'),
        ('DevOps', 'CI/CD, containers, Kubernetes, and infrastructure automation.'),
        ('Career', 'Career advice, job hunting tips, and professional development.'),
        ('Lifestyle', 'Work-life balance, productivity tips, and developer lifestyle.');
END
GO

-- =============================================
-- Insert Posts
-- =============================================
PRINT 'Inserting Posts...';

-- Get Author IDs
DECLARE @JohnId NVARCHAR(450) = (SELECT [Id] FROM [AspNetUsers] WHERE [NormalizedEmail] = 'JOHN.DOE@BLOGIFY.COM');
DECLARE @JaneId NVARCHAR(450) = (SELECT [Id] FROM [AspNetUsers] WHERE [NormalizedEmail] = 'JANE.SMITH@BLOGIFY.COM');
DECLARE @MikeId NVARCHAR(450) = (SELECT [Id] FROM [AspNetUsers] WHERE [NormalizedEmail] = 'MIKE.JOHNSON@BLOGIFY.COM');

-- Get Category IDs
DECLARE @TechCatId INT = (SELECT [Id] FROM [Categories] WHERE [Name] = 'Technology');
DECLARE @ProgCatId INT = (SELECT [Id] FROM [Categories] WHERE [Name] = 'Programming');
DECLARE @WebCatId INT = (SELECT [Id] FROM [Categories] WHERE [Name] = 'Web Development');
DECLARE @CloudCatId INT = (SELECT [Id] FROM [Categories] WHERE [Name] = 'Cloud Computing');
DECLARE @AICatId INT = (SELECT [Id] FROM [Categories] WHERE [Name] = 'Artificial Intelligence');
DECLARE @DevOpsCatId INT = (SELECT [Id] FROM [Categories] WHERE [Name] = 'DevOps');

IF NOT EXISTS (SELECT 1 FROM [Posts] WHERE [Title] = 'Getting Started with .NET 9')
BEGIN
    INSERT INTO [Posts] ([Title], [Content], [PublishedDate], [FeatureImagePath], [AuthorId], [CategoryId])
    VALUES 
    ('Getting Started with .NET 9', 
    '<h2>Introduction to .NET 9</h2>
    <p>.NET 9 is the latest version of Microsoft''s powerful development platform. In this article, we''ll explore the new features and improvements that make .NET 9 a game-changer for developers.</p>
    <h3>Key Features</h3>
    <ul>
        <li>Improved performance with native AOT</li>
        <li>Enhanced C# 13 language features</li>
        <li>Better cloud-native development support</li>
        <li>Updated ASP.NET Core with Blazor improvements</li>
    </ul>
    <h3>Getting Started</h3>
    <p>To get started with .NET 9, download the SDK from the official Microsoft website and install it on your machine. You can verify the installation by running <code>dotnet --version</code> in your terminal.</p>
    <p>Happy coding!</p>', 
    DATEADD(DAY, -10, GETDATE()), NULL, @JohnId, @ProgCatId),

    ('Building Modern Web Apps with Blazor', 
    '<h2>Why Blazor?</h2>
    <p>Blazor allows you to build interactive web UIs using C# instead of JavaScript. This means you can share code between your server and client applications.</p>
    <h3>Blazor Rendering Modes</h3>
    <p>Blazor offers multiple rendering modes:</p>
    <ul>
        <li><strong>Blazor Server:</strong> Components run on the server with UI updates sent over SignalR</li>
        <li><strong>Blazor WebAssembly:</strong> Components run entirely in the browser</li>
        <li><strong>Blazor Hybrid:</strong> Combine native and web technologies</li>
    </ul>
    <p>Choose the right mode based on your application requirements.</p>', 
    DATEADD(DAY, -8, GETDATE()), NULL, @JaneId, @WebCatId),

    ('Introduction to Cloud Computing with Azure', 
    '<h2>What is Cloud Computing?</h2>
    <p>Cloud computing provides on-demand access to computing resources like servers, storage, databases, and more over the internet.</p>
    <h3>Azure Services</h3>
    <p>Microsoft Azure offers hundreds of services including:</p>
    <ul>
        <li>Azure App Service for web hosting</li>
        <li>Azure SQL Database for managed databases</li>
        <li>Azure Functions for serverless computing</li>
        <li>Azure Kubernetes Service for container orchestration</li>
    </ul>
    <p>Start your cloud journey today!</p>', 
    DATEADD(DAY, -7, GETDATE()), NULL, @MikeId, @CloudCatId),

    ('Machine Learning Basics for Beginners', 
    '<h2>What is Machine Learning?</h2>
    <p>Machine Learning is a subset of AI that enables systems to learn and improve from experience without being explicitly programmed.</p>
    <h3>Types of Machine Learning</h3>
    <ul>
        <li><strong>Supervised Learning:</strong> Learning from labeled data</li>
        <li><strong>Unsupervised Learning:</strong> Finding patterns in unlabeled data</li>
        <li><strong>Reinforcement Learning:</strong> Learning through trial and error</li>
    </ul>
    <p>Start with Python and libraries like scikit-learn to begin your ML journey.</p>', 
    DATEADD(DAY, -5, GETDATE()), NULL, @JohnId, @AICatId),

    ('Docker and Kubernetes Essentials', 
    '<h2>Containerization with Docker</h2>
    <p>Docker packages your application and its dependencies into a container, ensuring consistent behavior across environments.</p>
    <h3>Orchestration with Kubernetes</h3>
    <p>Kubernetes (K8s) automates the deployment, scaling, and management of containerized applications.</p>
    <h3>Key Concepts</h3>
    <ul>
        <li>Pods: Smallest deployable units</li>
        <li>Services: Network abstraction for pods</li>
        <li>Deployments: Manage replica sets</li>
        <li>ConfigMaps & Secrets: Configuration management</li>
    </ul>', 
    DATEADD(DAY, -3, GETDATE()), NULL, @JaneId, @DevOpsCatId),

    ('The Future of Technology in 2025', 
    '<h2>Tech Trends to Watch</h2>
    <p>As we move through 2025, several technology trends are shaping our digital future.</p>
    <h3>Top Trends</h3>
    <ul>
        <li>Generative AI and Large Language Models</li>
        <li>Quantum Computing Advances</li>
        <li>Edge Computing Growth</li>
        <li>Web3 and Decentralized Applications</li>
        <li>Extended Reality (XR) Innovations</li>
    </ul>
    <p>Stay ahead by learning these emerging technologies!</p>', 
    DATEADD(DAY, -1, GETDATE()), NULL, @MikeId, @TechCatId);
END
GO

-- =============================================
-- Insert Comments
-- =============================================
PRINT 'Inserting Comments...';

-- Get User IDs for comments
DECLARE @SarahId NVARCHAR(450) = (SELECT [Id] FROM [AspNetUsers] WHERE [NormalizedEmail] = 'SARAH.WILSON@BLOGIFY.COM');
DECLARE @BobId NVARCHAR(450) = (SELECT [Id] FROM [AspNetUsers] WHERE [NormalizedEmail] = 'BOB.BROWN@BLOGIFY.COM');
DECLARE @John2Id NVARCHAR(450) = (SELECT [Id] FROM [AspNetUsers] WHERE [NormalizedEmail] = 'JOHN.DOE@BLOGIFY.COM');

-- Get Post IDs
DECLARE @Post1Id INT = (SELECT TOP 1 [Id] FROM [Posts] WHERE [Title] = 'Getting Started with .NET 9');
DECLARE @Post2Id INT = (SELECT TOP 1 [Id] FROM [Posts] WHERE [Title] = 'Building Modern Web Apps with Blazor');
DECLARE @Post3Id INT = (SELECT TOP 1 [Id] FROM [Posts] WHERE [Title] = 'Introduction to Cloud Computing with Azure');
DECLARE @Post4Id INT = (SELECT TOP 1 [Id] FROM [Posts] WHERE [Title] = 'Machine Learning Basics for Beginners');
DECLARE @Post5Id INT = (SELECT TOP 1 [Id] FROM [Posts] WHERE [Title] = 'Docker and Kubernetes Essentials');
DECLARE @Post6Id INT = (SELECT TOP 1 [Id] FROM [Posts] WHERE [Title] = 'The Future of Technology in 2025');

IF @Post1Id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [Comments] WHERE [PostId] = @Post1Id)
BEGIN
    INSERT INTO [Comments] ([CommentText], [CommentDate], [PostId], [UserId])
    VALUES 
    ('Great article! .NET 9 looks amazing. Can''t wait to try out the new AOT features.', DATEADD(HOUR, -20, GETDATE()), @Post1Id, @SarahId),
    ('Thanks for the clear explanation. This helped me understand the upgrade path from .NET 8.', DATEADD(HOUR, -15, GETDATE()), @Post1Id, @BobId),
    ('The performance improvements in .NET 9 are incredible!', DATEADD(HOUR, -10, GETDATE()), @Post1Id, @John2Id);
END

IF @Post2Id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [Comments] WHERE [PostId] = @Post2Id)
BEGIN
    INSERT INTO [Comments] ([CommentText], [CommentDate], [PostId], [UserId])
    VALUES 
    ('Blazor is a game-changer for C# developers. No more JavaScript!', DATEADD(HOUR, -18, GETDATE()), @Post2Id, @BobId),
    ('I love how I can reuse my C# skills for frontend development.', DATEADD(HOUR, -12, GETDATE()), @Post2Id, @SarahId);
END

IF @Post3Id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [Comments] WHERE [PostId] = @Post3Id)
BEGIN
    INSERT INTO [Comments] ([CommentText], [CommentDate], [PostId], [UserId])
    VALUES 
    ('Azure has really simplified our deployment process. Great overview!', DATEADD(HOUR, -16, GETDATE()), @Post3Id, @SarahId),
    ('Would love to see a follow-up article on Azure DevOps pipelines.', DATEADD(HOUR, -8, GETDATE()), @Post3Id, @BobId);
END

IF @Post4Id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [Comments] WHERE [PostId] = @Post4Id)
BEGIN
    INSERT INTO [Comments] ([CommentText], [CommentDate], [PostId], [UserId])
    VALUES 
    ('Perfect for beginners like me. Thanks for making ML accessible!', DATEADD(HOUR, -14, GETDATE()), @Post4Id, @SarahId),
    ('Can you recommend some good datasets to practice with?', DATEADD(HOUR, -6, GETDATE()), @Post4Id, @BobId);
END

IF @Post5Id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [Comments] WHERE [PostId] = @Post5Id)
BEGIN
    INSERT INTO [Comments] ([CommentText], [CommentDate], [PostId], [UserId])
    VALUES 
    ('Docker made my life so much easier. No more "it works on my machine" problems!', DATEADD(HOUR, -10, GETDATE()), @Post5Id, @BobId),
    ('K8s can be complex but this article breaks it down nicely.', DATEADD(HOUR, -4, GETDATE()), @Post5Id, @SarahId);
END

IF @Post6Id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM [Comments] WHERE [PostId] = @Post6Id)
BEGIN
    INSERT INTO [Comments] ([CommentText], [CommentDate], [PostId], [UserId])
    VALUES 
    ('AI is definitely the biggest trend. Excited to see what comes next!', DATEADD(HOUR, -5, GETDATE()), @Post6Id, @SarahId),
    ('Great predictions! I think edge computing will be huge this year.', DATEADD(HOUR, -2, GETDATE()), @Post6Id, @BobId);
END
GO

-- =============================================
-- Summary
-- =============================================
PRINT '';
PRINT '=============================================';
PRINT 'Data insertion completed successfully!';
PRINT '=============================================';
PRINT 'Summary:';
SELECT 'Roles' AS [Table], COUNT(*) AS [Count] FROM [AspNetRoles]
UNION ALL
SELECT 'Users', COUNT(*) FROM [AspNetUsers]
UNION ALL
SELECT 'Categories', COUNT(*) FROM [Categories]
UNION ALL
SELECT 'Posts', COUNT(*) FROM [Posts]
UNION ALL
SELECT 'Comments', COUNT(*) FROM [Comments];
PRINT '';
PRINT 'Default Login Credentials:';
PRINT '  Admin: admin@blogify.com / Password123!';
PRINT '  Author: john.doe@blogify.com / Password123!';
PRINT '  User: sarah.wilson@blogify.com / Password123!';
PRINT '=============================================';
GO
