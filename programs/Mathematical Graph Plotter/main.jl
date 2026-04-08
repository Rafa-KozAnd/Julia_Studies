using Plots

function plot_function(f::Function, x_range=(-10, 10); color=:blue, linestyle=:solid, title="Gráfico da Função", xlabel="x", ylabel="f(x)", save_path=nothing)
    x = range(x_range[1], x_range[2], length=100)  # Gera valores de x no intervalo
    y = f.(x)  # Aplica a função a cada valor de x

    plot(x, y, color=color, linestyle=linestyle, lw=2, title=title, xlabel=xlabel, ylabel=ylabel, legend=false)

    if save_path !== nothing
        savefig(save_path)  # Salva o gráfico no arquivo especificado
        println("Gráfico salvo em: $save_path")
    end
end

# Exemplo de uso:
plot_function(sin, (-2π, 2π), color=:red, linestyle=:dash, title="Seno de x", save_path="seno_plot.png")
