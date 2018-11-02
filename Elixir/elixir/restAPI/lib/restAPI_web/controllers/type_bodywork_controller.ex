defmodule RestAPIWeb.Type_bodyworkController do
  use RestAPIWeb, :controller

  alias RestAPI.Management
  alias RestAPI.Management.Type_bodywork

  action_fallback(RestAPIWeb.FallbackController)

  def index(conn, _params) do
    type_bodywork = Management.list_type_bodywork()
    render(conn, "index.json", type_bodywork: type_bodywork)
  end

  def create(conn, params) do
    with {:ok, %Type_bodywork{} = type_bodywork} <- Management.create_type_bodywork(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", type_bodywork_path(conn, :show, type_bodywork))
      |> render("show.json", type_bodywork: type_bodywork)
    end
  end

  def show(conn, %{"id" => id}) do
    type_bodywork = Management.get_type_bodywork!(id)
    render(conn, "show.json", type_bodywork: type_bodywork)
  end

  def update(conn, params) do
    type_bodywork = Management.get_type_bodywork!(params["id"])

    with {:ok, %Type_bodywork{} = type_bodywork} <-
           Management.update_type_bodywork(type_bodywork, %{
             "descriptions" => params["description"]
           }) do
      render(conn, "show.json", type_bodywork: type_bodywork)
    end
  end

  def delete(conn, %{"id" => id}) do
    type_bodywork = Management.get_type_bodywork!(id)

    with {:ok, %Type_bodywork{}} <- Management.delete_type_bodywork(type_bodywork) do
      send_resp(conn, :no_content, "")
    end
  end
end
