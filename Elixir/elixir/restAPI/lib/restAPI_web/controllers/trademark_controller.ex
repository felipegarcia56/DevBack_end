defmodule RestAPIWeb.TrademarkController do
  use RestAPIWeb, :controller

  alias RestAPI.Management
  alias RestAPI.Management.Trademark

  action_fallback(RestAPIWeb.FallbackController)

  def index(conn, _params) do
    trademark = Management.list_trademark()
    render(conn, "index.json", trademark: trademark)
  end

  def create(conn, params) do
    with {:ok, %Trademark{} = trademark} <- Management.create_trademark(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", trademark_path(conn, :show, trademark))
      |> render("show.json", trademark: trademark)
    end
  end

  def show(conn, %{"id" => id}) do
    trademark = Management.get_trademark!(id)
    render(conn, "show.json", trademark: trademark)
  end

  def update(conn, params) do
    trademark = Management.get_trademark!(params["id"])

    with {:ok, %Trademark{} = trademark} <-
           Management.update_trademark(trademark, %{"description" => params["description"]}) do
      render(conn, "show.json", trademark: trademark)
    end
  end

  def delete(conn, %{"id" => id}) do
    trademark = Management.get_trademark!(id)

    with {:ok, %Trademark{}} <- Management.delete_trademark(trademark) do
      send_resp(conn, :no_content, "")
    end
  end
end
