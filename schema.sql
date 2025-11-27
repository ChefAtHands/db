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