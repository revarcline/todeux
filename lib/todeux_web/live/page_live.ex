defmodule TodeuxWeb.PageLive do
  use TodeuxWeb, :live_view
  alias Todeux.TodoLists

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"Rendering LiveView"
  end
end
