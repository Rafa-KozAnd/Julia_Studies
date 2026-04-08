using Images, ImageFiltering, Plots

# Função para converter para escala de cinza
function to_grayscale(img)
    return Gray.(img)
end

# Função para inverter cores
function invert_colors(img)
    return 1 .- img
end

# Função para aplicar blur (suavização)
function apply_blur(img, sigma=2)
    return imfilter(img, Kernel.gaussian(sigma))
end

# Função para detecção de bordas usando o filtro Sobel
function edge_detection(img)
    img_gray = to_grayscale(img)
    kernel = Kernel.sobel()
    return imfilter(img_gray, kernel)
end

# Função principal
function process_image(image_path::String)
    img = load(image_path)  # Carrega a imagem

    # Aplicação dos filtros
    img_gray = to_grayscale(img)
    img_inverted = invert_colors(img)
    img_blur = apply_blur(img)
    img_edges = edge_detection(img)

    # Exibir imagens lado a lado
    plot(
        plot(img, title="Original"),
        plot(img_gray, title="Escala de Cinza"),
        plot(img_inverted, title="Inversão"),
        plot(img_blur, title="Blur"),
        plot(img_edges, title="Detecção de Bordas"),
        layout=(2,3)
    )
end

# Exemplo de uso: processar uma imagem
process_image("imagem_exemplo.jpg")
