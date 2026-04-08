using Random

function detect_duplicates(numbers::Vector{Int})
    counts = Dict{Int, Int}()  # Dicionário para contar as ocorrências

    # Conta a frequência de cada número
    for num in numbers
        counts[num] = get(counts, num, 0) + 1
    end

    # Filtra apenas os números repetidos
    repeated_numbers = filter(p -> p[2] > 1, counts)

    if isempty(repeated_numbers)
        println("Não há números repetidos na lista.")
    else
        println("Números repetidos e suas contagens:")
        for (num, count) in repeated_numbers
            println("Número $num aparece $count vezes.")
        end
    end
end

# Exemplo de uso:
list = rand(1:20, 30)  # Gera uma lista aleatória de 30 números entre 1 e 20
println("Lista original: ", list)
detect_duplicates(list)
