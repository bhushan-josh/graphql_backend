# Backend

A Rails 7.2 backend application with GraphQL API for a blog system. This application provides a RESTful API and GraphQL interface for managing users, posts, and comments.

## 🚀 Features

- **RESTful API**: Traditional REST endpoints for CRUD operations
- **GraphQL API**: Modern GraphQL interface with GraphiQL IDE for development
- **PostgreSQL Database**: Robust database with proper relationships
- **User Management**: User registration and management
- **Blog Posts**: Create, read, update, and delete blog posts
- **Comments System**: Comment on posts with user attribution
- **CORS Enabled**: Cross-origin resource sharing support

## 🏗️ Project Structure

```
backend/
├── app/
│   ├── controllers/     # REST API controllers
│   ├── graphql/        # GraphQL schema and types
│   ├── models/         # ActiveRecord models
│   └── views/          # ERB templates
├── config/             # Application configuration
├── db/                 # Database migrations and schema
└── test/              # Test files
```

## 📋 Prerequisites

- Ruby 3.2.0
- PostgreSQL
- Bundler

## 🛠️ Installation & Setup

### 1. Clone the repository
```bash
git clone <repository-url>
cd graphql_backend
```

### 2. Install dependencies
```bash
bundle install
```

### 3. Database setup
```bash
# Create and setup the database
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

### 4. Start the server
```bash
bin/rails server
```

The application will be available at `http://localhost:3000`

## 🗄️ Database Schema

### Users
- `id`: Primary key
- `name`: User's full name
- `email`: Unique email address
- `created_at`, `updated_at`: Timestamps

### Posts
- `id`: Primary key
- `title`: Post title
- `body`: Post content
- `user_id`: Foreign key to users
- `created_at`, `updated_at`: Timestamps

### Comments
- `id`: Primary key
- `body`: Comment content
- `user_id`: Foreign key to users
- `post_id`: Foreign key to posts
- `created_at`, `updated_at`: Timestamps

## 🔌 API Endpoints

### REST API

#### Users
- `GET /users` - List all users
- `GET /users/:id` - Get specific user
- `POST /users` - Create new user
- `PUT /users/:id` - Update user
- `DELETE /users/:id` - Delete user

#### Posts
- `GET /posts` - List all posts
- `GET /posts/:id` - Get specific post
- `POST /posts` - Create new post
- `PUT /posts/:id` - Update post
- `DELETE /posts/:id` - Delete post

#### Comments
- `GET /comments` - List all comments
- `GET /comments/:id` - Get specific comment
- `POST /comments` - Create new comment
- `PUT /comments/:id` - Update comment
- `DELETE /comments/:id` - Delete comment

### GraphQL API

- **GraphQL Endpoint**: `/graphql`
- **GraphiQL Playground**: `GET /graphiql` (development only)

## 📦 Dependencies

### Core Gems
- Rails 7.2.2
- PostgreSQL adapter
- GraphQL
- GraphiQL (development)
- Rack CORS

### Development Gems
- Brakeman (security analysis)
- RuboCop (code linting)
- Faker (test data generation)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Run the test suite
6. Submit a pull request
