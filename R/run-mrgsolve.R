### settings
model_path <- './dist/mrgsolve/nameless.cpp'
fig_path <- './dist/mrg.png'
library(mrgsolve)
library(lattice)

### main code
message('Reading model... ', appendLF = FALSE)
model <- mrgsolve::mread(model = 'default', file = model_path)
message('OK')

message('Run simulations (end = 120)... ', appendLF = FALSE)
sim <- model %>%
  mrgsim(
    delta = 1,
    hmax = 0,
    maxsteps = 1e9,
    atol = 1e-7,
    rtol = 1e-4,
    end = 120
  )
message('OK')

message('Plot results and save to file ${fig_path}... ', appendLF = FALSE)
plot <- sim %>%
  plot(A + B + r1 + comp1 ~ time, type='l')

lattice::trellis.device(device = png, file =  fig_path)
print(plot)
dev.off()

message('OK')
