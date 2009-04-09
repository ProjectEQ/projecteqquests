#Quests covered in this file:
#Shaman Skull Quest 6

sub EVENT_SPAWN {
   quest::say("Stay out of this, Klok !! I didn't spend 30 seasons in the legion to be pestered by the likes of you!! Here I am, you little croak!! You want my skull? Come and get it!!");
   quest::signalwith(85140, 50); signal Klok_sargin to say something
   quest::settimer("attack",120);
}

sub EVENT_SIGNAL {
   quest::say("Ha!! Who dares to take what is Bruiser's!! I will make swamp mush out of them!!");
}

sub EVENT_TIMER {
   if($timer eq "attack"){
      quest::stoptimer("attack");
      quest::attack($name);
}
 }

sub EVENT_DEATH {
    quest::stoptimer("attack");
}