defmodule IcookWeb.IngredientController do
  use IcookWeb, :controller

  alias Icook.Catalog
  alias Icook.Catalog.Ingredient

  action_fallback IcookWeb.FallbackController

  def index(conn, _params) do
    ingredients = Catalog.list_ingredients()
    render(conn, "index.json", ingredients: ingredients)
  end

  def create(conn, %{"ingredient" => ingredient_params}) do
    with {:ok, %Ingredient{} = ingredient} <- Catalog.create_ingredient(ingredient_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.ingredient_path(conn, :show, ingredient))
      |> render("show.json", ingredient: ingredient)
    end
  end

  def show(conn, %{"id" => id}) do
    ingredient = Catalog.get_ingredient!(id)
    render(conn, "show.json", ingredient: ingredient)
  end

  def update(conn, %{"id" => id, "ingredient" => ingredient_params}) do
    ingredient = Catalog.get_ingredient!(id)

    with {:ok, %Ingredient{} = ingredient} <- Catalog.update_ingredient(ingredient, ingredient_params) do
      render(conn, "show.json", ingredient: ingredient)
    end
  end

  def delete(conn, %{"id" => id}) do
    ingredient = Catalog.get_ingredient!(id)

    with {:ok, %Ingredient{}} <- Catalog.delete_ingredient(ingredient) do
      send_resp(conn, :no_content, "")
    end
  end
end
