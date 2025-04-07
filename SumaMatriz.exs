defmodule SumaMatriz do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    total = sumar_matriz(matriz)
    IO.puts("Matriz : ")
    imprimir_matriz(matriz)
    IO.puts("\nLa suma total de todos los elementos es: #{total}")
  end

  defp imprimir_matriz(matriz) do
    Enum.each(matriz, fn fila -> IO.inspect(fila) end)
  end

  def sumar_matriz(matriz) do
    sumar_matriz_r(matriz, 0)
  end

  defp sumar_matriz_r([], suma_acumulada), do: suma_acumulada

  defp sumar_matriz_r([fila | resto_filas], suma_acumulada) do
    suma_fila = sumar_fila_r(fila, 0)
    sumar_matriz_r(resto_filas, suma_acumulada + suma_fila)
  end

  defp sumar_fila_r([], suma_acumulada), do: suma_acumulada

  defp sumar_fila_r([elemento | resto ], suma_acumulada) do
    sumar_fila_r(resto, suma_acumulada + elemento)
  end

end

SumaMatriz.main()
