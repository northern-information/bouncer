# bouncer

As a member of Sidereal Lobby, I need to sync Octatracks with my bandmate.

 1. I expect to run a shell script that does all the syncing for me.
 2. I expect the shell script to use `rsync`.
 3. I expect my Octatrack to be plugged in and in USB mode.
 4. I expect each Octatrack to have a top level directory called `lobby`.
 5. I expect there to be a single directory in Dropbox called `lobby`.
 6. I expect the shell script and all Octatrack blessed files to reside in the same directory on Dropbox.
 7. I expect to be able to tell the shell script who I am so it knows my Octatrack's path.

# The Architecture of Sidereral Lobby

```
| sidereal              -- dropbox top level shared can be named whatever you want
  \  
  | -- bouncer.sh       -- sync script
  |
  | -- readme.md        -- this file
  |
  | -- lobby/           -- the shared OT project directory
  |     \ audio/        -- audio files synced via bouncer.sh
  |     | *             -- project files synced via bouncer.sh
  |
  | --- ryan/           -- .gitignored
  |     \ *.*           -- fodder
  |
  | --- tyler/          -- .gitignored
  |     \ ableton/      -- main ableton files for stems and sketches
  |     | compost/      -- whatever samples and garbage i make and want to share
  |     | sketches/     -- typically bounced ableton projects for reference
  |     | stems/        -- ready for octatrack or daw importing
  |     
  | --- images/         -- .gitignored
  |      \ *.jpg
  |      | *.png
  |      | *.psd
  |      | *.mp4
  |      | (etc)
  |
  | --- releases/       -- .gitignored
        \ 0000 0000     -- (spontaneous noise album)
        | 0000 0001     -- (current)
        | 0000 0010     -- (dub techno)
```