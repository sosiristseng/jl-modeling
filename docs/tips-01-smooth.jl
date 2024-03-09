#===
# Differentiable switching

## Smmoth Heaviside step function

A [Heaviside step function](https://en.wikipedia.org/wiki/Heaviside_step_function) (0 when x < a, 1 when x > a) could be approximated with a steep [logistic function](https://en.wikipedia.org/wiki/Logistic_function).
===#
using LogExpFunctions
smoothheaviside(x, k=100) = logistic(x * k)

# The function output switches from zero to one around `x=0`.
using Plots
using DisplayAs: PNG

plot(smoothheaviside, -1, 1) |> PNG

# ## Smooth single pulse
# A single pulse could be approximated with a product of two logistic functions.

singlepulse(x, t0=0, t1=0.1, k=1000) = smoothheaviside(x - t0, k) * smoothheaviside(t1 - x, k)

plot(singlepulse, -1, 1) |> PNG

# ## Smooth minimal function
function smoothmin(x, k=100)
    y = x * k
    return -log1pexp(-y)/k
end

plot(smoothmin, -10, 10, label="Smooth min") |> PNG

# ## Periodic pulses
# From: https://www.noamross.net/2015/11/12/a-smooth-differentiable-pulse-function/

function smoothpulses(t, tstart, tend, period=1, amplitude=period / (tend - tstart), steepness=1000)
    @assert tstart < tend < period
    xi = 3 / 4 - (tend - tstart) / (2 * period)
    p = inv(1 + exp(steepness * (sinpi(2 * ((t - tstart) / period + xi)) - sinpi(2 * xi))))
    return amplitude * p
end

plot(t->smoothpulses(t, 0.2, 0.3, 0.5), 0.0, 2.0, lab="pulses") |> PNG
