#gfaydark\Dill_Fireshine.pl
#Quests: Orc Hatchets and Orc Runner (Kelethin)

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to the treetops and the home of Faydark's Champions. We are the skilled rangers of the Faydarks. You are safe in Kelethin. but watch yourself upon the forest floor. I hear the [blue meanies] have been on the rise.");
  }
  if($text=~/blue meanies/i) {
    quest::say("That is a little name I have given the Crushbone orcs. It appears they have increased their numbers. The Emerald Warriors are charged with our defense against them. We rangers are to seek out the [orc saboteurs].");
  }
  if($text=~/orc saboteurs/i) {
    quest::say("As others move to battle the orc armies. we have word that the orc pawns have been sent into the woods to damage the great trees which support Kelethin. We shall employ the talents of our young rangers to halt their efforts. I currently seek those who will [hunt the orc pawns].");
  }
  if($text=~/hunt the orc pawns/i) {
    quest::say("Go to the forest floor and seek out the orc pawns. Within their ranks can sometimes be found orc hatchetmen. They carry orc hatchets which you must return and I shall reward you for every two orc hatchets and perhaps offer you a weapon in return. should we have any to spare at the time.");
  }
  if($text=~/crushbone allies/i) {
    quest::say("It seems the orcs have allied themselves with the wicked Teir'Dal. We know of this through reports of a Teir'Dal presence within Crushbone. We must [intercept the Crushbone runners] and find a reason for their union.");
  }
  if($text=~/intercept the crushbone runners/i) {
    quest::say("Go to the Butcherblocks. You stand a greater chance of finding the runners there. I shall pay a bounty for all returned runner pouches.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12108 => 2)) { #Orc Hatchet x 2
    quest::say("Fantastic work!! Your actions shall earn you the respect of all Fier'Dal!  Take this as a small bounty for your deed.  We have heard of [Crushbone allies] who wish our demise.");
    quest::summonitem(quest::ChooseRandom(5047,5048,7032)); #Tarnished Scimitar, Tarnished Bastard Sword, Cast-Iron Rapier
    my %cash = plugin::RandomCash(10,20); #1sp ~ 2sp
    quest::givecash($cash{copper},$cash{silver},0,0); #Random cash reward
    quest::faction(99,3);  #Faydark's Champions
    quest::faction(178,3); #King Tearis Thex
    quest::faction(43,3);  #Clerics of Tunare
    quest::faction(304,3); #Soldiers of Tunare
    quest::faction(63,-6); #Crushbone Orcs
  }
  elsif(plugin::check_handin(\%itemcount, 12108 => 1)) { #Orc Hatchet
    quest::say("I expect to receive TWO orc hatchets.");
    quest::summonitem(12108); #Orc Hatchet
  }
  elsif(plugin::check_handin(\%itemcount, 18840 => 1)) { #Sealed Letter (Letter To King Naythox Thex)
    quest::say("Yes. A recent report has proven this to be true. An evil alliance has been made. We shall soon need many more experienced adventurers such as yourself. For now, take this reward and strengthen your skills.");
    quest::summonitem(8003); #Longbow
    my %cash = plugin::RandomCash(900,2000); #9gp ~ 2pp
    quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum}); #Random Cash Reward
    quest::faction(99,3);  #Faydark's Champions
    quest::faction(178,3); #King Tearis Thex
    quest::faction(43,3);  #Clerics of Tunare
    quest::faction(304,3); #Soldiers of Tunare
    quest::faction(63,-6); #Crushbone Orcs
  }
  elsif (plugin::check_handin(\%itemcount, 13226 => 1)) { #Runner Pouch
    quest::say("Good work. We shall cut off correspondence between these two. It is for the best. Remember, if you find any notes to Neriak from the ambassador in Crushbone, give them to me.");
    quest::summonitem(2140); #Raw-hide Tunic
    my %cash = plugin::RandomCash(900,2000); #9gp ~ 2pp
    quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum}); #Random Cash Reward
    quest::faction(99,3);  #Faydark's Champions
    quest::faction(178,3); #King Tearis Thex
    quest::faction(43,3);  #Clerics of Tunare
    quest::faction(304,3); #Soldiers of Tunare
    quest::faction(63,-6); #Crushbone Orcs
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gfaydark  ID:54105 -- Dill_Fireshine