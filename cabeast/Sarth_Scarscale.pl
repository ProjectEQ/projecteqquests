#Iksar low- to mid-level armor quests.  This is for the Shadowknight.  
#In order for this to work, must add:  Drixie Wings (Item 14827) to Lady Chromoire (both instances) in Firiona Vie as a 50% probability 100% drop on it's own LootDrop.  

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::emote("hisses at you loudly. 'So, you bear the [mantle of a crusader], yes?  I am known as Sarth and shall reward you, provided you prove your worthiness to our cause, child of Rile.'");
  }
  if($text=~/mantle of a crusader/i){
    quest::say("We shall see if you are worthy of that. I shall make [armor] for you, to aid you in your service to our Father. I specialize in the forging of [bracers], [greaves], [masks], and [breastplates]. Sirtha makes the other items of armor. Take care when you address her, hatchling. It would not be the first time a hatchling has left here with scars.");
  }
  if($text=~/armor/i){
    quest::say("Yes, I shall make [armor] for you, to aid you in your service to our Father. I specialize in the forging of [bracers], [greaves], [masks], and [breastplates]. Sirtha makes the other items of armor. Take care when you address her, hatchling.  It would not be the first time a hatchling has left here with scars.");
  }
  if($text=~/bracers/i){
    quest::say("Have you ever seen Bloodgills? I hear they will devour a broodling in seconds and that their scales are tough as iron. Bring me some of these scales, a banded bracer, and a sapphire as blue as the sky. Only then will I give the bracer to you, broodling.");
  }
  if($text=~/greaves/i){
    quest::say("Do you know the beasts that call themselves sarnaks? One such beast who calls itself Zorash attacked an envoy of merchants who were to deliver a pair of special boots to me. It taunts us by wearing them as a trophy. Bring them back and the skull of Grachnist, his goblin ally. Return them to me along with a star ruby and your banded greaves, and I shall craft you an excellent pair of greaves.");
  }
  if($text=~/mask/i){
    quest::say("Have you ever encountered a drixie before? I crush every one I see. They are an annoyance beyond mere words! Kill the Queen and bring me her wings as a trophy along with an emerald of fire and a banded mask.");
  }
  if($text=~/breastplate/i){
    quest::say("Ahhhh....a breastplate you want, is it? Well, they are not easy to come by. Fetch me a scorpion chitin. Intact, mind you! They are extremely fragile and must be treated before they can protect your carcass. Also, fetch me a war braid from a sarnak to connect the pieces. I also require a ruby and your banded tunic. Do this and I shall make it for you, hatchling. Now, go!"); 
  }
}
 
sub EVENT_ITEM {
  #Dreadscale Bracer for:  Scale=14824  Bracer=3061  Sapphire=10034  
  if(plugin::check_handin(\%itemcount,14824=>1,3061=>1,10034=>1)) {
    quest::say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
    quest::summonitem(4971);
  }
  #Dreadscale Greaves for:  Boots=14829  Head=14820  Greaves=3063  StarRuby=10032
  elsif(plugin::check_handin(\%itemcount,14829=>1,14820=>1,3063=>1,10032=>1)) {
    quest::say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
    quest::summonitem(4973);
  }
  #Dreadscale Mask for:  Wings=14827  Mask=3054  FireEmerald=10033
  elsif(plugin::check_handin(\%itemcount,14827=>1,3054=>1,10033=>1)) {
    quest::say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
    quest::summonitem(4975);
  }
  #Dreadscale Breastplate for:  Braid=12982  Chitin=14821  Breastplate=3056  Ruby=10035  
  elsif(plugin::check_handin(\%itemcount,12982=>1,14821=>1,3056=>1,10035=>1)) {
    quest::say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
    quest::summonitem(4969);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::exp(10000);
  quest::ding();
}

#END of FILE Zone:cabeast  ID:106011 -- Sarth_Scarscale

