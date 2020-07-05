#zone: gunthak NPC: Olden (224200)
#Angelox
# items: 59510, 21820, 59511, 21821, 59512, 21822, 59513, 21823

sub EVENT_SAY { 
if ($text=~/Hail/i){
  #quest::say("Hello $name, you might want to stand back.  I've got a nasty cough and I don't want to be spreading it around.  Hopefully you haven't come to sell a green drogmor back, I'm afraid I might be allergic to them and that will make my cough even worse!  Oh, but I suppose I'll have to buy it back from you if you're sure you don't want it.  Show me your green drum and I'll make you a platinum offer for it.");
  quest::emote("coughs violently as you approach him. He looks rather sick. 'Hello $name, you might want to stand back. I've got a nasty cough and I don't want to be spreading it around. Hopefully you haven't come to sell a green drogmor back, I'm afraid I might be allergic to them and that will make my cough even worse! Oh, but I suppose I'll have to buy it back from you if you're sure you don't want it. Show me your green drum and I'll make you a platinum offer for it.");
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,59510 => 1)) {
    quest::summonitem(21820); # Item: Bag of Platinum Pieces
  }
  elsif(plugin::check_handin(\%itemcount,59511 => 1)) {
    quest::summonitem(21821); # Item: Heavy Bag of Platinum
  }
  elsif(plugin::check_handin(\%itemcount,59512 => 1)) {
    quest::summonitem(21822); # Item: Big Bag of Platinum
  }
  elsif(plugin::check_handin(\%itemcount,59513 => 1)) {
    quest::summonitem(21823); # Item: Huge Bag of Platinum
  }
  plugin::return_items(\%itemcount);
}