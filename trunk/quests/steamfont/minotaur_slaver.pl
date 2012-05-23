#NPC: a_minotaur_slaver   Zone: steamfont
#
#Emotes & Chance to trigger Minotaur Hero and Lord spawn on death
#
#by Qadar

sub EVENT_DEATH{
  my $random_result = int(rand(100));
  if($random_result >= 94){
    quest::unique_spawn(56152,177,0,-1294,1360,-103);
  }
  elsif($random_result >= 88 && $random_result < 94){
    quest::unique_spawn(56161,0,0,-2179,1319,-101.2);
  }
  quest::say("I die soon! Meldrath, help me!");
}
