# Learn-pharo
Let's learn a descendant of Smalltalk.


# A performance comparison

N=100_000_000

| program         |exec. time (sec)|
|-----------------|---------------:|
| `PiFinderFloat` |            TBM |
| `PiFinderFloat2`|            TBM |
| `PiFinder`      |            TBM |
| Python3.10      |            TBM |
| Scratch(turbo mode) |     227.26 |
| pi3.bqn (CBQN) |           1.48 |

N=1_000_000_000

| program         |exec. time (sec)|
|-----------------|---------------:|
| `PiFinderFloat` |           1.60 |
| `PiFinderFloat2`|           1.17 |
| `PiFinder`      |      crashed   |
| Python3.10      |         168.67 |
| Scratch(turbo mode) | don't know |
| pi3.bqn (CBQN)  |  out of memory |
