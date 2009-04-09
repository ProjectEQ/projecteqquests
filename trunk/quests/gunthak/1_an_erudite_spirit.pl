#zone: gunthak NPC:1_an_erudite_spirit (224238)
#Angelox
#note; I did this quest as per the original, "Titanium" version

sub EVENT_ITEM{
  if (plugin::check_handin(\%itemcount,59030 => 1)){
    quest::emote("is surrounded by a warm glow as the ring touches her ethereal form. Her lips curl into a smile as she begins to fade away into the mist. You hear something fall to the ground. You notice a wet scroll half buried in the sand. You reach down and pick it up");
    quest::summonitem(59011);
    quest::delglobal("Alina");
    quest::setglobal("Alina",2,3,"F");
    $qglobals{Alina}=undef;
    quest::depop();
 }
}

sub EVENT_DEATH{
 quest::delglobal("Alina");
 quest::setglobal("Alina",2,3,"F");
 $qglobals{Alina}=undef;
  };