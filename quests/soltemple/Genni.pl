# Quests for Bard Lambent Stones

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("I am Genni of the temple of Solusek Ro. I serve as custodian of the [lambent stones].");
  }
  if($text=~/lambent stones/i) {
    quest::say("Lambent stones are receptacles of power. Alone they are not useful, but when combined with other gemstones they can be used for making magic items. I know of [star ruby] lambent, [ruby] lambent, [sapphire] lambent and [fire opal] lambent.");
  }
  if($text=~/ruby/i) {
    if($text=~/star/i) {
      quest::say("To make a star ruby lambent stone, you must give me two star rubies and a lambent stone. Lambent stones can be found on hill giants, sand giants and griffons.");
    }
    else {
      quest::say("My Sister Vilissia holds the secrets to making ruby lambent stones. Though she will not speak of it, if you give her two rubies and a lambent stone, she will make you ruby lambent.");
    }
  }
  if($text=~/sapphire/i) {
    quest::say("My Brother Gardern holds the secret to making sapphire lambent stones. Though he will not speak of it, if you give him two sapphires and a lambent stone, he will make you sapphire lambent.");
  }
  if($text=~/fire opal/i) {
    quest::say("My Brother Ostorm holds the secret to making fire opal lambent stones. Though he will not speak of it, if you give him two fire opals and a lambent stone, he will make you fire opal lambent. If you are interested, I can [sell] you a [fire opal].");
  }
  if($text=~/sell/i) {
    quest::say("I will sell you a fire opal for 550 golden coins. Remember, gold! The metal of fire for a gem of fire.");
  }
}

sub EVENT_ITEM {

  if(plugin::check_handin(\%itemcount, 10032 => 2, 10000 => 1)) {
    quest::say("Here is your prize - a lambent star ruby.");
    quest::summonitem(10117);
    quest::faction(320,15);
    quest::faction(291,-15);
  }
  elsif($gold == 550) {
    quest::say("Here is your prize - a lambent star ruby.");
    quest::summonitem(10117);
    quest::faction(320,15);
    quest::faction(291,-15);
  }
  elsif(plugin::check_handin(\%itemcount, 16507 => 1)) {
    quest::say("I see that Gavel has sent you to me. Very well, I have galvanized your platinum bar - take it.");
    quest::summonitem(19047); #Galvanized Platinum
  }
  plugin::return_items(\%itemcount);
}