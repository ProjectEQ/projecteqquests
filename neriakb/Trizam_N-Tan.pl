# items: 13885, 13021
sub EVENT_SAY {
  if($text=~/hail/i){  
    quest::say("And who do you think you are? To step into the Cauldron of Hate one should have the black soul of a warrior. For one to speak with Trizam he should have good reason. Perhaps you return with tales of [deathfist] agendas. If so, then you're a year too late.");
  }
  if($text=~/deathfist/i){
    # Orc Pawn Picks
    quest::say("Have you been spending day and night at the Malden's Fancy?!! The Deathfist Orcs in the Commonlands are up to something. As the inept humans in Freeport hunt down the warrior orcs, the pawns run about on some secret mission. I have been appointed by King Nathox to attend to this matter and hire young warriors who wish to [collect] pawn kills.");
  }
  if($text=~/collect/i){
    # Orc Pawn Picks
    quest::say("Yes, You will. You need not know the reason why. I command you by order of King Naythox Thex to venture forth to the Commonlands and slay all the orc pawns you see. Return with four pawn picks and maybe I shall even reward you. Leave at once or you shall find yourself hanging from the Hooks of Innoruuk!");
  }
}

sub EVENT_ITEM {
  # Handin: Orc Pawn Pick
  if(plugin::check_handin(\%itemcount, 13885 => 4)){
    # Orc Pawn Picks [END]
    quest::say("As instructed, I shaw reward your good deed. But I choose to reward you with provisions from the pantries of Neriak. They shall keep you strong.");
    quest::faction(270,5);   # +Indigo Brotherhood
    quest::faction(326,-5);   # -Emerald Warriors
    quest::faction(311,-5);  # -Steel Warriors
    quest::exp(25);
    quest::ding();
    # Summon: Neriak Nectar 
    quest::summonitem(13021, 2); # Item: Neriak Nectar
  }
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
   plugin::return_items(\%itemcount);
}


#EOF
