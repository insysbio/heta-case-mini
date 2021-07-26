using HetaSimulator, Plots

model = load_jlmodel("../dist/julia/model.jl")

res = sim(model; tspan = (0,120))

plotd = plot(res; vars = [:A, :B])
savefig(plotd, "julia-plot-1.png")

plotd = plot(res; vars = [:r1])
savefig(plotd, "julia-plot-2.png")
