using Plots

function mandelbrot(c, max_iter=100)
    z = 0 + 0im
    for n in 1:max_iter
        z = z^2 + c
        if abs(z) > 2
            return n  # Retorna número de iterações antes de divergir
        end
    end
    return max_iter  # Pertence ao conjunto de Mandelbrot
end

function generate_mandelbrot(xlim=(-2.0, 1.0), ylim=(-1.5, 1.5), resolution=500, max_iter=100)
    xvals = range(xlim[1], xlim[2], length=resolution)
    yvals = range(ylim[1], ylim[2], length=resolution)
    img = [mandelbrot(x + y*im, max_iter) for y in yvals, x in xvals]

    heatmap(xvals, yvals, img, color=:viridis, xlabel="Re(c)", ylabel="Im(c)", title="Conjunto de Mandelbrot")
end

# Gerar e visualizar o fractal
generate_mandelbrot()
