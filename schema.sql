-- Users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

-- Ingredients table
CREATE TABLE ingredients (
    ingredient_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100)
);

-- UserIngredients table
CREATE TABLE user_ingredients (
    user_ingredient_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity VARCHAR(50),
    CONSTRAINT fk_user_ingredients_users
        FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_user_ingredients_ingredients
        FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

-- Recipes table
CREATE TABLE recipes (
    recipe_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    instructions TEXT,
    category VARCHAR(100)
);

-- RecipeIngredients table
CREATE TABLE recipe_ingredients (
    recipe_ingredient_id SERIAL PRIMARY KEY,
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    required_quantity VARCHAR(50),
    CONSTRAINT fk_recipe_ingredients_recipes
        FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    CONSTRAINT fk_recipe_ingredients_ingredients
        FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);

-- Indexes
CREATE UNIQUE INDEX ux_ingredients_name ON ingredients(name);
CREATE INDEX ix_recipes_title ON recipes(title);

-- Sample test users
INSERT INTO users (name, email, password_hash) VALUES
    ('John Doe', 'john@test.com', '$2a$10$dummyhashedpassword1'),
    ('Jane Smith', 'jane@test.com', '$2a$10$dummyhashedpassword2'),
    ('Test User', 'test@test.com', '$2a$10$dummyhashedpassword3');


-- Sample data for ingredients
INSERT INTO ingredients (name, category) VALUES
    ('Mozzarella', 'Dairy'),
    ('Garlic', 'Vegetable'),
    ('Chicken Breast', 'Meat'),
    ('Onion', 'Vegetable'),
    ('Carrot', 'Vegetable'),
    ('Potato', 'Vegetable'),
    ('Tortilla', 'Grain'),
    ('Banana', 'Fruit'),
    ('Almonds', 'Nuts'),
    ('Spinach', 'Vegetable'),
    ('Salmon', 'Fish'),
    ('Eggs', 'Dairy'),
    ('Rice', 'Grain'),
    ('Broccoli', 'Vegetable'),
    ('Yogurt', 'Dairy'),
    ('Beef', 'Meat'),
    ('Cucumber', 'Vegetable'),
    ('Bell Pepper', 'Vegetable'),
    ('Oats', 'Grain'),
    ('Strawberries', 'Fruit'),
    ('Walnuts', 'Nuts'),
    ('Zucchini', 'Vegetable'),
    ('Shrimp', 'Seafood'),
    ('Cabbage', 'Vegetable');


    -- Sample user ingredients (John has some ingredients)
INSERT INTO user_ingredients (user_id, ingredient_id, quantity) VALUES
    (1, 1, '200g'),  -- John has Mozzarella
    (1, 2, '5 cloves'),  -- John has Garlic
    (1, 3, '500g'),  -- John has Chicken
    (2, 8, '3 pieces'),  -- Jane has Bananas
    (2, 12, '12 pieces');  -- Jane has Eggs