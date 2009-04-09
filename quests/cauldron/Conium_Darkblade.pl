#npc - Conium Darkblade
#zone - Dagnors Cauldron
#reward - Wasp Poison

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("You seek Cinium Darkblade, do you? Find me you have. Often I am here. To test my [Wasp Poison], yes. Less Aqua Gobs there now are. Ha!! A true rogue am I with no leader or guild. Just the wind and shadows and much treasure to be had.");
  }
  if($text=~/wasp poison/i) {
    quest::say("Giant Wasp Venom made from the Giant Wasp Venom Sacs. An interest in poison we share? Need the insect venom you do. It comes not cheap.
My time is precious, my talent supreme.. 30 Gold is my price and also provide me with three Giant Wasp Venom Sacs.");
  }
  if ($text=~/the one who once owned it/i) {
    quest::say("The human who gave me the axe remains nameless. We were separated during the battle. If he ever got out of there with all his gold, I do not know. The only clue I know of is the axe itself. The words 'Top of the World' were once printed on its handle.");
  }
  if ($text=~/top of the world/i) {
    quest::say("High in the pass you can find Top of the World. It sits near the highest bridge. It is one of the newest additions to our community. It specializes in imported items for adventuring.");
  }
}

sub EVENT_ITEM {
  if(($itemcount{13260} == 3) && ($gold == 30)) {
    quest::say("Eh, you didn't get this from meh.");
    quest::summonitem(14032);
  }
  if (plugin::check_handin(\%itemcount, 18955 => 1)) {
    quest::say("So Lon has sworn allegiance to a temple. What a fool, but he is a skilled fool. My word is my bond and if he asks for the gem, then so be it. Unfortunately I traded it for a much-needed axe. It was in the middle of a dungeon and... well, that is a long story. If you want to get the gem, take this axe back to the [one who once owned it].");
    quest::ding();
    quest::summonitem(12366);
  }
  plugin::return_items(\%itemcount);
}
# EOF

