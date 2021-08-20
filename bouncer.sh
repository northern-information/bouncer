#!/bin/sh

function div() {
  echo "================================================================================================"
}

div

cat <<"EOT"
                                ____                     ____                                 
            ..'''' | |``````.  |            |`````````, |                  .'.       |        
         .''       | |       | |______      |'''|'''''  |______          .''```.     |        
      ..'          | |       | |            |    `.     |              .'       `.   |        
....''             | |......'  |___________ |      `.   |___________ .'           `. |_______ 
                                                                                              
            ______     ____       ____                                                        
|         .~      ~.  |    ~.    |    ~.    ``..     ..''                                     
|        |          | |____.'_   |____.'_       ``.''                                         
|        |          | |       ~. |       ~.       |                                           
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
    user="Professor Laws"
    octapath="/enter/your/path/here/ryan"
    lobbypath="/enter/your/path/here/ryan"
    ;;
  t)
    authorized=1
    user="Professor Etters"
    octapath="/Volumes/OCTATRACK/LOBBY"
    lobbypath="/Users/mbp/Dropbox/People/sidereal/lobby"
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
  says "And diff $octapath $lobbypath:"
  diff $octapath $lobbypath
  div
else
  says "The shared lobby is expected at $lobbypath but sadly it cannot be accessed right now." 
  exit 1
fi

says "Do you wish to proceed with rsync? 1 = yes, * = no."

read a

case $a in
  1)
    rsync -rtuv --checksum /$octapath/* /$lobbypath
    rsync -rtuv --checksum /$lobbypath/* /$octapath
    says "Enjoy your stay at Sidereal Lobby, $user."
    exit 1
    ;;
  *)
    says "Farewell."
    exit 0
    ;;
esac