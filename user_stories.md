# Concept: Event Guest Organizer and Planner

## Feature 1: User Login

### User Story

As a user, I want to log in to the application with my personal username and password, and work with guest information pertaining to my specific event.

### Details

Set up user authentication manually or using the Devise gem. When a user logs in, they should only be able to view and manipulate the data associated with that specific user.

## Feature 2: Add a New Guest

### User Story

As a user, I want to add guests to my event, saving their name, age, and dietary restrictions. I should optionally be able to seat them at an existing table.

### Details

The `new` view for `guests` should have a form that allows users to input a guest's name and age, select multiple dietary restrictions from a pre-existing collection, or add a new dietary restriction that isn't in the collection already. The new guest and their dietary needs are saved to that specific user's data.

## Feature 3: View Guests

### User Story

As a user, I want to see a list of my guests and click on a guest's name to view their specific information.

### Details

The `index` view for `guests` should display all guests associated with the user, and a link to the form to add a new guest. Each guest's name should link to their specific `show` page, which displays their name, age, and dietary information, with links to `edit` or `destroy`.

## Feature 4: Add a New Table

### User Story

As a user, I want to add tables to my event so that I can assign guests to be seated there.

### Details

The `new` view for `tables` should have a form that allows users to name the table and give it a max seating capacity.

## Feature 4: Tables View

### User Story

As a user, I want to see a list of tables I'm planning to have at my event, their guest capacities, and links to view the full list of guests assigned to a specific table.

### Details

The `index` view for `tables` should display all tables associated with the user, the capacity # and seats remaining at each table, and a link to the form to add a new table. Each table's name should link to a nested index route for `guests`, which lists all guests currently assigned to that table. There should be links on this nested page to `edit` or `destroy` the table (deleting should un-assign the guests from the table, not delete them). Within the `edit` form, users should be able to check off the names of guests currently not assigned to a table in order to assign them there.
