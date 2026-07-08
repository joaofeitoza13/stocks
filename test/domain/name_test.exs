defmodule Domain.NameTest do
  @moduledoc """
  Tests for Name's Domain
  """

  use ExUnit.Case
  alias Domain.Name

  test "create new valid name" do
    name = "PETR4"
    assert Name.new(name) == {:ok, name}
  end

  test "create an invalid name with 4 char's" do
    name = "PETR"
    error = "invalid name"
    assert Name.new(name) == {:error, error}
  end

  test "create an invalid name with 6 char's" do
    name = "PETR343"
    error = "invalid name"
    assert Name.new(name) == {:error, error}
  end
end
