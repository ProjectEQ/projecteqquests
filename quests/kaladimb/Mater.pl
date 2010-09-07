sub EVENT_SAY { 
if ($text=~/hail/i) {
  if ($class eq "Rogue") {
    quest::say("Ah, welcome! We could use some fresh blood around here. The name's Mater, and I run this little outfit. Work hard for me, and I will reward you well. Cross me, and you'll find yourself buried under the mine cap. Once you are ready to begin your training please make sure that you see Crovsar Dirkbringer, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
  }
  else {
    quest::say("Welcome to the mines of Kaladim!"); 
  }
  if (($text=~/mining pick 628/i) && ($class eq "Rogue")) {
    if (plugin::check_hasitem($client, 12166) { #Parrying Pick 628
      quest::say("Ah, so Diggins sent you, eh? You can prove you are worthy of the Miners Pick 628 if you bring me the head of that filthy Boog Mudtoe... oh, and 300 gold pieces should cover the cost of the pick."); #Text made up
    }
    else {
      quest::say("I do not think you are ready for such power. You need to prove yourself first. Maybe you should go talk with Diggins."); #Text made up
    }
}

sub EVENT_ITEM {
  my $cash = $copper + $silver * 10 + $gold * 100 + $platinum * 1000;
  if (plugin::check_handin(\%itemcount, 13316 => 1)) { #Ogre Head
    if ($cash >= 30000) { #300 gold
      quest::say("Excellent work, $name. Take this as proof of your hard work!"); #Text made up
      quest::summonitem(12161); #Miners Pick 628
    }
    else {
      quest::say("It seems you are a little short on gold pieces...");
      quest::summonitem(13316); #Ogre Head
      quest::givecash($copper, $silver, $gold, $platinum);
    }
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:kaladimb  ID:67019 -- Mater