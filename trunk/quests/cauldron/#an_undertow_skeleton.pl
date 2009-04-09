#Bilge Farfathom spawn
#npc - #an_undertow_skeleton (trigger for Bilge)
#zone - Dagnors Cauldron

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 #these are not PEQ ids:
 my $a=70059; #Bilge
 my $b=70060; #npc - an_aqua_goblin_mariner
 if($random_result<90){
  quest::spawn2($b,6,0,-974.5,436.4,-343.8,29);
  #quest::say("spawn mariner");
  }else{
    #quest::say("Spawning Bilge Farfathom");
    quest::spawn2($a,4,0,-1123.30,-1194.57,-98.32,122);
  };
 };
