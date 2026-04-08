using Random, LinearAlgebra, Plots

function simulate_markov(transition_matrix::Matrix{Float64}, initial_state::Vector{Float64}, steps::Int)
    num_states = size(transition_matrix, 1)
    state = initial_state
    history = zeros(steps, num_states)

    for t in 1:steps
        state = state' * transition_matrix  # Multiplica vetor de estado pela matriz de transição
        history[t, :] = state
    end

    # Plotando a evolução das probabilidades dos estados
    plot(1:steps, history, label=["Estado $i" for i in 1:num_states], lw=2,
         xlabel="Passos", ylabel="Probabilidade", title="Evolução da Cadeia de Markov")
end

# Exemplo de uso:
P = [0.7 0.2 0.1; 0.3 0.5 0.2; 0.4 0.1 0.5]  # Matriz de transição
s0 = [1.0, 0.0, 0.0]  # Começa no primeiro estado

simulate_markov(P, s0, 20)  # Simula 20 passos
