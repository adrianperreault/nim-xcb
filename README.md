# nim-xcb
Nim bindings for https://xcb.freedesktop.org/

Note: These bindings are in WIP state. 
There are two main files `xcb.nim` and `xcb_BLOB.nim`. `xcb_BLOB.nim` contains 68k+ lines of unsorted, un-importable, raw c2nim-generated bindings. 
`xcb.nim` contains a small fraction of the bindings that the author needed to bootstrap a Vulkan window surface. If what you need isn't in `xcb.nim`, it's probably in `xcb_BLOB.nim`. Feel free to copy/paste what you need into `xcb.nim` and send a pull request. :)


