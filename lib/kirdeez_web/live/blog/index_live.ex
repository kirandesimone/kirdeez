defmodule KirdeezWeb.Blog.IndexLive do
  use KirdeezWeb, :live_view

  alias Kirdeez.Blog

  @impl true
  def render(assigns) do
    ~H"""
    <p class="pb-2 text-whiteSmoke">
      <.link navigate={~p"/"}>Home</.link>
    </p>
    <div class="grid gap-12">
      <div class="flex">
        <h1 class="font-bold text-2xl text-mint">
          Whatcha-Ma-Callems
        </h1>
      </div>
      <ul>
        <%= for post <- @posts do %>
          <li class="pb-14">
            <.link navigate={~p"/whatchamacallems/#{post.id}"}>
              <h2 class="font-bold text-3xl text-mint"><%= post.title %></h2>
              <time class="text-whiteSmoke"><%= post.date %></time>
              <p class="pt-2 text-whiteSmoke"><%= post.description %></p>
            </.link>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    posts = Blog.all_posts()
    {:ok, assign(socket, posts: posts)}
  end
end
