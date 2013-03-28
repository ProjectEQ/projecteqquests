#BeginFile: Trantor_Everhot.pl
#Quest for North Kaladim - Trantor Everhot: Tumpy Tonics

my $ItemCount; #Tumpy Tonic Counter

sub EVENT_SPAWN {
  $ItemCount = 0;
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Yes, yes!! I am a very busy man. I've got blueprints to work on, [dwarven wire] to perfect and formulae to calculate. In between those tasks, I have to find time to head down to Irontoe's and down a few Tumpy Tonics.");
  }
  if($text=~/dwarven wire/i) {
    quest::say("Oh!! Interested in my dwarven wire, are you? Many are. I have no problem letting you use a spool, but I have to warn you that I have not perfected the strength of it yet. I will make you a trade. A couple of [Tumpy Tonics] for a spool.");
  }
  if($text=~/tumpy tonics/i) {
    quest::say("Aaah!! I love Tumpy Tonics. They were created by Tumpy Irontoe. He was once a member of the famed Irontoe Brigade. Since they disbanded and left for parts unknown he decided to stay in Kaladim and open Irontoe's, the finest well in Faydwer.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12114 => 2)) { #Tumpy Tonic (Only 2)
    quest::say("Thank you, that hit the spot!! Here is the spool, as promised."); #Real text still needed
    quest::summonitem(12111); #Dwarven Wire
    quest::exp(1000);
    quest::faction(314,5); #Storm Guard
    quest::faction(169,5); #Kazon Stormhammer
    quest::faction(219,5); #Miners Guild 249
    quest::faction(215,5); #Merchants of Kaladim
    quest::faction(57,-5); #Craknek Warriors
    if($ItemCount == 1) {
      quest::say('Hey!! Only one?!!');
    }
  }
  elsif(plugin::check_handin(\%itemcount, 12114 => 1)) { #Tumpy Tonic (Only 1)
    if($ItemCount == 0) {
      quest::say('Hey!! Only one?!!');
      $ItemCount = 1;
    }
    else {
      quest::say("Thank you, that hit the spot!! Here is the spool, as promised."); #Real text still needed
      quest::summonitem(12111); #Dwarven Wire
      quest::exp(1000);
      quest::faction(314,5); #Storm Guard
      quest::faction(169,5); #Kazon Stormhammer
      quest::faction(219,5); #Miners Guild 249
      quest::faction(215,5); #Merchants of Kaladim
      quest::faction(57,-5); #Craknek Warriors
      $ItemCount = 0;
    }
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladimb ID:67033 -- Trantor_Everhot.pl