defmodule Domain.Name do
  @moduledoc """
  Module to define name domain.
  """

  @type t :: String.t()

  @spec new({String.t()}) :: {:ok, Name.t()} | {:error, String.t()}
  def new(value) do
    len = String.length(value)
    if len < 5 or len > 6 do
      {:error, "invalid name"}
    else
      {:ok, value}
    end
  end
end
