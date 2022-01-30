# CommandLineOptions

A simple, easy to use method of parsing command line options.  It quickly parses
an array of strings from the command line into a key/value pair dictionary.

Any key with a -- or - prefix is parsed as a key.  If there is an embedded =
the key and value are split from that with the key being the left side and the
value being the right. Absent an = sign, the next entry in the string array is
the value.  If there is no value, the key is writte to the key value pair as
having a value of 'true'.

In order to add friendly name properties, simply create an extension that wraps
properties around the key names.  In the library, there is a HelpOptions and
LoginOptions extension already in place to handle --user, --password, --host,
--help and --verbose(-v) options.

```
import CommandLineOptions

let opts : Options = Options(args: CommandLine.arguments)

if (opts.verbose) {
    print("Verbose is enabled")
}
```
