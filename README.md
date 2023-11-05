![Shell Script](https://img.shields.io/badge/Shell_Script-9DDE66?logo=gnubash&logoColor=000&style=for-the-badge)
![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=fff)

# `tmbackup` - Backup all Time Machine drives! 🚀

Fast, light [macOS] utility that performs [Time Machine] backups on all
connected drives.

![](graphics/tmbackup.gif)

### Features

- _**Fast**_ 🚀 - minimal overhead, [tmbackup.awk](src/tmbackup.awk) executes in only ~ `15 ms`.
- _**Intuitive**_ 🎨 - seamless and user-friendly, with clear color-coded
  messages for every backup status.
- _**Robust**_ 🔒 - ensures reliability with effective error handling during
  the backup.

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

#### Status codes

|      Status | Meaning                                             |
| ----------: | :-------------------------------------------------- |
|   `green` 🟢 | _Ongoing action or finished successfully._          |
|     `red` 🔴 | _Action was interrupted or drive was disconnected._ |
|  `yellow` 🟡 | _Warning demanding user attention._                 |
|    `blue` 🔵 | _Backup status or general information._             |
| `magenta` 🟣 | _Miscellaneous information._                        |
|    `gray` ⚪️ | _Backup drive or destination not available._        |

### Supported macOS Versions

| Version               | Supported |
| :-------------------- | :-------- |
| **`macOS 14 Sonoma`**   | Yes       |
| **`macOS 13 Ventura`**  | Yes       |
| **`macOS 12 Monterey`** | Yes       |
| **`macOS 11 Big Sur`**  | Yes       |

### UX & Implementation

> [!NOTE]
> _If you have any cool ideas or suggestions to improve things, let me
> know!_

Simplifying the script into terse functions is possible, but `tmbackup`
prioritizes an intuitive and user-friendly approach. The goal is that at
any point in time, users have a clear picture of the state of their
backups.

Restructuring it into functions may lead to confusion. One notable
example is the default behavior of `tmutil startbackup`. See the output of
`tmback()` below:

```log
Total copied: 0.00 MB (0 bytes)
Avg speed:    0.00 MB/min (0 bytes/sec)
Total copied: 0.00 MB (0 bytes)
Avg speed:    0.00 MB/min (0 bytes/sec)
Total copied: 0.00 MB (0 bytes)
Avg speed:    0.00 MB/min (0 bytes/sec)
```

Compare it to `tmbackup`'s output instead:
```log
Complete 4F4B520B-C151-485D-8CD9-6EB53E8FAAE4 (Backup 1)
         Total copied: 69.34 MB (72704000 bytes)
            Avg speed: 74.97 MB/min (1310283 bytes/sec)
 Offline CF9A4D94-2A57-40A1-B843-A8DA64A5858D (Backup 2)
 Stopped F49B059C-5944-49C9-A96D-53DCDF07EFC6 (Backup 3)
```

When UX isn't a priority, you can create your own custom functions
and add them to your `.bashrc` or `.profile`:
```sh
tmback() {
    tmutil destinationinfo | awk '/^ID/ {print $NF}' |
    while read -r id
    do
        sudo tmutil startbackup -br -d "$id"
    done
}

getlsnaps() {
    tmutil listlocalsnapshotdates | grep "-"
}

rmlsnaps() {
    lsnaps="$(getlsnaps)"

    for i in $lsnaps
    do
        tmutil deletelocalsnapshots "$i"
    done
}

thinlsnaps() {
    calc=$(echo "5 * 10^9" | bc)

    tmutil thinlocalsnapshots / "$calc" 2
}
```

###### * These are provided as standalone scripts in [`utils/`](utils/).

### Limitations

> [!IMPORTANT]
> _`tmbackup` does not differentiate between backups interrupted by a
> hardware failure and an user manual skip._

## License

`tmbackup` is licensed under the terms of the [MIT License].
   
See the [LICENSE](LICENSE) file for details.

## Acknowledgments

Thanks to [@risc] and [@goldbuick] for testing and feedback.

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
