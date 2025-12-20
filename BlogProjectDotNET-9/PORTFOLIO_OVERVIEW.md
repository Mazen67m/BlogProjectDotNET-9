# Blogify - Modern Blogging Platform

## 🚀 Project Overview

**Blogify** is a full-featured, modern blogging platform built with **ASP.NET Core MVC (.NET 9)** featuring a stunning dark-themed UI with glassmorphism effects, role-based authentication, and a complete content management system.

---

## 📋 Project Details

| Property | Value |
|----------|-------|
| **Project Name** | Blogify |
| **Type** | Full-Stack Web Application |
| **Framework** | ASP.NET Core MVC (.NET 9) |
| **Database** | SQL Server with Entity Framework Core |
| **Authentication** | ASP.NET Core Identity |
| **UI Framework** | Bootstrap 5 + Custom CSS |
| **Architecture** | MVC (Model-View-Controller) |

---

## ✨ Key Features

### 🔐 Authentication & Authorization
- **User Registration** with role selection (User/Author)
- **Multi-role System**: Admin, Author, User
- **Account Approval Workflow** - New accounts require admin approval
- **Secure Login/Logout** with cookie-based authentication
- **Profile Management** with profile picture upload

### 📝 Content Management
- **Create, Read, Update, Delete (CRUD)** operations for blog posts
- **Rich Text Content** support with HTML rendering
- **Feature Image Upload** with file validation (.jpg, .jpeg, .png)
- **Category System** for organizing posts
- **Search & Filter** functionality by category and keywords
- **AJAX-powered** live filtering without page reload

### 💬 Social Features
- **Commenting System** - Users can comment on posts
- **Real-time Comment Submission** via AJAX/JSON
- **Author Attribution** on posts and comments

### 👨‍💼 Admin Dashboard
- **Statistics Overview**: Users, Authors, Posts, Comments counts
- **User Management**: Approve, delete, and change user roles
- **Pending Approvals Queue** with quick action buttons
- **Category Management**: Create, edit, delete categories

