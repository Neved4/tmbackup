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
- 📦 **Self-contained** - no dependencies, lighweight, uses POSIX `awk`,
  `sh` (`3686 bytes`, `188 lines`).

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

### Supported macOS Versions

| Version                 | Supported |
| :---------------------- | :-------- |
| **`macOS 14 Sonoma`**   | Yes ✅     |
| **`macOS 13 Ventura`**  | Yes ✅     |
| **`macOS 12 Monterey`** | Yes ✅     |
| **`macOS 11 Big Sur`**  | Yes ✅     |

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

Thanks to [@risc] and [@goldbuick] for testing and feedback.

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
[@risc]: https://github.com/0risc

[matteocorti/tmstatus.sh]: https://github.com/matteocorti/tmstatus.sh
[torstenvl/tmutils]: https://github.com/torstenvl/tmutils
[emrekaankocoglu/disposable-timemachine-docker]: https://github.com/emrekaankocoglu/disposable-timemachine-docker
[raphaelcohn/os-x-backup]: https://github.com/raphaelcohn/os-x-backup
[Delvien/Timemachine-mount-usb-backup-then-dismount]: https://github.com/Delvien/Timemachine-mount-usb-backup-then-dismount
[tjluoma/texbar-timemachine]: https://github.com/tjluoma/textbar-timemachine
[fedekrum/Mac-Time-Machine-status]: https://github.com/fedekrum/Mac-Time-Machine-status/tree/main
[tomtaylor/fix_timemachine]: https://github.com/tomtaylor/fix_timemachine
