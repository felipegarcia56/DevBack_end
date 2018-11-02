defmodule RestAPIWeb.Router do
  use RestAPIWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(CORSPlug, origin: "*")
    plug(:accepts, ["json"])
  end

  scope "/", RestAPIWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  scope "/api", RestAPIWeb do
    pipe_through(:api)

    resources("/trademark", TrademarkController, only: [:index, :show])
    post("/createT", TrademarkController, :create)
    post("/updateT", TrademarkController, :update)

    resources("/typeTb", Type_bodyworkController, only: [:index, :show])
    post("/createTb", Type_bodyworkController, :create)
    post("/updateTb", Type_bodyworkController, :update)

    resources("/typeV", Type_vehicleController, only: [:index, :show])
    post("/createTv", Type_vehicleController, :create)
    post("/updateTv", Type_vehicleController, :update)

    resources("/typeU", Type_userController, only: [:index, :show])
    post("/createTu", Type_userController, :create)
    post("/updateTu", Type_userController, :update)

    resources("/users", Users_liController, only: [:index, :show])
    post("/createU", Users_liController, :create)
    post("/updateU", Users_liController, :update)

    resources("/vehicle", Vehicle_liController, only: [:index, :show])
    post("/createV", Vehicle_liController, :create)
    post("/updateV", Vehicle_liController, :update)

    get("/grlInfo", Users_liController, :info)
    get("/grlUser", Users_liController, :uInf)
  end

  scope "/api/v1", Server do
    pipe_through(:api)

    resources("/users", UserController)
    options("/users", UserController, :options)
    get("/users", UserController, :index)
  end
end
