defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic
  alias Discuss.Repo

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render(conn, "index.html", topics: topics)
  end

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
      {:ok, post} ->
        render(conn, "topics.html", changeset: changeset)
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
