defmodule RestAPIWeb.PageController do
  use RestAPIWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
