defmodule TodeuxWeb.UserOauthController do
  use TodeuxWeb, :controller

  alias Todeux.Accounts
  alias TodeuxWeb.UserAuth

  plug Ueberauth

  @rand_pass_length 32

  def callback(%{assigns: %{ueberauth_auth: %{info: user_info}}} = conn, params) do
    user_params = %{
      email: user_info.email,
      password: random_password(),
      username: user_info.name,
      provider: params["provider"]
    }

    case Accounts.fetch_or_create_user(user_params) do
      {:ok, user} ->
        UserAuth.log_in_user(conn, user)

      _ ->
        fail_auth(conn)
    end
  end

  def callback(conn, _params) do
    fail_auth(conn)
  end

  defp fail_auth(conn) do
    conn
    |> put_flash(:error, "Authentication failed")
    |> redirect(to: "/")
  end

  defp random_password do
    :crypto.strong_rand_bytes(@rand_pass_length) |> Base.encode64()
  end
end
