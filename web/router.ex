defmodule PhoenixDdd.Router do
  use PhoenixDdd.Web, :router

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

  scope "/", PhoenixDdd do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/users" do
    pipe_through :api
    get "/:user_id", PhoenixDdd.UserController, :get_user
  end

  scope "/jobs" do
    pipe_through :api
    get "/:job_id", PhoenixDdd.JobController, :get_job
    post "", PhoenixDdd.JobController, :submit_job
  end
end
