defmodule TodeuxWeb.PageLiveTest do
  use TodeuxWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Todeux"
    assert render(page_live) =~ "Todeux"
  end
end
