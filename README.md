# Learn-pharo
Let's learn a descendant of Smalltalk.


# A performance comparison

N=1_000_000_000

| program         |exec. time (sec)|
|-----------------|---------------:|
| `PiFinderFloat` |           1.60 |
| `PiFinderFloat2`|           1.17 |
| `PiFinder`      |  aborted   |
| Python3.10      |          168.67 |
| Scratch(turbo mode) | 227.26 (N=100_000_000)|
