defmodule SumaCombinacionObjetivo do
  def main do
    numeros = [2, 4, 6, 8]
    objetivo = 10

    IO.puts("Buscando combinacion en #{inspect(numeros)}que sume #{objetivo}")

    case encontrar_combinacion(numeros, objetivo) do
      nil -> IO.puts("No se encontró combinación")
      combinacion -> IO.puts("Combinación encontrada: #{inspect(combinacion)}")
    end
  end

  def encontrar_combinacion(numeros, objetivo) do
    buscar_combinacion(numeros, objetivo, 0, [])
  end

  defp buscar_combinacion(_numeros, objetivo, suma_actual, combinacion)
       when suma_actual == objetivo,
       do: combinacion

  defp buscar_combinacion(_numeros, objetivo, suma_actual, _combinacion)
       when suma_actual > objetivo,
       do: nil

  defp buscar_combinacion([], _objetivo, _suma_actual, _combinacion), do: nil

  defp buscar_combinacion([num | resto], objetivo, suma_actual, combinacion) do
    
    resultado = buscar_combinacion(resto, objetivo, suma_actual + num, [num | combinacion])


    if resultado,
      do: resultado,
      else: buscar_combinacion(resto, objetivo, suma_actual, combinacion)
  end
end

SumaCombinacionObjetivo.main()
