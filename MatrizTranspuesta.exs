defmodule Transpuesta do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    IO.puts("Matriz: ")
    imprimir_matriz(matriz)

    transpuesta = transponer(matriz)
    IO.puts("\nMatriz Transpuesta: ")
    imprimir_matriz(transpuesta)
  end

  defp imprimir_matriz(matriz) do
    Enum.each(matriz, fn fila -> IO.inspect(fila) end)
  end

  def transponer(matriz) do
    num_columnas = length(hd(matriz))
    transponer_r(matriz, num_columnas, [])
  end

  defp transponer_r(_matriz, 0, resultado), do: Enum.reverse(resultado)

  defp transponer_r(matriz, col_restantes, resultado) do
    columna_actual = extraer_columna(matriz, [])
    matriz_sin_col = quitar_primer_elemento(matriz, [])
    transponer_r(matriz_sin_col, col_restantes - 1, [columna_actual | resultado])
  end

  defp extraer_columna([], resultado), do: Enum.reverse(resultado)

  defp extraer_columna([fila | resto], resultado) do
    [primer_elemento | _] = fila
    extraer_columna(resto, [primer_elemento | resultado])
  end


  defp quitar_primer_elemento([], resultado), do: Enum.reverse(resultado)

  defp quitar_primer_elemento([fila | resto], resultado) do
    [_ | elementos_restantes] = fila
    quitar_primer_elemento(resto, [elementos_restantes | resultado])
  end
end

Transpuesta.main()
