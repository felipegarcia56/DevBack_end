defmodule RestAPI.Management do
  @moduledoc """
  The Management context.
  """

  import Ecto.Query, warn: false
  alias RestAPI.Repo

  alias RestAPI.Management.Trademark

  @doc """
  Returns the list of trademark.

  ## Examples

      iex> list_trademark()
      [%Trademark{}, ...]

  """
  def list_trademark do
    Repo.all(Trademark)
  end

  @doc """
  Gets a single trademark.

  Raises `Ecto.NoResultsError` if the Trademark does not exist.

  ## Examples

      iex> get_trademark!(123)
      %Trademark{}

      iex> get_trademark!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trademark!(id), do: Repo.get!(Trademark, id)

  @doc """
  Creates a trademark.

  ## Examples

      iex> create_trademark(%{field: value})
      {:ok, %Trademark{}}

      iex> create_trademark(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trademark(attrs \\ %{}) do
    %Trademark{}
    |> Trademark.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trademark.

  ## Examples

      iex> update_trademark(trademark, %{field: new_value})
      {:ok, %Trademark{}}

      iex> update_trademark(trademark, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trademark(%Trademark{} = trademark, attrs) do
    trademark
    |> Trademark.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Trademark.

  ## Examples

      iex> delete_trademark(trademark)
      {:ok, %Trademark{}}

      iex> delete_trademark(trademark)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trademark(%Trademark{} = trademark) do
    Repo.delete(trademark)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trademark changes.

  ## Examples

      iex> change_trademark(trademark)
      %Ecto.Changeset{source: %Trademark{}}

  """
  def change_trademark(%Trademark{} = trademark) do
    Trademark.changeset(trademark, %{})
  end

  alias RestAPI.Management.Type_bodywork

  @doc """
  Returns the list of type_bodywork.

  ## Examples

      iex> list_type_bodywork()
      [%Type_bodywork{}, ...]

  """
  def list_type_bodywork do
    Repo.all(Type_bodywork)
  end

  @doc """
  Gets a single type_bodywork.

  Raises `Ecto.NoResultsError` if the Type bodywork does not exist.

  ## Examples

      iex> get_type_bodywork!(123)
      %Type_bodywork{}

      iex> get_type_bodywork!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type_bodywork!(id), do: Repo.get!(Type_bodywork, id)

  @doc """
  Creates a type_bodywork.

  ## Examples

      iex> create_type_bodywork(%{field: value})
      {:ok, %Type_bodywork{}}

      iex> create_type_bodywork(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type_bodywork(attrs \\ %{}) do
    %Type_bodywork{}
    |> Type_bodywork.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type_bodywork.

  ## Examples

      iex> update_type_bodywork(type_bodywork, %{field: new_value})
      {:ok, %Type_bodywork{}}

      iex> update_type_bodywork(type_bodywork, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type_bodywork(%Type_bodywork{} = type_bodywork, attrs) do
    type_bodywork
    |> Type_bodywork.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Type_bodywork.

  ## Examples

      iex> delete_type_bodywork(type_bodywork)
      {:ok, %Type_bodywork{}}

      iex> delete_type_bodywork(type_bodywork)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type_bodywork(%Type_bodywork{} = type_bodywork) do
    Repo.delete(type_bodywork)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type_bodywork changes.

  ## Examples

      iex> change_type_bodywork(type_bodywork)
      %Ecto.Changeset{source: %Type_bodywork{}}

  """
  def change_type_bodywork(%Type_bodywork{} = type_bodywork) do
    Type_bodywork.changeset(type_bodywork, %{})
  end

  alias RestAPI.Management.Type_user

  @doc """
  Returns the list of type_user.

  ## Examples

      iex> list_type_user()
      [%Type_user{}, ...]

  """
  def list_type_user do
    Repo.all(Type_user)
  end

  @doc """
  Gets a single type_user.

  Raises `Ecto.NoResultsError` if the Type user does not exist.

  ## Examples

      iex> get_type_user!(123)
      %Type_user{}

      iex> get_type_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type_user!(id), do: Repo.get!(Type_user, id)

  @doc """
  Creates a type_user.

  ## Examples

      iex> create_type_user(%{field: value})
      {:ok, %Type_user{}}

      iex> create_type_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type_user(attrs \\ %{}) do
    %Type_user{}
    |> Type_user.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type_user.

  ## Examples

      iex> update_type_user(type_user, %{field: new_value})
      {:ok, %Type_user{}}

      iex> update_type_user(type_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type_user(%Type_user{} = type_user, attrs) do
    type_user
    |> Type_user.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Type_user.

  ## Examples

      iex> delete_type_user(type_user)
      {:ok, %Type_user{}}

      iex> delete_type_user(type_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type_user(%Type_user{} = type_user) do
    Repo.delete(type_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type_user changes.

  ## Examples

      iex> change_type_user(type_user)
      %Ecto.Changeset{source: %Type_user{}}

  """
  def change_type_user(%Type_user{} = type_user) do
    Type_user.changeset(type_user, %{})
  end

  alias RestAPI.Management.Type_vehicle

  @doc """
  Returns the list of type_vehicle.

  ## Examples

      iex> list_type_vehicle()
      [%Type_vehicle{}, ...]

  """
  def list_type_vehicle do
    Repo.all(Type_vehicle)
  end

  @doc """
  Gets a single type_vehicle.

  Raises `Ecto.NoResultsError` if the Type vehicle does not exist.

  ## Examples

      iex> get_type_vehicle!(123)
      %Type_vehicle{}

      iex> get_type_vehicle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type_vehicle!(id), do: Repo.get!(Type_vehicle, id)

  @doc """
  Creates a type_vehicle.

  ## Examples

      iex> create_type_vehicle(%{field: value})
      {:ok, %Type_vehicle{}}

      iex> create_type_vehicle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type_vehicle(attrs \\ %{}) do
    %Type_vehicle{}
    |> Type_vehicle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type_vehicle.

  ## Examples

      iex> update_type_vehicle(type_vehicle, %{field: new_value})
      {:ok, %Type_vehicle{}}

      iex> update_type_vehicle(type_vehicle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type_vehicle(%Type_vehicle{} = type_vehicle, attrs) do
    type_vehicle
    |> Type_vehicle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Type_vehicle.

  ## Examples

      iex> delete_type_vehicle(type_vehicle)
      {:ok, %Type_vehicle{}}

      iex> delete_type_vehicle(type_vehicle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type_vehicle(%Type_vehicle{} = type_vehicle) do
    Repo.delete(type_vehicle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type_vehicle changes.

  ## Examples

      iex> change_type_vehicle(type_vehicle)
      %Ecto.Changeset{source: %Type_vehicle{}}

  """
  def change_type_vehicle(%Type_vehicle{} = type_vehicle) do
    Type_vehicle.changeset(type_vehicle, %{})
  end

  alias RestAPI.Management.Users_li

  @doc """
  Returns the list of users_li.

  ## Examples

      iex> list_users_li()
      [%Users_li{}, ...]

  """
  def list_users_li do
    # Repo.all(Users_li)
    Repo.all(
      from(u in Users_li,
        join: t in Type_user,
        where: u.type_user == t.id,
        select: %{
          :id => u.id,
          :last_name => u.last_name,
          :full_name => u.full_name,
          :identification => u.identification,
          :type_user => t.description
        }
      )
    )
  end

  @doc """
  Gets a single users_li.

  Raises `Ecto.NoResultsError` if the Users li does not exist.

  ## Examples

      iex> get_users_li!(123)
      %Users_li{}

      iex> get_users_li!(456)
      ** (Ecto.NoResultsError)

  """
  def get_users_li!(id), do: Repo.get!(Users_li, id)

  @doc """
  Creates a users_li.

  ## Examples

      iex> create_users_li(%{field: value})
      {:ok, %Users_li{}}

      iex> create_users_li(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_users_li(attrs \\ %{}) do
    %Users_li{}
    |> Users_li.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a users_li.

  ## Examples

      iex> update_users_li(users_li, %{field: new_value})
      {:ok, %Users_li{}}

      iex> update_users_li(users_li, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_users_li(%Users_li{} = users_li, attrs) do
    users_li
    |> Users_li.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Users_li.

  ## Examples

      iex> delete_users_li(users_li)
      {:ok, %Users_li{}}

      iex> delete_users_li(users_li)
      {:error, %Ecto.Changeset{}}

  """
  def delete_users_li(%Users_li{} = users_li) do
    Repo.delete(users_li)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking users_li changes.

  ## Examples

      iex> change_users_li(users_li)
      %Ecto.Changeset{source: %Users_li{}}

  """
  def change_users_li(%Users_li{} = users_li) do
    Users_li.changeset(users_li, %{})
  end

  alias RestAPI.Management.Vehicle_li

  @doc """
  Returns the list of vehicle_li.

  ## Examples

      iex> list_vehicle_li()
      [%Vehicle_li{}, ...]

  """
  def list_vehicle_li do
    Repo.all(Vehicle_li)
  end

  @doc """
  Gets a single vehicle_li.

  Raises `Ecto.NoResultsError` if the Vehicle li does not exist.

  ## Examples

      iex> get_vehicle_li!(123)
      %Vehicle_li{}

      iex> get_vehicle_li!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vehicle_li!(id), do: Repo.get!(Vehicle_li, id)

  @doc """
  Creates a vehicle_li.

  ## Examples

      iex> create_vehicle_li(%{field: value})
      {:ok, %Vehicle_li{}}

      iex> create_vehicle_li(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vehicle_li(attrs \\ %{}) do
    %Vehicle_li{}
    |> Vehicle_li.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vehicle_li.

  ## Examples

      iex> update_vehicle_li(vehicle_li, %{field: new_value})
      {:ok, %Vehicle_li{}}

      iex> update_vehicle_li(vehicle_li, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vehicle_li(%Vehicle_li{} = vehicle_li, attrs) do
    vehicle_li
    |> Vehicle_li.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Vehicle_li.

  ## Examples

      iex> delete_vehicle_li(vehicle_li)
      {:ok, %Vehicle_li{}}

      iex> delete_vehicle_li(vehicle_li)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vehicle_li(%Vehicle_li{} = vehicle_li) do
    Repo.delete(vehicle_li)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vehicle_li changes.

  ## Examples

      iex> change_vehicle_li(vehicle_li)
      %Ecto.Changeset{source: %Vehicle_li{}}

  """
  def change_vehicle_li(%Vehicle_li{} = vehicle_li) do
    Vehicle_li.changeset(vehicle_li, %{})
  end

  def gerl_info(params) do
    name = params["name"]
    plate = params["plate"]
    ident = params["identification"]
    data = "#{name}"
    data2 = "#{plate}"
    data3 = "#{ident}"

    Repo.all(
      from(u in Users_li,
        join: v in Vehicle_li,
        on: v.id_user == u.id,
        join: tm in Trademark,
        on: tm.id == v.trademark,
        join: tb in Type_bodywork,
        on: tb.id == v.type_bodywork,
        join: tv in Type_vehicle,
        on: tv.id == v.type_vehicle,
        where:
          fragment("concat(?,' ',?)", u.last_name, u.full_name) == ^data or v.plate == ^data2 or
            u.identification == ^data3,
        select: %{
          id: u.id,
          last_name: u.last_name,
          full_name: u.full_name,
          trademark: tm.description,
          type_bw: tb.description,
          type_v: tv.description,
          plate: v.plate
        }
      )
    )
  end

  def uInfo(params) do
    ident = params["ident"]
    data = "#{ident}"

    Repo.all(
      from(u in Users_li,
        where: u.identification == ^data,
        select: %{
          id: u.id,
          last_name: u.last_name,
          full_name: u.full_name,
          identification: u.identification
        }
      )
    )
  end
end
