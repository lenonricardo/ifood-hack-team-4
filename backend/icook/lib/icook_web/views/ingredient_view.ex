defmodule IcookWeb.IngredientView do
  use IcookWeb, :view
  alias IcookWeb.IngredientView
  alias IcookWeb.MarketView

  def render("index.json", %{ingredients: ingredients}) do
    %{data: render_many(ingredients, IngredientView, "ingredient.json")}
  end

  def render("show.json", %{ingredient: ingredient}) do
    %{data: render_one(ingredient, IngredientView, "ingredient.json")}
  end

  def render("ingredient.json", %{ingredient: ingredient}) do
    %{
      id: ingredient.id,
      title: ingredient.title,
      image: ingredient.image,
      price: ingredient.price,
      markets: render_many(ingredient.markets, MarketView, "market.json")
    }
  end
end
