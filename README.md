<div align="center">

# 📝 Blogify

### A Modern Full-Stack Blogging Platform

[![.NET](https://img.shields.io/badge/.NET-9.0-512BD4?style=for-the-badge&logo=dotnet&logoColor=white)](https://dotnet.microsoft.com/)
[![ASP.NET Core MVC](https://img.shields.io/badge/ASP.NET_Core-MVC-512BD4?style=for-the-badge&logo=dotnet&logoColor=white)](https://docs.microsoft.com/en-us/aspnet/core/mvc/)
[![Entity Framework](https://img.shields.io/badge/Entity_Framework-Core_9-512BD4?style=for-the-badge&logo=dotnet&logoColor=white)](https://docs.microsoft.com/en-us/ef/core/)
[![SQL Server](https://img.shields.io/badge/SQL_Server-2022-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/en-us/sql-server)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](./LICENSE)

**Blogify** is a feature-rich blogging platform built with **ASP.NET Core MVC (.NET 9)**, featuring a premium dark-themed UI with glassmorphism effects, role-based authentication, content management, and real-time AJAX interactions.

[🚀 Live Demo](#) · [📋 Portfolio Overview](./BlogProjectDotNET-9/PORTFOLIO_OVERVIEW.md) · [🐛 Report Bug](https://github.com/mazen67M/BlogProjectDotNET-9/issues) · [✨ Request Feature](https://github.com/mazen67M/BlogProjectDotNET-9/issues)

</div>

---

## 📸 Screenshots

> 🖼️ Screenshots coming soon — run the app locally to see the full dark-themed UI with glassmorphism effects, admin dashboard, and blog post pages.



## ✨ Features

### 🔐 Authentication & Authorization
- **Multi-role System** — Admin, Author, and User roles with fine-grained permissions
- **Account Approval Workflow** — New accounts require admin approval before access
- **Secure Sessions** — Cookie-based authentication via ASP.NET Core Identity
- **Profile Management** — Profile picture upload with file validation

### 📝 Content Management
- **Full CRUD** — Create, Read, Update, and Delete blog posts
- **Feature Image Upload** — File validation for `.jpg`, `.jpeg`, `.png`
- **Category System** — Organize posts with a flexible tagging system
- **Search & Filter** — AJAX-powered live search by keyword and category

### 💬 Social & Engagement
- **Commenting System** — Authenticated users can comment on posts
- **Real-time Comments** — AJAX/JSON submission without page reload
- **Author Attribution** — Posts and comments display author details

### 👨‍💼 Admin Dashboard
- **Statistics Overview** — User, author, post, and comment counts at a glance
- **User Management** — Approve, delete, and change user roles
- **Pending Approvals Queue** — Quick-action buttons for new user requests
- **Category Management** — Full CRUD for blog categories

### 🎨 Modern UI/UX
- **Dark Theme** — Premium glassmorphism design with blur effects
- **Gradient Palette** — Purple (`#7c3aed`), Teal (`#06b6d4`), Pink accents
- **Micro-animations** — Smooth hover transitions and interactive effects
- **Responsive Design** — Mobile-first layout with Bootstrap 5

---

## 🛠️ Tech Stack

### Backend
| Technology | Version | Purpose |
|---|---|---|
| ASP.NET Core MVC | .NET 9 | Web framework & server-side rendering |
| Entity Framework Core | 9.0.7 | ORM & database migrations |
| ASP.NET Core Identity | 9.0.7 | Authentication & role-based authorization |
| SQL Server | 2022 | Relational database |

### Frontend
| Technology | Purpose |
|---|---|
| Razor Views | Server-side HTML rendering |
| Bootstrap 5 | Responsive UI grid & components |
| Custom CSS (900+ lines) | Glassmorphism design system |
| jQuery | DOM manipulation & AJAX |
| Bootstrap Icons | Iconography |
| Google Fonts (Inter) | Modern typography |

---

## 📁 Project Structure

```
BlogProjectDotNET-9/
├── Controllers/
│   ├── AccountController.cs    # Registration, login, profile management
│   ├── AdminController.cs      # Dashboard, user & role management
│   ├── CategoryController.cs   # Category CRUD operations
│   ├── CommentController.cs    # Comment submission (AJAX)
│   ├── HomeController.cs       # Home page with hero carousel
│   └── PostController.cs       # Blog post CRUD, search & filter
├── Data/
│   └── AppDbContext.cs         # EF Core database context
├── Models/
│   ├── ApplicationUser.cs      # Extended ASP.NET Identity user
│   ├── Category.cs             # Category entity
│   ├── Comment.cs              # Comment entity
│   ├── Post.cs                 # Blog post entity
│   └── ViewModels/             # DTOs decoupled from domain models
├── Views/
│   ├── Account/                # Login, register, profile
│   ├── Admin/                  # Dashboard & user management
│   ├── Category/               # Category management
│   ├── Home/                   # Hero page with carousel
│   ├── Post/                   # Post list, detail, create & edit
│   └── Shared/                 # Layout, navbar, partial views
├── wwwroot/
│   ├── css/site.css            # Custom design system
│   └── js/                     # JavaScript & AJAX logic
├── Scripts/
│   ├── DatabaseSchema.sql      # Full database schema
│   └── InsertSampleData.sql    # Sample seed data
├── appsettings.json            # App configuration (no secrets)
└── appsettings.example.json    # ← Copy this to configure locally
```

---

## 🗃️ Database Design

```
ApplicationUser ──< Post ──< Comment
       │                └──> Category
       └──────────────────< Comment
```

| Entity | Key Fields |
|---|---|
| `ApplicationUser` | `FullName`, `IsApproved`, `RegisteredAt`, `ProfilePictureUrl` |
| `Post` | `Title`, `Content`, `PublishedDate`, `FeatureImagePath` |
| `Category` | `Name`, `Description` |
| `Comment` | `CommentText`, `CommentDate` |

---

## 🎯 Roles & Permissions

| Role | Permissions |
|---|---|
| **Admin** | Full access — dashboard, user management, all CRUD |
| **Author** | Create, edit & delete own posts |
| **User** | View posts, add comments |
| **Guest** | Read-only access to public posts |

---

## 🔒 Security

- ✅ **Password hashing** via ASP.NET Core Identity (PBKDF2)
- ✅ **Role-based authorization** with `[Authorize(Roles = "Admin")]`
- ✅ **CSRF protection** via `[ValidateAntiForgeryToken]`
- ✅ **SQL injection prevention** via Entity Framework parameterized queries
- ✅ **File upload validation** — extension whitelist (jpg, jpeg, png)
- ✅ **Account approval workflow** — prevents unauthorized access

---

## 🚀 Getting Started

### Prerequisites

- [.NET 9 SDK](https://dotnet.microsoft.com/download/dotnet/9.0)
- [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) (LocalDB, Express, or full)
- [Visual Studio 2022](https://visualstudio.microsoft.com/) or [VS Code](https://code.visualstudio.com/)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/mazen67M/BlogProjectDotNET-9.git
cd BlogProjectDotNET-9

# 2. Configure your database connection
cd BlogProjectDotNET-9
cp appsettings.example.json appsettings.Development.json
# Edit appsettings.Development.json with your SQL Server connection string

# 3. Apply database migrations
dotnet ef database update

# 4. Run the application
dotnet run
```

The application will be available at `https://localhost:5001` (or the port shown in terminal).

### First-Time Setup

An **admin account** is automatically seeded on first run (configured in `Program.cs`).
You can modify the seed credentials in the source before running.

---

## 📊 Technical Highlights

| Pattern | Implementation |
|---|---|
| **MVC Architecture** | Clean separation of Models, Views, Controllers |
| **Code-First Database** | EF Core migrations for schema versioning |
| **Dependency Injection** | All services registered in `Program.cs` |
| **Async/Await** | Fully asynchronous database operations |
| **Partial Views** | Reusable UI components (navbar, cards) |
| **View Models** | DTOs preventing over-posting & over-fetching |
| **AJAX Integration** | Real-time filtering & comment submission |
| **Seed Data** | Automatic admin user on startup |

---

## 🏆 Skills Demonstrated

- **Backend Development** — ASP.NET Core MVC, C#, Entity Framework Core
- **Frontend Development** — HTML5, CSS3, JavaScript, jQuery, Razor
- **Database Design** — SQL Server, relational modeling, EF Core migrations
- **Authentication** — ASP.NET Core Identity, role-based authorization
- **UI/UX Design** — Dark theme, glassmorphism, micro-animations
- **Security** — CSRF protection, input validation, file upload security
- **Best Practices** — MVC pattern, DI, async programming, code-first DB

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](./LICENSE) file for details.

---

## 👤 Author

**Mazen Mohsen**

[![GitHub](https://img.shields.io/badge/GitHub-mazen67M-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/mazen67M)

---

<div align="center">

*Built with ❤️ using ASP.NET Core MVC and modern web technologies*

</div>
