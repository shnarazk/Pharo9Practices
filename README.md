# Learn-pharo
Let's learn a descendant of Smalltalk.


# A performance comparison

N=100_000_000

| program         |exec. time (sec)|
|-----------------|---------------:|
| `PiFinderFloat` |           1.72 |
| `PiFinderFloat2`|           1.16 |
| `PiFinder`      |        give up |
| Python3.10      |          16.00 |
| Scratch(turbo mode) |     227.26 |
| pi3.bqn (CBQN) |            1.48 |
|  pi-rust(float) |           0.09 |

N=1_000_000_000

| program         |exec. time (sec)|
|-----------------|---------------:|
| `PiFinderFloat` |          17.26 |
| `PiFinderFloat2`|          11.72 |
| `PiFinder`      |      crashed   |
| Python3.10      |         168.67 |
| Scratch(turbo mode) | don't know |
| pi3.bqn (CBQN)  |  out of memory |
|  pi-rust(float) |           0.62 |
