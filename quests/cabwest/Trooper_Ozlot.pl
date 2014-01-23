sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, citizen! If it is a good time you are seeking, you should head toward the tavern. You can't miss it. There is only one. The emperor says we should spend most of our time training, not in revelry. We troopers try.");
  }
  if ($text=~/sign the restraining order/i) {
    quest::say("I do not believe you were sent by the legion. You do not look as though you could squash a kitten or even a bug. If you truly were sent, then you should be able to hunt down a sabertooth kitten. Tell you what, you bring me two sabertooth kitten canines and the legion order and I shall believe you. Only then will I sign the order for you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18246 => 1, 12670 => 2)) { #Legion Order (6 signed), Sabertooth Kitten Canine x 2
    quest::say("I suppose you were sent by the legion. I will sign. Here is the legion order back. Now, leave, so I can finish my watch.");
    quest::summonitem(18247); #Legion Order (7 signed)
    quest::faction(193,5); #Legion of Cabilis
    quest::faction(30,5); #Cabilis Residents
    quest::faction(282,5); #Scaled Mystics
    quest::faction(62,5); #Crusaders of Greenmist
    quest::faction(317,5); #Swift Tails
    quest::exp(800);
  }
  elsif (plugin::check_handin(\%itemcount, 18246 => 1) {
    quest::say("I told you that I need two sabertooth kitten canines and the legion order.");
    quest::summonitem(18246);
  }
  elsif (plugin::check_handin(\%itemcount, 12670 => 2) {
    quest::say("I told you that I need two sabertooth kitten canines and the legion order.");
    quest::summonitem(12670);
    quest::summonitem(12670);
  }
  elsif (plugin::check_handin(\%itemcount, 12670 => 1) {
    quest::say("I told you that I need two sabertooth kitten canines and the legion order.");
    quest::summonitem(12670);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabwest  ID:5135 -- Trooper_Ozlot