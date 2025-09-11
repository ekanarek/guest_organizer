# Guest & Table Manager

A Ruby on Rails application for managing event seating. 
Users can create an account, log in, and manage **guests**, their **dietary restrictions**, and their **table assignments**

## Key Features

- **User Accounts & Authentication**
  - Sign up with a username and password.
  - Secure login & session management.
- **Guest Management**
  - Add, edit, view, and delete guests.
  - Assign guests to tables.
  - Track guest age and dietary restrictions.
- **Dietary Restrictions**
  - Assign one or more restrictions to each guest.
  - Create new dietary restrictions on the fly while creating or editing a guest.
- **Table Management**
  - Create tables with a configurable seating capacity.
  - View the number of seats taken vs. available.
  - See guests assigned to each table.
- **Homepage Dashboard**
  - View unassigned guests.
  - Browse all guests across tables.
  - Navigate quickly to the tables index.

## Getting Started

### Prerequisites
- Ruby
- Rails
- SQLite
- Bundler

### Setup & Installation

#### 1. Clone the repository
```bash
git clone git@github.com:ekanarek/guest_organizer.git
cd guest_organizer
```

### 2. Install dependencies
```bash
bundle install
```

### 3. Set up the database
```bash
bin/rails db:migrate
```

### 4. Run the server
```bash
bin/rails server
```

### 5. Open in browser
Visit: [http://localhost:3000/signup](http://localhost:3000/signup)

## Usage

### Create an Account
1. Go to `/signup`
2. Enter a username, password, and password confirmation.
3. Click **Create Account**.

### Log In 
1. Go to `/login`
2. Enter your username and password.
3. Click **Login**.

### Manage Guests 
- From the homepage (`/`), click **Create a guest**.
- Assign guests to tables or leave them unassigned.
- Add dietary restrictions while creating or editing a guest.

### Manage Tables
- Visit `/tables`.
- Create new tables with seating capacity.
- View guests assigned to each table.

## Running Tests
The app uses **RSpec** with **FactoryBot** helpers for testing.

Run the full suite:
```bash
bundle exec rspec
```
Factories are provided for:
- `user`
- `guest`
- `table`
- `dietary_restriction`
Helpers are included for authentication in request specs.

## Tech Stack
- **Backend**: Ruby on Rails
- **Database**: SQLite
- **Testing**: RSpec + FactoryBot
