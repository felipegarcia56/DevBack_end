defmodule RestAPIWeb.Users_liController do
  use RestAPIWeb, :controller

  alias RestAPI.Management
  alias RestAPI.Management.Users_li

  action_fallback(RestAPIWeb.FallbackController)

  def index(conn, _params) do
    users_li = Management.list_users_li()
    render(conn, "index.json", users_li: users_li)
  end

  def create(conn, params) do
    IO.inspect(params["data"])

    with {:ok, %Users_li{} = users_li} <- Management.create_users_li(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", users_li_path(conn, :show, users_li))
      |> render("show.json", users_li: users_li)
    end
  end

  def show(conn, %{"id" => id}) do
    users_li = Management.get_users_li!(id)
    render(conn, "show.json", users_li: users_li)
  end

  def update(conn, params) do
    users_li = Management.get_users_li!(params["id"])

    with {:ok, %Users_li{} = users_li} <-
           Management.update_users_li(users_li, %{
             "last_name" => params["last_name"],
             "full_name" => params["full_name"],
             "type_user" => params["type_user"],
             "identification" => params["identifications"]
           }) do
      render(conn, "show.json", users_li: users_li)
    end
  end

  def delete(conn, %{"id" => id}) do
    users_li = Management.get_users_li!(id)

    with {:ok, %Users_li{}} <- Management.delete_users_li(users_li) do
      send_resp(conn, :no_content, "")
    end
  end

  def info(conn, params) do
    users_li = Management.gerl_info(params)
    render(conn, "grl_info.json", users_li: Enum.at(users_li, 0))
  end

  def uInf(conn, params) do
    users_li = Management.uInfo(params)
    render(conn, "user.json", users_li: Enum.at(users_li, 0))
  end
end
