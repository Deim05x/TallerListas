defmodule ElementosPares do
  def main do
    list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    total_pares = contar_pares(list)
    IO.puts("lista original: #{inspect(list)}")
    IO.puts("Total de numeros pares : #{total_pares}")
  end

  def contar_pares(list) do
    contar_pares_r(list, 0)
  end

  defp contar_pares_r([], contador), do: contador

  defp contar_pares_r([head | tail], contador) when rem(head, 2) == 0 do
    IO.puts("numero par: #{head}")
    contar_pares_r(tail, contador + 1)
  end

  defp contar_pares_r([_head | tail], contador) do
    contar_pares_r(tail, contador)
  end
end

ElementosPares.main()
