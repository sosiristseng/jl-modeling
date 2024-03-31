#===
# Differentiable smooth functions

Sometimes smooth and differentiable functions are preferred to swtiching functions for differential equation solvers.

## Smmoth Heaviside step function

A [Heaviside step function](https://en.wikipedia.org/wiki/Heaviside_step_function) (0 when x < a, 1 when x > a) could be approximated with a steep [logistic function](https://en.wikipedia.org/wiki/Logistic_function).
===#
smoothheaviside(x, k=100) = 1 / (1 + exp(-k * x))

# The function output switches from zero to one around `x=0`.
using Plots
using DisplayAs: PNG

plot(smoothheaviside, -1, 1) |> PNG

# ## Smooth single pulse
# A single pulse could be approximated with a product of two logistic functions.

singlepulse(x, t0=0, t1=0.1, k=1000) = smoothheaviside(x - t0, k) * smoothheaviside(t1 - x, k)

plot(singlepulse, -1, 1) |> PNG

# ## Smooth absolute value
# Inspired by: https://discourse.julialang.org/t/smooth-approximation-to-max-0-x/109383/13
# Approximatly `abs(x)`
function smooth_abs(x; c=1e-3)
    hypot(x, c) - c
end

plot(smooth_abs, -10, 10, label="Smooth abs") |> PNG

# ## Smooth max function
# Approximatly `max(0, x)`
function smooth_max(x; c=1e-3)
    0.5 * (x + smooth_abs(x;c))
end

plot(smooth_max, -10, 10, label="Smooth max") |> PNG

# ## Smooth minimal function
# Approximatly `min(0, x)`
function smooth_min(x; c=1e-3)
    0.5 * (smooth_abs(x;c) - x)
end

plot(smooth_min, -10, 10, label="Smooth min") |> PNG

# ## Periodic pulses
# From: https://www.noamross.net/2015/11/12/a-smooth-differentiable-pulse-function/

function smoothpulses(t, tstart, tend, period=1, amplitude=period / (tend - tstart), steepness=1000)
    @assert tstart < tend < period
    xi = 3 / 4 - (tend - tstart) / (2 * period)
    p = inv(1 + exp(steepness * (sinpi(2 * ((t - tstart) / period + xi)) - sinpi(2 * xi))))
    return amplitude * p
end

plot(t->smoothpulses(t, 0.2, 0.3, 0.5), 0.0, 2.0, lab="pulses") |> PNG
