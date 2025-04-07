defmodule InvertirLista do
  def main do
    listaN = [1, 2, 3, 4, 5]
    lista_inv = invertir(listaN)
    IO.puts("Lista: #{inspect(listaN)}")
    IO.puts("Lista invertida: #{inspect(lista_inv)}")
  end

  def invertir(lista) do
    invertir_r(lista, [])
  end

  defp invertir_r([], lista_inv), do: lista_inv

  defp invertir_r([head | tail ], lista_inv) do
    invertir_r(tail,[head|lista_inv])
  end
end
InvertirLista.main()
