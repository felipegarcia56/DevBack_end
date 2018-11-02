defmodule RestAPIWeb.Type_vehicleController do
  use RestAPIWeb, :controller

  alias RestAPI.Management
  alias RestAPI.Management.Type_vehicle

  action_fallback(RestAPIWeb.FallbackController)

  def index(conn, _params) do
    type_vehicle = Management.list_type_vehicle()
    render(conn, "index.json", type_vehicle: type_vehicle)
  end

  def create(conn, params) do
    with {:ok, %Type_vehicle{} = type_vehicle} <- Management.create_type_vehicle(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", type_vehicle_path(conn, :show, type_vehicle))
      |> render("show.json", type_vehicle: type_vehicle)
    end
  end

  def show(conn, %{"id" => id}) do
    type_vehicle = Management.get_type_vehicle!(id)
    render(conn, "show.json", type_vehicle: type_vehicle)
  end

  def update(conn, params) do
    type_vehicle = Management.get_type_vehicle!(params["id"])

    with {:ok, %Type_vehicle{} = type_vehicle} <-
           Management.update_type_vehicle(type_vehicle, params["description"]) do
      render(conn, "show.json", type_vehicle: type_vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    type_vehicle = Management.get_type_vehicle!(id)

    with {:ok, %Type_vehicle{}} <- Management.delete_type_vehicle(type_vehicle) do
      send_resp(conn, :no_content, "")
    end
  end
end
