These are some additional [Raylib.nelua](https://github.com/Andre-LA/raylib-nelua) examples, currently Linux-only.

Some points of interest:
- .neluacfg.lua, which provides the very simple build system
- lib/sunvox.nelua, which demonstrates a way to use [nelua-batteries](https://github.com/edubart/nelua-batteries)'s ffi.lua for a short list of explicit imports, without too much repetition.
- lib/asteroids.sunvox , a [SunVox](https://warmplace.ru/soft/sunvox/) project. Musically it's nothing, just a short loop for BGM, with a spare drum machine for the sound effects. But if you're unaware of SunVox you should check it out.

The examples:
- 001-hw: a bare 'hello world' raylib window with text
- 002-asteroids: the game of Asteroids, mostly faithfully transliterated from an [Odin version](https://github.com/jrfondren/odin-examples), which was translitered from something else. With [SunVox](https://warmplace.ru/soft/sunvox/sunvox_lib.php) for audio.
- 003-asteroids: that same game again, using a little bit more of Nelua's capabilities.

## building

```bash
nelua deps     # see below
nelua all      # build all examples

nelua run 1    # run 001-hw/hw.nelua
nelua make 3   # build 003-asteroids/asteroids

# 1. build with tcc
# 2. add your own path
# 3. while making empty dirs so that the existing -L directive is satisfied
mkdir nelua-batteries Raylib.nelua
nelua run 1 --cc=tcc -L/opt/nelua-batteries -L/opt/Raylib.nelua
```

Run in the project directory, using .neluacfg.lua, `nelua deps` runs the following commands:

```bash
git clone https://github.com/AuzFox/Raylib.nelua.git
git clone https://github.com/edubart/nelua-batteries
wget https://warmplace.ru/soft/sunvox/sunvox_lib-2.1.1.zip
unzip sunvox_lib-2.1.1.zip
```

You can grab sunvox\_lib yourself and make symlinks instead of cloning those repos. If you add you

## building without audio

Edit -Paudio out of .neluacfg.lua's commands.