### 🎨 Modern UI/UX Design
- **Dark Theme** with premium glassmorphism effects
- **Gradient Color Palette**: Purple (#7c3aed), Teal (#06b6d4), Pink accents
- **Micro-animations** and hover effects throughout
- **Responsive Design** - Mobile-first approach
- **Custom CSS Design System** with CSS variables
- **Bootstrap Icons** integration

---

## 🛠️ Technical Stack

### Backend
| Technology | Purpose |
|------------|---------|
| ASP.NET Core MVC | Web framework |
| .NET 9 | Runtime |
| Entity Framework Core | ORM / Database access |
| ASP.NET Core Identity | Authentication & Authorization |
| SQL Server | Database |

### Frontend
| Technology | Purpose |
|------------|---------|
| Razor Views | Server-side rendering |
| Bootstrap 5 | UI framework |
| Custom CSS | Design system with glassmorphism |
| jQuery | DOM manipulation & AJAX |
| Bootstrap Icons | Iconography |
| Google Fonts (Inter) | Typography |

---

## 📁 Project Structure

```
BlogProjectDotNET-9/
├── Controllers/
│   ├── AccountController.cs    # User authentication & profile
│   ├── AdminController.cs      # Admin dashboard & user management
│   ├── CategoryController.cs   # Category CRUD operations
│   ├── CommentController.cs    # Comment management
│   ├── HomeController.cs       # Home page with sliders
│   └── PostController.cs       # Blog post CRUD & search
├── Data/
│   └── AppDbContext.cs         # EF Core database context
├── Models/
│   ├── ApplicationUser.cs      # Extended Identity user
│   ├── Category.cs             # Category entity
│   ├── Comment.cs              # Comment entity
│   ├── Post.cs                 # Blog post entity
│   └── ViewModels/             # DTOs for views
├── Views/
│   ├── Account/                # Login, Register, Profile views
│   ├── Admin/                  # Dashboard, Users management
│   ├── Category/               # Category management views
│   ├── Home/                   # Home page with carousel
│   ├── Post/                   # Post list, details, create/edit
│   └── Shared/                 # Layout, Navbar, partials
├── wwwroot/
│   ├── css/site.css            # Custom design system (900+ lines)
│   ├── images/                 # Uploaded images
│   └── js/                     # JavaScript files
└── Scripts/
    ├── DatabaseSchema.sql      # Full database schema
    └── InsertSampleData.sql    # Sample data script
```

---

## 🗃️ Database Schema

### Core Entities

**ApplicationUser** (extends IdentityUser)
- FullName, IsApproved, RegisteredAt, ProfilePictureUrl
- Relationships: Posts (1:N), Comments (1:N)

**Post**
- Id, Title, Content, PublishedDate, FeatureImagePath
- Relationships: Author (N:1), Category (N:1), Comments (1:N)

**Category**
- Id, Name, Description
- Relationships: Posts (1:N)

**Comment**
- Id, CommentText, CommentDate
- Relationships: User (N:1), Post (N:1)

---

## 🔒 Security Features

- ✅ Password hashing with ASP.NET Core Identity
- ✅ Role-based authorization (`[Authorize(Roles = "Admin")]`)
- ✅ CSRF protection with `[ValidateAntiForgeryToken]`
- ✅ SQL injection prevention via Entity Framework
- ✅ File upload validation (extension whitelist)
- ✅ Account approval workflow prevents unauthorized access

---

## 🎯 Roles & Permissions

| Role | Permissions |
|------|-------------|
| **Admin** | Full access: Dashboard, User management, All CRUD operations |
| **Author** | Create/Edit/Delete own posts, View all posts |
| **User** | View posts, Add comments |
| **Guest** | View posts only (read-only) |

---

## 🖥️ Pages & Features

### Public Pages
- **Home** - Hero carousel, Top posts, Recent posts, Categories
- **Posts Index** - Grid view with search/filter
- **Post Details** - Full article with comments
- **Login/Register** - Authentication forms

### Author Pages
- **Create Post** - Rich form with image upload
- **Edit Post** - Update existing posts
- **My Posts** - Personal post management

### Admin Pages
- **Dashboard** - Statistics cards, Pending approvals
- **User Management** - Full user CRUD with role assignment
- **Category Management** - Create/Edit/Delete categories

---

## 🎨 Design System

### Color Palette
```css
--primary: #7c3aed (Purple)
--secondary: #06b6d4 (Teal)
--accent-pink: #ec4899
--accent-green: #10b981
--bg-primary: #0f0f23 (Dark)
--text-primary: #f8fafc (Light)
```

### Design Features
- Glassmorphism cards with blur effects
- Gradient backgrounds and borders
- Smooth hover transitions (0.3s cubic-bezier)
- Custom scrollbar styling
- Animated background with radial gradients

---

## 📊 Technical Highlights

1. **Code-First Database** - EF Core migrations for schema management
2. **Dependency Injection** - Services configured in Program.cs
3. **Async/Await** - Fully asynchronous database operations
4. **Partial Views** - Reusable UI components
5. **View Models** - Clean separation between entities and views
6. **AJAX Integration** - Real-time filtering and comments
7. **File Management** - Image upload with validation and storage
8. **Seed Data** - Automatic admin user creation on startup

---

## 🚀 Getting Started

### Prerequisites
- .NET 9 SDK
- SQL Server (LocalDB or full version)
- Visual Studio 2022 or VS Code

### Installation
```bash
# Clone the repository
git clone https://github.com/mazen67M/BlogProjectDotNET-9.git

# Navigate to project directory
cd BlogProjectDotNET-9/BlogProjectDotNET-9

# Update database
dotnet ef database update

# Run the application
dotnet run
```

### Default Admin Account
- **Email**: mazenmohsen11111@gmail.com
- **Password**: Mazen123@

---

## 📸 Screenshots

The application features:
- Modern dark-themed dashboard with statistics cards
- Glassmorphism-styled navigation and cards
- Hero carousel with gradient overlays
- Category cards with color-coded accents
- Responsive post grid with hover effects

---

## 🏆 Skills Demonstrated

- **Backend Development**: ASP.NET Core MVC, C#, Entity Framework Core
- **Frontend Development**: HTML5, CSS3, JavaScript, jQuery
- **Database Design**: SQL Server, Relational modeling, Migrations
- **Authentication**: ASP.NET Core Identity, Role-based authorization
- **UI/UX Design**: Modern dark themes, Glassmorphism, Animations
- **Version Control**: Git, GitHub
- **Best Practices**: MVC architecture, DI, Async programming, Security

---

## 📞 Contact

**Developer**: Mazen Mohsen
**GitHub**: [github.com/mazen67M](https://github.com/mazen67M)

---

*Built with ❤️ using ASP.NET Core and modern web technologies*
