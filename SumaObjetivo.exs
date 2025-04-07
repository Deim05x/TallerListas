defmodule SumaObjetivo do
  def main do
    lista = [1, 2, 3, 4]
    objetivo = 5

    IO.puts("Buscando combinaciones de #{inspect(lista)} que sumen #{objetivo}")

    case encontrar_combinaciones(lista, objetivo) do
      [] -> IO.puts("No se encontraron combinaciones")
      combinaciones -> Enum.each(combinaciones, &IO.inspect/1)
    end
  end

  def encontrar_combinaciones(lista, objetivo) do
    # Ordenamos la lista para mejorar la eficiencia
    lista_ordenada = Enum.sort(lista)

    buscar([], lista_ordenada, objetivo, [])
    # Eliminamos duplicados
    |> Enum.uniq()
  end

  # Caso base: lista vacía
  defp buscar(combinacion_actual, [], _objetivo, resultados), do: resultados

  # Caso recursivo
  defp buscar(combinacion_actual, [num | resto], objetivo, resultados) do
    nueva_combinacion = [num | combinacion_actual]
    suma = Enum.sum(nueva_combinacion)

    cond do
      suma == objetivo ->
        buscar(combinacion_actual, resto, objetivo, [nueva_combinacion | resultados])

      suma < objetivo ->
        # Probamos incluyendo el número otra vez (permite repeticiones)
        res1 = buscar(nueva_combinacion, resto, objetivo, resultados)
        # Probamos sin incluir el número
        buscar(combinacion_actual, resto, objetivo, res1)

      true ->
        # Suma excede el objetivo
        buscar(combinacion_actual, resto, objetivo, resultados)
    end
  end
end

SumaObjetivo.main()
