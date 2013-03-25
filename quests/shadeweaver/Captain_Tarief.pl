# Saurek Scales
my $count = 0;

sub EVENT_SPAWN {
  quest::settimer("tarief",180);
}

sub EVENT_TIMER {
  $count++;
  if ($count == 1) {
    quest::say("It is important for us to hunt well and provide food to our brethren. Use stealth to surprise your opponent and attack them from behind. This is a vital tactic for the Taruun.");
  }
  if ($count == 2) {
    quest::say("Taking a spit with you into battle allows you to cook the meat you find in the field. This will help sustain your companions as well as yourself.");
  }
  if ($count == 3) {
    quest::say("Remember to try to maneuver behind your opponent, attack with wisdom and cunning.");
  }
  if ($count == 4) {
    quest::say("We must clear out the hoppers that attack us. These beasts can become very dangerous if they are left to breed. We have already lost many of our brethren to the larger ones.");
  }
  if ($count == 5) {
    quest::say("It is important for us to stay light and nimble on our feet. Do not overburden yourself with equipment you have no need for.");
  }
  if ($count == 6) {
    quest::say("Avoid heavier armor, let the Khala Dun take the brunt of the blows while you maneuver behind the enemy. If they focus their attacks on you, it is wise to retreat until your companions are able to distract them from you.");
  }
  if ($count == 7) {
    quest::say("Remember your honor. Do not lay claim to a kill that does not belong to you. Both victory and spoils belong to the one who has initiated the battle.");
  }
  if ($count == 8) {
    quest::say("Pay close attention to your surroundings. When you are in danger, it is best to know the quickest way back to safety.");
     $count = 0;
    quest::settimer("tarief",180);
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Well met, have you [come to aid] us in hunting the hoppers of the thicket?");
  }
  if ($text=~/come to aid/i) {
    quest::say("If you are preparing to hunt, then there are a few things you should know. Some of the hoppers have unique abilities. Knowledge of these abilities can mean the difference between life and death. I will tell you a little bit about them if you [wish to listen].");
  }
  if ($text=~/wish to listen/i) {
    quest::say("A wise choice, it is good to learn all that you can of the prey before initiating the hunt. Such a tactic is vital when you set out for larger game. Learn of your prey's strengths and weaknesses and you shall have the upper hand. Saureks may all seem similar to one another at first glance, but this is not the case. Such a mistake has left many Taruun dead. I have learned that the darkclaw saureks have venom dripping from their claws. There are a few other [unique qualities] to the saureks as well.");
  }
  if ($text=~/unique qualities/i) {
    quest::say("Each of the saureks have their own unique set of scales. I am able to tell which saurek my trainees have managed to hunt successfully by the scale they return to me. Feel free to join in our lesson or the hunt. I hope that you will benefit from my advice. Hunt well, $name.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30861 => 4)) { #Saurek Hopper Scales
    quest::say("Excellent work, $name. Please take this as a reward."); #generic text
    quest::summonitem(30870); #Hunting Leather Boots
    quest::faction(132,10); #Guardians of Shar Vahl
    quest::exp(2500);
  }
  elsif (plugin::check_handin(\%itemcount, 30862 => 4)) { #Saurek Darkclaw Scales
    quest::say("Excellent work, $name. Please take this as a reward."); #generic text
    quest::summonitem(30867); #Hunting Leather Bracer
    quest::faction(132,10); #Guardians of Shar Vahl
    quest::exp(2500);
  }
  elsif (plugin::check_handin(\%itemcount, 30863 => 4)) { #Saurek Shredder Scales
    quest::say("Excellent work, $name. Please take this as a reward."); #generic text
    quest::summonitem(30866); #Hunting Leather Sleeves
    quest::faction(132,10); #Guardians of Shar Vahl
    quest::exp(2500);
  }
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
}
#EOF zone: shadeweaver ID: 165153 NPC: Captain_Tarief