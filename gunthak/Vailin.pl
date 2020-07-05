#zone: gunthak - NPC: Vailin (224201)
#Angelox
# items: 59505, 21820, 59506, 21821, 59507, 21822, 59508, 21823

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("Greetings $name, I suppose you're here looking at the fine drogmors my friend Hizaklom has for sale.  Fine, fine beasts they are.  They'll most assuredly get you where you want to go, and safely at that! Of course, if you decide that you're not happy with one of them I'm sure we can work out a deal.  I'm in charge of the black variety.  Which are obviously the best I might add.  I won't touch any other color.  Give me your calling drum and I'll give you a fair price for it.");
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,59505=> 1)){
    quest::summonitem(21820); # Item: Bag of Platinum Pieces
}
  elsif(plugin::check_handin(\%itemcount,59506=> 1)){
    quest::summonitem(21821); # Item: Heavy Bag of Platinum
}
  elsif(plugin::check_handin(\%itemcount,59507=> 1)){
    quest::summonitem(21822); # Item: Big Bag of Platinum
}
  elsif(plugin::check_handin(\%itemcount,59508=> 1)){
    quest::summonitem(21823); # Item: Huge Bag of Platinum
}
  plugin::return_items(\%itemcount);
}
