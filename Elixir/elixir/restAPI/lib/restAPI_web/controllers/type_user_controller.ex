defmodule RestAPIWeb.Type_userController do
  use RestAPIWeb, :controller

  alias RestAPI.Management
  alias RestAPI.Management.Type_user

  action_fallback(RestAPIWeb.FallbackController)

  def index(conn, _params) do
    type_user = Management.list_type_user()
    render(conn, "index.json", type_user: type_user)
  end

  def create(conn, params) do
    with {:ok, %Type_user{} = type_user} <- Management.create_type_user(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", type_user_path(conn, :show, type_user))
      |> render("show.json", type_user: type_user)
    end
  end

  def show(conn, %{"id" => id}) do
    type_user = Management.get_type_user!(id)
    render(conn, "show.json", type_user: type_user)
  end

  def update(conn, params) do
    type_user = Management.get_type_user!(params["id"])

    with {:ok, %Type_user{} = type_user} <-
           Management.update_type_user(type_user, params["description"]) do
      render(conn, "show.json", type_user: type_user)
    end
  end

  def delete(conn, %{"id" => id}) do
    type_user = Management.get_type_user!(id)

    with {:ok, %Type_user{}} <- Management.delete_type_user(type_user) do
      send_resp(conn, :no_content, "")
    end
  end
end
