using Plots

# Configuração dos pinos
function initialize_hanoi(n)
    return [collect(n:-1:1), [], []]  # Pino 1 com discos, os outros vazios
end

# Função recursiva para resolver a Torre de Hanoi
function hanoi(n, from, to, aux, state, moves)
    if n == 1
        push!(moves, (from, to))
        move_disk!(state, from, to)
    else
        hanoi(n - 1, from, aux, to, state, moves)
        push!(moves, (from, to))
        move_disk!(state, from, to)
        hanoi(n - 1, aux, to, from, state, moves)
    end
end

# Função para mover um disco e atualizar o estado
function move_disk!(state, from, to)
    disk = pop!(state[from])
    push!(state[to], disk)
end

# Função para desenhar os pinos e discos
function plot_hanoi(state, step)
    p = plot(legend=false, xlims=(0, 4), ylims=(0, length(state[1]) + 3), grid=false, title="Passo $step")
    colors = [:blue, :green, :red, :orange, :purple]
    
    for (i, peg) in enumerate(state)
        for (j, disk) in enumerate(peg)
            plot!([i - 0.3, i + 0.3], [j, j], linewidth=10, color=colors[disk])
        end
    end
    display(p)
    sleep(0.5)  # Pausa para animação
end

# Função principal para resolver e animar a Torre de Hanoi
function solve_hanoi(n)
    state = initialize_hanoi(n)
    moves = []
    hanoi(n, 1, 3, 2, state, moves)
    
    for (step, (from, to)) in enumerate(moves)
        move_disk!(state, from, to)
        plot_hanoi(state, step)
    end
end

# Executar a animação com 4 discos
solve_hanoi(4)
