# bouncer

## Thee Mighty Dumpster Fire (testing Discord integration)

## Structure

 - `sidereal` (dropbox top level shared can be named whatever you want)
   - `bouncer/` (the shared OT audio - this directory maps to `OCTATRACK/LOBBY`)
     - `bouncer.sh` (sync script)
     - `readme.md` (this file)
     - `AUDIO/` (audio files synced via bouncer.sh)
       - `chains` (profit)
       - `fodder` (grab bag)
       - `stems` (stems designed to work together)
         - `group-b`
         - `group-b`
         - `group-c`
         - `...`

## Purpose

As a member of Sidereal Lobby, I need to sync Octatracks .wavs with my bandmate.

 1. I expect to run a shell script that does all the syncing for me.
 2. I expect the shell script to use `rsync`.
 3. I expect my Octatrack to be plugged in and in USB mode.
 4. I expect each Octatrack to have a top level directory called `LOBBY`.
 5. I expect there to be a single directory in Dropbox called `bouncer`.
 6. I expect the shell script and all Octatrack blessed files to reside in the same directory on Dropbox.
 7. I expect to be able to tell the shell script who I am so it knows my Octatrack's path.
 8. I expect this to work in concert with [bellhop](https://github.com/northern-information/bellhop).
 9. I expect bouncer to only transfer `.wav` files and directories. No `.ot` files!
