defmodule Playerfinder.Router do
  use Playerfinder.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Playerfinder do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/sign_up", UserController, :new, as: :sign_up
    get "/sign_in", SessionController, :new, as: :sign_in
    resources "/users", UserController, only: [:create]
    resources "/dashboard", DashboardController, only: [:show], singleton: true
    resources "/session", SessionController, only: [:delete, :create], singleton: true
    resources "/post", PostController, only: [:new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Playerfinder do
  #   pipe_through :api
  # end
end
