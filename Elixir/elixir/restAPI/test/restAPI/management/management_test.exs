defmodule RestAPI.ManagementTest do
  use RestAPI.DataCase

  alias RestAPI.Management

  describe "trademark" do
    alias RestAPI.Management.Trademark

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def trademark_fixture(attrs \\ %{}) do
      {:ok, trademark} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_trademark()

      trademark
    end

    test "list_trademark/0 returns all trademark" do
      trademark = trademark_fixture()
      assert Management.list_trademark() == [trademark]
    end

    test "get_trademark!/1 returns the trademark with given id" do
      trademark = trademark_fixture()
      assert Management.get_trademark!(trademark.id) == trademark
    end

    test "create_trademark/1 with valid data creates a trademark" do
      assert {:ok, %Trademark{} = trademark} = Management.create_trademark(@valid_attrs)
      assert trademark.description == "some description"
    end

    test "create_trademark/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_trademark(@invalid_attrs)
    end

    test "update_trademark/2 with valid data updates the trademark" do
      trademark = trademark_fixture()
      assert {:ok, trademark} = Management.update_trademark(trademark, @update_attrs)
      assert %Trademark{} = trademark
      assert trademark.description == "some updated description"
    end

    test "update_trademark/2 with invalid data returns error changeset" do
      trademark = trademark_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_trademark(trademark, @invalid_attrs)
      assert trademark == Management.get_trademark!(trademark.id)
    end

    test "delete_trademark/1 deletes the trademark" do
      trademark = trademark_fixture()
      assert {:ok, %Trademark{}} = Management.delete_trademark(trademark)
      assert_raise Ecto.NoResultsError, fn -> Management.get_trademark!(trademark.id) end
    end

    test "change_trademark/1 returns a trademark changeset" do
      trademark = trademark_fixture()
      assert %Ecto.Changeset{} = Management.change_trademark(trademark)
    end
  end

  describe "type_bodywork" do
    alias RestAPI.Management.Type_bodywork

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def type_bodywork_fixture(attrs \\ %{}) do
      {:ok, type_bodywork} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_type_bodywork()

      type_bodywork
    end

    test "list_type_bodywork/0 returns all type_bodywork" do
      type_bodywork = type_bodywork_fixture()
      assert Management.list_type_bodywork() == [type_bodywork]
    end

    test "get_type_bodywork!/1 returns the type_bodywork with given id" do
      type_bodywork = type_bodywork_fixture()
      assert Management.get_type_bodywork!(type_bodywork.id) == type_bodywork
    end

    test "create_type_bodywork/1 with valid data creates a type_bodywork" do
      assert {:ok, %Type_bodywork{} = type_bodywork} = Management.create_type_bodywork(@valid_attrs)
      assert type_bodywork.description == "some description"
    end

    test "create_type_bodywork/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_type_bodywork(@invalid_attrs)
    end

    test "update_type_bodywork/2 with valid data updates the type_bodywork" do
      type_bodywork = type_bodywork_fixture()
      assert {:ok, type_bodywork} = Management.update_type_bodywork(type_bodywork, @update_attrs)
      assert %Type_bodywork{} = type_bodywork
      assert type_bodywork.description == "some updated description"
    end

    test "update_type_bodywork/2 with invalid data returns error changeset" do
      type_bodywork = type_bodywork_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_type_bodywork(type_bodywork, @invalid_attrs)
      assert type_bodywork == Management.get_type_bodywork!(type_bodywork.id)
    end

    test "delete_type_bodywork/1 deletes the type_bodywork" do
      type_bodywork = type_bodywork_fixture()
      assert {:ok, %Type_bodywork{}} = Management.delete_type_bodywork(type_bodywork)
      assert_raise Ecto.NoResultsError, fn -> Management.get_type_bodywork!(type_bodywork.id) end
    end

    test "change_type_bodywork/1 returns a type_bodywork changeset" do
      type_bodywork = type_bodywork_fixture()
      assert %Ecto.Changeset{} = Management.change_type_bodywork(type_bodywork)
    end
  end

  describe "type_user" do
    alias RestAPI.Management.Type_user

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def type_user_fixture(attrs \\ %{}) do
      {:ok, type_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_type_user()

      type_user
    end

    test "list_type_user/0 returns all type_user" do
      type_user = type_user_fixture()
      assert Management.list_type_user() == [type_user]
    end

    test "get_type_user!/1 returns the type_user with given id" do
      type_user = type_user_fixture()
      assert Management.get_type_user!(type_user.id) == type_user
    end

    test "create_type_user/1 with valid data creates a type_user" do
      assert {:ok, %Type_user{} = type_user} = Management.create_type_user(@valid_attrs)
      assert type_user.description == "some description"
    end

    test "create_type_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_type_user(@invalid_attrs)
    end

    test "update_type_user/2 with valid data updates the type_user" do
      type_user = type_user_fixture()
      assert {:ok, type_user} = Management.update_type_user(type_user, @update_attrs)
      assert %Type_user{} = type_user
      assert type_user.description == "some updated description"
    end

    test "update_type_user/2 with invalid data returns error changeset" do
      type_user = type_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_type_user(type_user, @invalid_attrs)
      assert type_user == Management.get_type_user!(type_user.id)
    end

    test "delete_type_user/1 deletes the type_user" do
      type_user = type_user_fixture()
      assert {:ok, %Type_user{}} = Management.delete_type_user(type_user)
      assert_raise Ecto.NoResultsError, fn -> Management.get_type_user!(type_user.id) end
    end

    test "change_type_user/1 returns a type_user changeset" do
      type_user = type_user_fixture()
      assert %Ecto.Changeset{} = Management.change_type_user(type_user)
    end
  end

  describe "type_vehicle" do
    alias RestAPI.Management.Type_vehicle

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def type_vehicle_fixture(attrs \\ %{}) do
      {:ok, type_vehicle} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_type_vehicle()

      type_vehicle
    end

    test "list_type_vehicle/0 returns all type_vehicle" do
      type_vehicle = type_vehicle_fixture()
      assert Management.list_type_vehicle() == [type_vehicle]
    end

    test "get_type_vehicle!/1 returns the type_vehicle with given id" do
      type_vehicle = type_vehicle_fixture()
      assert Management.get_type_vehicle!(type_vehicle.id) == type_vehicle
    end

    test "create_type_vehicle/1 with valid data creates a type_vehicle" do
      assert {:ok, %Type_vehicle{} = type_vehicle} = Management.create_type_vehicle(@valid_attrs)
      assert type_vehicle.description == "some description"
    end

    test "create_type_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_type_vehicle(@invalid_attrs)
    end

    test "update_type_vehicle/2 with valid data updates the type_vehicle" do
      type_vehicle = type_vehicle_fixture()
      assert {:ok, type_vehicle} = Management.update_type_vehicle(type_vehicle, @update_attrs)
      assert %Type_vehicle{} = type_vehicle
      assert type_vehicle.description == "some updated description"
    end

    test "update_type_vehicle/2 with invalid data returns error changeset" do
      type_vehicle = type_vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_type_vehicle(type_vehicle, @invalid_attrs)
      assert type_vehicle == Management.get_type_vehicle!(type_vehicle.id)
    end

    test "delete_type_vehicle/1 deletes the type_vehicle" do
      type_vehicle = type_vehicle_fixture()
      assert {:ok, %Type_vehicle{}} = Management.delete_type_vehicle(type_vehicle)
      assert_raise Ecto.NoResultsError, fn -> Management.get_type_vehicle!(type_vehicle.id) end
    end

    test "change_type_vehicle/1 returns a type_vehicle changeset" do
      type_vehicle = type_vehicle_fixture()
      assert %Ecto.Changeset{} = Management.change_type_vehicle(type_vehicle)
    end
  end

  describe "users_li" do
    alias RestAPI.Management.Users_li

    @valid_attrs %{full_name: "some full_name", identification: "some identification", last_name: "some last_name", type_user: 42}
    @update_attrs %{full_name: "some updated full_name", identification: "some updated identification", last_name: "some updated last_name", type_user: 43}
    @invalid_attrs %{full_name: nil, identification: nil, last_name: nil, type_user: nil}

    def users_li_fixture(attrs \\ %{}) do
      {:ok, users_li} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_users_li()

      users_li
    end

    test "list_users_li/0 returns all users_li" do
      users_li = users_li_fixture()
      assert Management.list_users_li() == [users_li]
    end

    test "get_users_li!/1 returns the users_li with given id" do
      users_li = users_li_fixture()
      assert Management.get_users_li!(users_li.id) == users_li
    end

    test "create_users_li/1 with valid data creates a users_li" do
      assert {:ok, %Users_li{} = users_li} = Management.create_users_li(@valid_attrs)
      assert users_li.full_name == "some full_name"
      assert users_li.identification == "some identification"
      assert users_li.last_name == "some last_name"
      assert users_li.type_user == 42
    end

    test "create_users_li/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_users_li(@invalid_attrs)
    end

    test "update_users_li/2 with valid data updates the users_li" do
      users_li = users_li_fixture()
      assert {:ok, users_li} = Management.update_users_li(users_li, @update_attrs)
      assert %Users_li{} = users_li
      assert users_li.full_name == "some updated full_name"
      assert users_li.identification == "some updated identification"
      assert users_li.last_name == "some updated last_name"
      assert users_li.type_user == 43
    end

    test "update_users_li/2 with invalid data returns error changeset" do
      users_li = users_li_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_users_li(users_li, @invalid_attrs)
      assert users_li == Management.get_users_li!(users_li.id)
    end

    test "delete_users_li/1 deletes the users_li" do
      users_li = users_li_fixture()
      assert {:ok, %Users_li{}} = Management.delete_users_li(users_li)
      assert_raise Ecto.NoResultsError, fn -> Management.get_users_li!(users_li.id) end
    end

    test "change_users_li/1 returns a users_li changeset" do
      users_li = users_li_fixture()
      assert %Ecto.Changeset{} = Management.change_users_li(users_li)
    end
  end

  describe "vehicle_li" do
    alias RestAPI.Management.Vehicle_li

    @valid_attrs %{id_user: 42, plate: "some plate", trademark: 42, type_bodywork: 42, type_vehicle: 42}
    @update_attrs %{id_user: 43, plate: "some updated plate", trademark: 43, type_bodywork: 43, type_vehicle: 43}
    @invalid_attrs %{id_user: nil, plate: nil, trademark: nil, type_bodywork: nil, type_vehicle: nil}

    def vehicle_li_fixture(attrs \\ %{}) do
      {:ok, vehicle_li} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_vehicle_li()

      vehicle_li
    end

    test "list_vehicle_li/0 returns all vehicle_li" do
      vehicle_li = vehicle_li_fixture()
      assert Management.list_vehicle_li() == [vehicle_li]
    end

    test "get_vehicle_li!/1 returns the vehicle_li with given id" do
      vehicle_li = vehicle_li_fixture()
      assert Management.get_vehicle_li!(vehicle_li.id) == vehicle_li
    end

    test "create_vehicle_li/1 with valid data creates a vehicle_li" do
      assert {:ok, %Vehicle_li{} = vehicle_li} = Management.create_vehicle_li(@valid_attrs)
      assert vehicle_li.id_user == 42
      assert vehicle_li.plate == "some plate"
      assert vehicle_li.trademark == 42
      assert vehicle_li.type_bodywork == 42
      assert vehicle_li.type_vehicle == 42
    end

    test "create_vehicle_li/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_vehicle_li(@invalid_attrs)
    end

    test "update_vehicle_li/2 with valid data updates the vehicle_li" do
      vehicle_li = vehicle_li_fixture()
      assert {:ok, vehicle_li} = Management.update_vehicle_li(vehicle_li, @update_attrs)
      assert %Vehicle_li{} = vehicle_li
      assert vehicle_li.id_user == 43
      assert vehicle_li.plate == "some updated plate"
      assert vehicle_li.trademark == 43
      assert vehicle_li.type_bodywork == 43
      assert vehicle_li.type_vehicle == 43
    end

    test "update_vehicle_li/2 with invalid data returns error changeset" do
      vehicle_li = vehicle_li_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_vehicle_li(vehicle_li, @invalid_attrs)
      assert vehicle_li == Management.get_vehicle_li!(vehicle_li.id)
    end

    test "delete_vehicle_li/1 deletes the vehicle_li" do
      vehicle_li = vehicle_li_fixture()
      assert {:ok, %Vehicle_li{}} = Management.delete_vehicle_li(vehicle_li)
      assert_raise Ecto.NoResultsError, fn -> Management.get_vehicle_li!(vehicle_li.id) end
    end

    test "change_vehicle_li/1 returns a vehicle_li changeset" do
      vehicle_li = vehicle_li_fixture()
      assert %Ecto.Changeset{} = Management.change_vehicle_li(vehicle_li)
    end
  end
end
