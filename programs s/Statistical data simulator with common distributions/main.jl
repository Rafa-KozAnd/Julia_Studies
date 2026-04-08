using Distributions, Plots, Statistics

function simulate_distribution(dist_type::String, n::Int; params...)
    if dist_type == "normal"
        μ, σ = params[:mean], params[:std]
        dist = Normal(μ, σ)
    elseif dist_type == "uniform"
        a, b = params[:min], params[:max]
        dist = Uniform(a, b)
    elseif dist_type == "exponential"
        λ = params[:lambda]
        dist = Exponential(λ)
    elseif dist_type == "poisson"
        λ = params[:lambda]
        dist = Poisson(λ)
    else
        error("Distribuição não suportada")
    end

    data = rand(dist, n)  # Gera os dados

    # Estatísticas descritivas
    println("Média: ", mean(data))
    println("Mediana: ", median(data))
    println("Desvio Padrão: ", std(data))
    println("Mínimo: ", minimum(data), " | Máximo: ", maximum(data))

    # Plotando histograma
    histogram(data, bins=30, alpha=0.6, label="Histograma", title="Distribuição $dist_type", xlabel="Valor", ylabel="Frequência", color=:blue)
end

# Exemplo de uso:
simulate_distribution("normal", 1000, mean=0, std=1)
