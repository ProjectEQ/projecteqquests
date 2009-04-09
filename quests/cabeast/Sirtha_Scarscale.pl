#The other NPC for the Iksar Shadowknight low- to mid-level armors.

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::emote("eyes you intently. 'So, yet another hatchling approaches us. I am known as Sirtha and that is Sarth. We are of [Rile's] children. Who do you call your father, broodling?'");
  }
  if($text=~/Rile/i){
    quest::say("Very good. We are smiths for the Crusaders of the Greenmist and I shall make [armor] for you, provided you prove your worth. Fail these simple tasks, and you shall not be worthy to bear the title of crusader!");
  }
  if($text=~/armor/i){
    quest::say("I will make [helms], [gauntlets], [boots], and [vambraces]. My broodmate shall make the bracers, greaves, masks, and breastplate.");
  }
  if($text=~/helm/i){
    quest::say("The sarnak are a mockery of the Iksar. They are nothing more than beasts fit only to do our bidding! I require you to bring me the sword of one of their Order of Knights and the head of a sarnak berserker. These beasts have been attacking our patrols of late. I also require a stone called a ruby and a banded helm. Do this and I shall make a helm for you.");
  }
  if($text=~/boots/i){
    quest::say("Cactus quills can be very lethal. I seek to work them into my new boots. Find me these quills, a pair of skeletal feet, an emerald of fire, and some banded boots so that I may start working on them. Why are you still here?! Begone!");
  }
  if($text=~/gauntlets/i){
    quest::say("I currently have need of a complete skeletal hand for the research I am conducting. I wish to study its properties and form so that I can make gauntlets befitting our station. I also require two rubies that holds stars within and some banded gauntlets to complete my ritual. Do that and the gauntlets are yours to keep.");
  }
  if($text=~/vambraces/i){
    quest::say("The hideous Golra are hardy creatures. The tales indicate their ferocity almost matches our own. I wish to gain a trophy of one of these beasts. Bring me the skin of one, two blue sapphires, and banded sleeves. Then I shall give you these fine vambraces.");
  }
}

sub EVENT_ITEM {
  #Dreadscale Helm for:  Head=14822  Sword=14826  Helm=3053  Ruby=10035
  if(plugin::check_handin(\%itemcount,14822=>1,14826=>1,3053=>1,10035=>1)) {
    quest::say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
    quest::summonitem(4968);
  }
  #Dreadscale Boots for:  Quills=14828  Boots=3064  Feet=14823  FireEmerald=10033
  elsif(plugin::check_handin(\%itemcount,14828=>1,14823=>1,3064=>1,10033=>1)) {
    quest::say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
    quest::summonitem(4974);
  }
  #Dreadscale Gauntlets for:  Hand=14825  Gauntlets=3062  StarRuby=10032
  elsif(plugin::check_handin(\%itemcount,14825=>1,3062=>1,10032=>2)) {
    quest::say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
    quest::summonitem(4972);
  }
  #Dreadscale Vambraces for:  Hide=14830  Vambraces=3060  Sapphire=10034
  elsif(plugin::check_handin(\%itemcount,14830=>1,3060=>1,10034=>2)) {
    quest::say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
    quest::summonitem(4970);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::exp(10000);
  quest::ding();
}

#END of FILE Zone:cabeast  ID:106010 -- Sirtha_Scarscale

