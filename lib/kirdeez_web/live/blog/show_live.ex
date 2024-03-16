defmodule KirdeezWeb.Blog.ShowLive do
  use KirdeezWeb, :live_view

  alias Kirdeez.Blog

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class="text-whiteSmoke pb-2">
        <.link navigate={~p"/whatchamacallems"}>
          Back
        </.link>
      </p>
      <h1 class="font-bold text-3xl text-mint"><%= @post.title %></h1>
      <section class="mt-14">
        <%= raw @post.body %>
      </section>
    </div>
    """
  end

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    post =  Blog.get_post_by_id!(id)

    {:ok, assign(socket, post: post)}
  end

end
