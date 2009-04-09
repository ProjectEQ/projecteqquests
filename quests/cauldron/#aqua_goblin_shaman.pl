#Bilge Farfathom spawn
#npc - #aqua_goblin_shaman (trigger for #Bilge_Farfathom 70059)
#zone - Dagnors Cauldron

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 #these are not PEQ IDs
 my $a=70059; #Bilge
 my $b=70063; #npc - #a_cauldron_rat
 my $c=70069; #The_Fabled_Bilge_Farfathom
 if($random_result<85){
  quest::spawn2($b,6,0,-974.5,436.4,-343.8,29);
  #quest::say("spawn rat");
 }elsif($random_result<95){
  quest::spawn2($c,6,0,-974.5,436.4,-343.8,29);
  #quest::say("spawn Fabled");
  }else{
    #quest::say("Spawning Bilge Farfathom");
    quest::spawn2($a,4,0,-1123.30,-1194.57,-98.32,122);
  };
 };
