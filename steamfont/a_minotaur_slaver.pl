#NPC: a_minotaur_slaver   Zone: steamfont
#
#Emotes & Chance to trigger Minotaur Hero spawn on death
#
#by Qadar

sub EVENT_DEATH_COMPLETE{
  my $random_result = int(rand(100));
  if($random_result >= 94){
    quest::unique_spawn(56152,177,0,-1294,1360,-103);
  }
  quest::say("I die soon! Meldrath, help me!");
}
