# Learn-pharo
Let's learn [Pharo](https://github.com/pharo-project/pharo), a descendant of Smalltalk.

- https://github.com/pharo-graphics/Bloc
- https://github.com/pharo-spec
- https://thepharo.dev/2021/10/08/dynamic-layouts-with-spec2/
- https://github.com/ObjectProfile/Roassal3Documentation

# A performance comparison

### 100_000_000 terms (50_000_000 positive/negative pairs)

| program         |exec. time (sec)|
|-----------------|---------------:|
| `PiFinderFloat` |           1.72 |
| `PiFinderFloat2`|           1.14 |
| `PiFinderFloat3`|           1.28 |
|  - on Cuis      |           2.98 |
| `PiFinder`      |        give up |
| Python3.10      |          16.00 |
| GDscript(4.0) typed |       8.21 |
| GDscript(4.0 no type hints | 15.56 |
| Scratch(turbo mode) |     227.26 |
| [pi3.bqn](https://github.com/shnarazk/learn-bqn/blob/main/pi-benchmark/pi3.bqn) (CBQN) |   1.48 |
| [pi4.bqn](https://github.com/shnarazk/learn-bqn/blob/main/pi-benchmark/pi4.bqn) (CBQN) |   3.05 |
| [pi5.bqn](https://github.com/shnarazk/learn-bqn/blob/main/pi-benchmark/pi5.bqn) (CBQN) |   2.96 |
| [pi10.bqn](https://github.com/shnarazk/learn-bqn/blob/main/pi-benchmark/pi10.bqn) (CBQN)|  0.11 |
|  pi-rust(float) |           0.09 |

### 1_000_000_000 terms

| program         |exec. time (sec)|
|-----------------|---------------:|
| `PiFinderFloat` |          17.26 |
| `PiFinderFloat2`|          11.55 |
| `PiFinderFloat3`|          12.09 |
| - on Cuis       |          29.33 |
| `PiFinder`      |      crashed   |
| Python3.10      |         168.67 |
| GDscript(4.0) typed |    crashed |
| Scratch(turbo mode) | don't know |
| pi3.bqn (CBQN)  |  out of memory |
| [pi4.bqn](https://github.com/shnarazk/learn-bqn/blob/main/pi-benchmark/pi4.bqn) (CBQN) |  31.13  |
| [pi5.bqn](https://github.com/shnarazk/learn-bqn/blob/main/pi-benchmark/pi5.bqn) (CBQN) |  29.57  |
| [pi10.bqn](https://github.com/shnarazk/learn-bqn/blob/main/pi-benchmark/pi10.bqn) (CBQN)|  1.04  |
|  pi-rust(float) |           0.62 |
| Swift 5.9      |           1.08  |

------
## Scratch

![](https://user-images.githubusercontent.com/997855/227437677-6d08cb28-ac92-49fd-8347-900d551b84cb.png)

## [GDscript](https://godotengine.org)

![](https://user-images.githubusercontent.com/997855/233822033-291e8ae7-2be0-442b-b7ff-7150911284a3.png)
