#Quillmane spawn
#npc - #Quillmane
#zone - SouthKarana
#Angelox

sub EVENT_DEATH{
 #quest::say("I'm dead");
 quest::delglobal("quill");
 quest::setglobal("quill",2,3,"F");
 $quill=undef;
  };