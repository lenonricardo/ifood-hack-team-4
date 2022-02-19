defmodule IcookWeb.RecipeController do
  use IcookWeb, :controller

  alias Icook.Catalog
  alias Icook.Catalog.Recipe

  action_fallback IcookWeb.FallbackController

  @not_found_error {:error, :not_found}
  @invalid_value_error {:error, :unprocessable_entity}

  def index(conn, %{"label" => label}) do
    recipes = Catalog.list_recipes_by_label(label)
    render(conn, "index.json", recipes: recipes)
  end

  def index(conn, _params) do
    recipes = Catalog.list_recipes()
    render(conn, "index.json", recipes: recipes)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    with {:ok, %Recipe{} = recipe} <- Catalog.create_recipe(recipe_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.recipe_path(conn, :show, recipe))
      |> render("show.json", recipe: recipe)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = Catalog.get_recipe!(id)
    render(conn, "show.json", recipe: recipe)
  rescue
    Ecto.NoResultsError -> @not_found_error
    Ecto.Query.CastError -> @invalid_value_error
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Catalog.get_recipe!(id)

    with {:ok, %Recipe{} = recipe} <- Catalog.update_recipe(recipe, recipe_params) do
      render(conn, "show.json", recipe: recipe)
    end
  rescue
    Ecto.NoResultsError -> @not_found_error
    Ecto.Query.CastError -> @invalid_value_error
  end

  def delete(conn, %{"id" => id}) do
    recipe = Catalog.get_recipe!(id)

    with {:ok, %Recipe{}} <- Catalog.delete_recipe(recipe) do
      send_resp(conn, :no_content, "")
    end
  rescue
    Ecto.NoResultsError -> @not_found_error
    Ecto.Query.CastError -> @invalid_value_error
  end
end
