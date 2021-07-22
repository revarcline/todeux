defmodule TodeuxWeb.AuthController do
  import Plug.Conn
  import Phoenix.Controller

  alias TodeuxWeb.Router.Helpers, as: Routes
  alias Todeux.User

  def init(opts), do: opts

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      email: auth.info.email,
      picture: auth.info.image,
      provider: "google"
    }

    changeset = User.changeset(%User{}, user_params)

    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Thank you for signing in!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.lobby_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end
end
