#Savage_Lord_Cedrean
#Beastlord Tomes/Planar Armor Exchange
#I added the tome hand-in, it didn't exist previously -Kilelen

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("in an almost arcane motion, gives a mystic gesture of ancient greetings. 'The light of Selia shines upon you most brightly, $name. Be at ease, and know that all answers you seek will be delivered in time. The library of Myrist, though lacking the purity of the virtues we hold most dear to our selves in valiant memory of our mortal endeavors, is truly an unrivaled source of infinite knowledge. However, if you seek the comfort of your own light and goodly virtues, then Selia shall provide whatever it can to accommodate your needs while in our midst. Unfortunately, the ruling of the council has limited each individual citizen of the city to one particular specialty so that each have their equal opportunity to share their unique knowledge. In my former life, I was a master of the beasts and crusader of Mithaniel Marr. If you share the same profession as I and are in need of training, then I am more than pleased to oblige you.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 7817 => 1)) ||
		(plugin::check_handin(\%itemcount, 7818 => 1)) ||
		(plugin::check_handin(\%itemcount, 7819 => 1)) ||
		(plugin::check_handin(\%itemcount, 7832 => 1)) ||
		(plugin::check_handin(\%itemcount, 7833 => 1)) ||
		(plugin::check_handin(\%itemcount, 7834 => 1)) ||
		(plugin::check_handin(\%itemcount, 7835 => 1))) {#Anthemion Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(3493875);
  }

		plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
		plugin::return_items(\%itemcount);
		quest::say("I don't need this.");#Text made up
	}
#END of FILE Zone:poknowledge  ID:202235 -- Savage_Lord_Cedrean 