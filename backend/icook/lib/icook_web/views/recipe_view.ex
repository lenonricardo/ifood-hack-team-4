defmodule IcookWeb.RecipeView do
  use IcookWeb, :view
  alias IcookWeb.RecipeView
  alias IcookWeb.IngredientView

  def render("index.json", %{recipes: recipes}) do
    %{data: render_many(recipes, RecipeView, "recipe.json")}
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{
      id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      image: recipe.image,
      label: recipe.label,
      ingredients: render_many(recipe.ingredients, IngredientView, "ingredient.json")
    }
  end
end
