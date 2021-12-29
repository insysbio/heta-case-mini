using HetaSimulator, Plots
ENV["GKSwstype"] = "100"

model = load_jlmodel("../dist/julia/model.jl")

res = Scenario(model; tspan = (0,120)) |> sim

plotd = plot(res; vars = [:A, :B])
savefig(plotd, "julia-plot-1.png")

plotd = plot(res; vars = [:r1])
savefig(plotd, "julia-plot-2.png")
