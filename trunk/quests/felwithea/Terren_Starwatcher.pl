sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome friend! Have you come to the Temple of Tunare to give praise or are you a young Cleric seeking [guidance] from your elders?");
}
if($text=~/guidance/i){
quest::say("Tunare shall be pleased to have a new disciple amongst her Koada`Dal children. We Clerics of Tunare offer spiritual guidance to the citizens of Felwithe and when needed aid the Paladins of Tunare and the Keepers of the Art in the defense of our people and forest from those [creatures] that seek to cause us harm. Every young cleric should pursue acquiring a [suit of armor] to protect themselves when aiding those in need outside of the safety of Felwithes walls.");
}
if($text=~/creatures/i){
quest::say("There are many evil creatures in Norrath. Some are evil by nature. others have chosen evil by their devotion to evil deities. Even the Faydarks are not safe for young Koada`Dal. The orcs of Clan Crushbone seek to expand their territory from their citadel to the north. The brownies viciously guard their hidden communities. pixies play mischievous and sometimes deadly pranks on travelers. and the arboreans have returned to the Faydarks after centuries of slumber."); 
}
if($text=~/suit of armor/i){
quest::say("You will need this Mail Assembly Kit to craft your Sylvan Initiate Armor. The materials required for the armor vary according to which piece you desire to craft. Once you have been suitably outfitted return to me and I will offer [further guidance]. Do you desire to craft [Sylvan Initiate Gauntlets]. [Sylvan Initiate Boots]. a [Sylvan Initiate Bracer]. a [Sylvan Initiate Helm]. [Sylvan Initiate Greaves]. [Sylvan Initiate Vambraces]. or a [Sylvan Initiate Breastplate]?");
quest::summonitem("17124");
}
if($text=~/gauntlets/i){
quest::say("To assemble sylvan initiate gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Large Sylvan Bat Fur and two Arborean Sprout Twigs in the Mail Assembly Kit.");
quest::summonitem("19633");
}
if($text=~/boots/i){
quest::say("To assemble sylvan initiate boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Large Sylvan Bat Fur. and two Arborean Sprout Roots in the Mail Assembly Kit.");
quest::summonitem("19634");
}
if($text=~/bracer/i){
quest::say("To assemble a sylvan initiate bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done. combine the Crude Bronze Bracer with a Large Sylvan Bat Fur and an Arborean Sprout Bark in the Mail Assembly Kit.");
quest::summonitem("19632");
}
if($text=~/helm/i){
quest::say("To assemble a sylvan initiate helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Large Sylvan Bat Fur and an Arborean Sapling Bark in the Mail Assembly Kit.");
quest::summonitem("19631");
}
if($text=~/greaves/i){
quest::say("To assemble sylvan initiate greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Giant Sylvan Bat Furs and two Arborean Sapling Barks in the Mail Assembly Kit.");
quest::summonitem("19636"); 
}
if($text=~/vambraces/i){
quest::say("To assemble sylvan initiate vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Giant Sylvan Bat Fur and two Arborean Sapling Barks in the Mail Assembly Kit.");
quest::summonitem("19635");
}
if($text=~/breastplate/i){
quest::say("To assemble a sylvan initiate breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Giant Sylvan Bat Fur. and two Mature Arborean Barks in the Mail Assembly Kit.");
quest::summonitem("19637");
}
if($text=~/further guidance/i){
quest::say("If you are ready to put your life on the line for the citizens of our homeland than hear my words. The Crushbone Clan of Orcs are evil and strong adversaries of we Koada`Dal. Recently an orc scout assaulted a merchant from our city carrying a valuable amulet from the Fier`Dal city of Kelethin. Our seers have divined the name of the orc that is in possession of the amulet. Gurleg Bribgok. Find this despicable creature and return the amulet to me so that I may return it to its proper owner."); 
 
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20280 => 1)) {
    quest::say("You have done well young $name. If you continue to show such devotion to your people and your faith then perhaps one day you will serve in the chambers of King Tearis Thex himself. Take this Rusty Sylvan Morning Star and scrape the rust from it in a forge with a sharpening stone. It may take several attempts if you are unfamiliar with the process. Once that is done bring me the Refined Sylvan Morning Star, a Pristine Drakeling Scales, and an Arborean Amber.");
    quest::summonitem(20297);
    quest::faction(43,10);
    quest::faction(178,10);
    quest::faction(8,10);
    quest::exp(36450);
    quest::ding();
    
  }
  
  if (plugin::check_handin(\%itemcount, 20300 => 1, 20271 => 1, 20274 => 1)) {
    quest::emote("Terren Starwatcher fashions a grip out of the pristine forest drakeling scales, fastens the arborean amber to the pommel, and polishes the head of the morning star with a luminescent substance. 'I grant you a Sylvan Initiate Morning Star. May it serve you well in your service to The All Mother.");
    quest::summonitem(20330);
    quest::faction(43,10);
    quest::faction(178,10);
    quest::faction(8,10);
    quest::exp(36450);
    quest::ding();
      
  }
  

  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:felwithea  ID:61010 -- Terren_Starwatcher
