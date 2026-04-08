using Perlin, Plots

# Função para gerar um mapa usando Perlin Noise
function generate_perlin_map(size::Int, scale::Float64)
    noise = PerlinNoise()  # Inicializa o gerador de Perlin Noise
    map = [noise[x * scale, y * scale] for x in 1:size, y in 1:size]

    return map
end

# Função para visualizar o mapa com cores representando biomas
function plot_map(map)
    heatmap(map, color=:terrain, title="Mapa Procedural com Perlin Noise")
end

# Parâmetros do mapa
map_size = 100  # Tamanho do mapa (100x100)
scale_factor = 0.1  # Controle da suavidade dos detalhes

# Gerar e exibir o mapa
terrain_map = generate_perlin_map(map_size, scale_factor)
plot_map(terrain_map)
