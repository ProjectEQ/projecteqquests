sub EVENT_SPAWN {
   $miner628 = 0;

   my $random_result = int(rand(100));
   
   if ($random_result <= 5) {
      $miner628 = 1;
   }
}

sub EVENT_SAY {
   if (($text=~/628/i) && ($miner628)) {
      quest::emote(".wizz.click.628.");
   }
}

sub EVENT_ITEM {
   if (($miner628) && (plugin::check_handin(\%itemcount, 12164 => 1))) { # Scrubber Key
      quest::emote(".wizz.click.628.");
      quest::faction(45, -10); # Clockwork Gnome
      quest::exp(500);
      quest::summonitem(quest::ChooseRandom(12162,12167)); # Gnome Take (Good or Bad)
   }
   
   plugin::return_items(\%itemcount);
}