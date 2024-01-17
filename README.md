![Shell Script](https://img.shields.io/badge/Shell_Script-9DDE66?logo=gnubash&logoColor=000&style=for-the-badge)
![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=fff)

## `tmbackup` - Seamless Time Machine backups! 🚀

Fast, light [macOS] utility that performs [Time Machine] backups on all
connected drives.

![](graphics/tmbackup.gif)

###### Generated using [`agg`], [`asciinema`], `Menlo` typeface, theme `Github Dark`.

### Highlights

- 🚀 _**Fast**_ - minimal overhead, [tmbackup.awk](src/tmbackup.awk)
  executes in only ~ `15 ms`.
- 🎨 _**Intuitive**_ - user-friendly, clear color-coded
  messages for every backup status.
- 🔒 _**Robust**_ - ensures reliability with effective error handling
  during the backup.
- 📦 _**Self-contained**_ - no dependencies, lightweight, uses POSIX `awk`,
  `sh` (`3692 bytes`, `189 lines`).

## Getting Started

> [!NOTE]
> _This utility is only intended to work in macOS._

### Installation

```sh
git clone https://github.com/Neved4/tmbackup
```

### Usage

```console
$ ./tmbackup.sh
```

### Compatibility

#### Supported macOS Versions

| Version                 | Supported |
| :---------------------- | :-------- |
| **`macOS 14 Sonoma`**   | Yes ✅     |
| **`macOS 13 Ventura`**  | Yes ✅     |
| **`macOS 12 Monterey`** | Yes ✅     |
| **`macOS 11 Big Sur`**  | Yes ✅     |

<details closed>
  <summary><b>Supported Awk and UNIX shells</b></summary>

`tmbackup` is built for [macOS] using `/bin/sh` and `/usr/bin/awk`, but it
adheres to standards when possible and is made to play nice with other Awk
and POSIX sh versions too.

This allows to execute `tmbackup` with different shells:
```sh
dash /path/to/tmbackup.sh
```

Or to build your own parsing with different Awk implementations:
```sh
tmutil destinationinfo | mawk -f /path/to/tmbackup.awk
```

#### Supported Awk implementations

|     Shell | Version          | Supported |
| --------: | :--------------- | :-------- |
|   [`awk`] | `20230909`       | ✅ Yes     |
|  [`gawk`] | `5.3.0`          | ✅ Yes     |
| [`goawk`] | `1.25.0`         | ✅ Yes     |
|  [`mawk`] | `1.3.4-20231126` | ✅ Yes     |

#### Supported shells

|     Shell | Version       | Supported |
| --------: | :------------ | :-------- |
|  [`bash`] | `5.2.15`      | ✅ Yes     |
|  [`dash`] | `0.5.12`      | ✅ Yes     |
| [`ksh93`] | `93u+m/1.0.7` | ✅ Yes     |
|  [`mksh`] | `59c`         | ✅ Yes     |
|  [`oksh`] | `7.3`         | ✅ Yes     |
|   [`osh`] | `0.18.0`      | ✅ Yes     |
|  [`posh`] | `0.14.1`      | ❌ No      |
|  [`yash`] | `2.55`        | ✅ Yes     |
|   [`zsh`] | `5.9`         | ✅ Yes      |

</details>

### UX & Implementation

More information on this topic: [UX.md](doc/UX.md).

> [!NOTE]
> _If you have any cool ideas or suggestions to improve things, let me
> know!_

### Limitations

> [!IMPORTANT]
> _`tmbackup` does not differentiate between backups interrupted by a
> hardware failure and a user manually skipping._

## Acknowledgments

Thanks to [@0risc] and [@goldbuick] for testing and feedback.

## License

`tmbackup` is licensed under the terms of the [MIT License].
   
See the [LICENSE](LICENSE) file for details.

## Related Projects

- [matteocorti/tmstatus.sh] - general overview and stats
- [torstenvl/tmutils] - history, marking and deduplication
- [emrekaankocoglu/disposable-timemachine-docker] - disposable container
  backups
- [raphaelcohn/os-x-backup] - encrypted backups to cloud storage
- [Delvien/Timemachine-mount-usb-backup-then-dismount] - mount drive,
  backup, dismount
- [tjluoma/texbar-timemachine] - monitor Time Machine status
- [fedekrum/Mac-Time-Machine-status] - get info on what Time Machine is
  doing
- [tomtaylor/fix_timemachine] - fix broken Time Machine NAS backups

[`agg`]: https://github.com/asciinema/agg
[`asciinema`]: https://github.com/asciinema/asciinema
[macOS]: https://www.apple.com/macos/
[MIT License]: https://opensource.org/license/mit/
[Time Machine]: https://support.apple.com/en-gb/guide/mac-help/mh35860/14.0/mac/14.0
[@goldbuick]: https://github.com/goldbuick
[@0risc]: https://github.com/0risc

[`awk`]: https://www.cs.princeton.edu/~bwk/btl.mirror/
[`gawk`]: https://www.gnu.org/software/gawk/
[`goawk`]: https://benhoyt.com/writings/goawk/
[`mawk`]: https://invisible-island.net/mawk/

[`bash`]: https://git.savannah.gnu.org/cgit/bash.git/
[`dash`]: https://git.kernel.org/pub/scm/utils/dash/dash.git
[`ksh93`]: https://github.com/ksh93/ksh
[`mksh`]: https://github.com/MirBSD/mksh
[`osh`]: https://www.oilshell.org/cross-ref.html?tag=OSH#OSH
[`oksh`]: https://github.com/ibara/oksh
[`posh`]: https://salsa.debian.org/clint/posh
[`yash`]: https://github.com/magicant/yash
[`zsh`]: https://github.com/zsh-users/zsh

[matteocorti/tmstatus.sh]: https://github.com/matteocorti/tmstatus.sh
[torstenvl/tmutils]: https://github.com/torstenvl/tmutils
[emrekaankocoglu/disposable-timemachine-docker]: https://github.com/emrekaankocoglu/disposable-timemachine-docker
[raphaelcohn/os-x-backup]: https://github.com/raphaelcohn/os-x-backup
[Delvien/Timemachine-mount-usb-backup-then-dismount]: https://github.com/Delvien/Timemachine-mount-usb-backup-then-dismount
[tjluoma/texbar-timemachine]: https://github.com/tjluoma/textbar-timemachine
[fedekrum/Mac-Time-Machine-status]: https://github.com/fedekrum/Mac-Time-Machine-status/tree/main
[tomtaylor/fix_timemachine]: https://github.com/tomtaylor/fix_timemachine
