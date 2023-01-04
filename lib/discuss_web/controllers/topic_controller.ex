defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic
  alias Discuss.Repo

  def new(conn, params) do
    struct = %Topic{}
    params = %{}
    changeset = Topic.changeset(struct, params)

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic} = params) do
    # IO.inspect(conn)
    # IO.inspect(params)
    changeset = Topic.changeset(%Topic{}, topic)
    case Repo.insert(changeset) do
      {:ok, post -> IO.inspect(post)}
      {:error, changeset} -> IO.inspect(changeset)
    end
  end

end
