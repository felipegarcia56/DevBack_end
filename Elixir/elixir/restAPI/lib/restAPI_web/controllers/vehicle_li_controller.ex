defmodule RestAPIWeb.Vehicle_liController do
  use RestAPIWeb, :controller

  alias RestAPI.Management
  alias RestAPI.Management.Vehicle_li

  action_fallback(RestAPIWeb.FallbackController)

  def index(conn, _params) do
    vehicle_li = Management.list_vehicle_li()
    render(conn, "index.json", vehicle_li: vehicle_li)
  end

  def create(conn, params) do
    with {:ok, %Vehicle_li{} = vehicle_li} <- Management.create_vehicle_li(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", vehicle_li_path(conn, :show, vehicle_li))
      |> render("show.json", vehicle_li: vehicle_li)
    end
  end

  def show(conn, %{"id" => id}) do
    vehicle_li = Management.get_vehicle_li!(id)
    render(conn, "show.json", vehicle_li: vehicle_li)
  end

  def update(conn, params) do
    vehicle_li = Management.get_vehicle_li!(params["id"])

    with {:ok, %Vehicle_li{} = vehicle_li} <-
           Management.update_vehicle_li(vehicle_li, %{
             "plate" => params["plate"],
             "trademark" => params["trademark"],
             "type_vehicle" => params["type_vehicle"],
             "id_user" => params["id_user"]
           }) do
      render(conn, "show.json", vehicle_li: vehicle_li)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehicle_li = Management.get_vehicle_li!(id)

    with {:ok, %Vehicle_li{}} <- Management.delete_vehicle_li(vehicle_li) do
      send_resp(conn, :no_content, "")
    end
  end
end
