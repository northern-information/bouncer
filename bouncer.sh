#!/bin/sh

function div() {
  echo "================================================================================"
}

div

cat <<"EOT"
                              __                __                           
            ..'''' | |````.  |        |``````, |              .'.       |        
         .''       | |     | |____    |'''|''  |____        .''```.     |        
      ..'          | |     | |        |    `.  |          .'       `.   |        
....''             | |....'  |_______ |      `.|_______ .'           `. |_______ 
                                                                                              
,           ,____,    ,____      ,____    ``.           .''                                            
|         .~      ~.  |    ~.    |    ~.    ``..     ..''                                     
|        |          | |____.'_   |____.'_       ``.''                                         
|        |          | |       ~. |       ~.      '|'                                          
|_______  `.______.'  |_______.' |_______.'       |                                           
EOT

function says() {
  printf "\nBOUNCER: $1\n\n"
}

if [ $# -eq 0 ]; then
    says "Welcome to the Lobby, please identify yourself with an \"r\" or \"t\" argument."
    exit 1
fi

case $1 in
  r)
    authorized=1
    user="Mister Sparkle"
    octapath="/media/octatrack/BELLHOP"
    lobbypath="/home/license/Dropbox/sidereal-lobby/bouncer"
    ;;
  t)
    authorized=1
    user="Professor Etters"
    octapath="/Volumes/OCTATRACK/BELLHOP"
    lobbypath="/Users/mbp/Dropbox/People/sidereal/bouncer"
    ;;
  *)
    authorized=0
    user="Guest"
    octapath=""
    ;;
esac

if [ $authorized = 1 ]; then
  says "Welcome to the Lobby, $user."
  div
else
  says "I regret to inform you the Lobby is not accepting new members at this time."
  exit 0
fi

if [ -d  "$octapath" ]; then
  says "I see your Octatrack is blessing up! Let's run df -h $octapath:"
  df -h $octapath
  div
else
  says "Your Octatrack is expected in room $octapath but sadly it cannot be accessed right now. Is it on and in USB mode?" 
  exit 1
fi

if [ -d  "$lobbypath" ]; then
  says "Let's also du -hs $lobbypath:"
  du -hs $lobbypath
  div
else
  says "The shared lobby is expected at $lobbypath but sadly it cannot be accessed right now." 
  exit 1
fi

says "Do you wish to proceed with rsync? y/n"

read a

case $a in
  "y")
    rsync -zarv --checksum --include="*/" --include="*.wav" --exclude="*" /$octapath/* /$lobbypath
    rsync -zarv --checksum --include="*/" --include="*.wav" --exclude="*" /$lobbypath/* /$octapath
    says "Enjoy your stay at Sidereal Lobby, $user."
    exit 1
    ;;
  *)
    says "Farewell."
    exit 0
    ;;
esac
