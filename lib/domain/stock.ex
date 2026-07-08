defmodule Domain.Stock do
  @moduledoc """
  Stock's domain
  """
  alias Domain.{Name, Price}
  @type t :: %__MODULE__{name: Name.t(), price: Price.t()}
  @type result :: {:ok, Stock.t()} | {:error, String.t()}

  @enforce_keys [:name, :price]
  defstruct [:name, :price]

  @spec new(String.t(), float()) :: result()
  def new(rname, rprice) do
    with {:ok, name} <- Name.new(rname), {:ok, price} <- Price.new(rprice) do
      {:ok, %__MODULE__{name: name, price: price}}
    else
      error -> error
    end
  end

  @spec change_price(Stock.t(), float()) :: result()
  def change_price(stock, rprice) do
    case Price.new(rprice) do
      {:ok, price} -> %__MODULE__{stock | price: price}
      error -> error
    end
  end
end
