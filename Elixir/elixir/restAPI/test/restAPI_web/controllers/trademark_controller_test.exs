defmodule RestAPIWeb.TrademarkControllerTest do
  use RestAPIWeb.ConnCase

  alias RestAPI.Management
  alias RestAPI.Management.Trademark

  @create_attrs %{description: "some description"}
  @update_attrs %{description: "some updated description"}
  @invalid_attrs %{description: nil}

  def fixture(:trademark) do
    {:ok, trademark} = Management.create_trademark(@create_attrs)
    trademark
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all trademark", %{conn: conn} do
      conn = get conn, trademark_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create trademark" do
    test "renders trademark when data is valid", %{conn: conn} do
      conn = post conn, trademark_path(conn, :create), trademark: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, trademark_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, trademark_path(conn, :create), trademark: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update trademark" do
    setup [:create_trademark]

    test "renders trademark when data is valid", %{conn: conn, trademark: %Trademark{id: id} = trademark} do
      conn = put conn, trademark_path(conn, :update, trademark), trademark: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, trademark_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description"}
    end

    test "renders errors when data is invalid", %{conn: conn, trademark: trademark} do
      conn = put conn, trademark_path(conn, :update, trademark), trademark: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete trademark" do
    setup [:create_trademark]

    test "deletes chosen trademark", %{conn: conn, trademark: trademark} do
      conn = delete conn, trademark_path(conn, :delete, trademark)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, trademark_path(conn, :show, trademark)
      end
    end
  end

  defp create_trademark(_) do
    trademark = fixture(:trademark)
    {:ok, trademark: trademark}
  end
end
