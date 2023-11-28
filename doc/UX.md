### Status codes

|      Status | Meaning                                             |
| ----------: | :-------------------------------------------------- |
|   `green` 🟢 | _Backup finished successfully._                     |
|     `red` 🔴 | _Backup was interrupted or drive was disconnected._ |
|  `yellow` 🟡 | _Warning demanding user attention._                 |
|    `blue` 🔵 | _Ongoing backup or general information._            |
| `magenta` 🟣 | _Miscellaneous information._                        |
|    `gray` ⚪️ | _Backup drive or destination not available._        |

### UX & Implementation

> [!TIP]
> _`tmbackup` performs a local snapshot every time it's called. This has the potential of creating many local snapshots, that `tmbackup` automatically attempts to trim without removing them. If you know what you're doing, and want to remove the extra snapshots, you could schedule something like `rmlsnaps()` below._

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
Complete: 4F4B520B-C151-485D-8CD9-6EB53E8FAAE4 (Backup 1)
          Total copied: 69.34 MB (72704000 bytes)
             Avg speed: 74.97 MB/min (1310283 bytes/sec)
 Offline: CF9A4D94-2A57-40A1-B843-A8DA64A5858D (Backup 2)
 Stopped: F49B059C-5944-49C9-A96D-53DCDF07EFC6 (Backup 3)
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
