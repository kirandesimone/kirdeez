defmodule Kirdeez.Blog do
  alias Kirdeez.Blog.Post

  use NimblePublisher,
    build: Post,
    from: "./lib/kirdeez/posts/**/*.md",
    as: :posts,
    highlighters: [:makeup_elixir, :makeup_erlang]

  @posts Enum.sort_by(@posts, &(&1.date), {:desc, Date})

  defmodule ErrorPostNotFound do
    defexception [:message, plug_status: 404]
  end
  def all_posts, do: @posts

  def get_post_by_id!(id) do
    Enum.find(all_posts(), &(&1.id == id)) || raise ErrorPostNotFound, "post not found"
  end

end
