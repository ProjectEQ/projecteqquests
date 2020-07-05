# items: 17998, 18468, 22923, 7881, 18467, 22922, 12688, 4350, 4351, 4352, 4353, 4354, 4355, 4356, 4357, 4358, 4359
sub EVENT_SAY { 
 if($text=~/Hail/i){
  quest::say("Welcome.  Who has [sent] you to me?");
 }
 if($text=~/Grand Master Glox/i){
  quest::say("So Grand Master Glox has sent you?  You must be new to the court.  We are of the Swifttail caste as are you.  Under the guidance of masters such as I. you will forge your body into a weapon of pure destruction.  Do not bother the Grand Master.  he is in constant meditation and is bothered with only the most paramount of concerns.  Are you [ready to train]?");
 }
 if($text=~/ready to train/i){
  quest::say("Then I can offer training in the martial arts as well as other skills.  Please remember to obtain knowledge from our court chronicler.  You shall also begin to aid your brothers and sisters with [menial tasks].  All begin upon the rung of dust and all have done these tasks in order to climb to the next rung.");
 }
 if($text=~/menial tasks/i){
  quest::say("We have a few menial tasks we require our young members to perform.  Young members must [tailor training bags] for our court.");
 }
 if($text=~/tailor training bags/i){
  quest::say("Then take this leech husk pouch and fill it with the obvious.  Once done. combine the skins and take the full leech husk pouch to a local tailor by the name of Klok Mugruk.  He is the one who cleans and toughens the husks for us. He shall hand you a ready-made training bag husk.  He will instruct you further.");
  quest::summonitem(17998); # Item: Leech Husk Pouch
 }
 if($text=~/master rinmark/i){
  quest::say("Seeking Master Rinmark? He has left the Court of Pain. Gone to focus his thoughts on the elements of wind and thunder. I believe he was headed toward the Overthere. That was the last I heard of his trek.");
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18468 => 1, 22923 => 1)){
  quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
  quest::summonitem(7881); # Item: Mark of Clarity
  quest::exp(20000);
  quest::ding();
  quest::faction(444,20); # Faction: Swift Tails
  quest::faction(441,10); # Faction: Legion of Cabilis
 }
 elsif(plugin::check_handin(\%itemcount, 18467 => 1, 22922 => 1)){
  quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
  quest::summonitem(7881); # Item: Mark of Clarity
  quest::exp(20000);
  quest::ding();
  quest::faction(444,20); # Faction: Swift Tails
  quest::faction(441,10); # Faction: Legion of Cabilis
 }
  elsif(plugin::check_handin(\%itemcount, 12688 => 1)) { #Monk Training Bag
    quest::say("Excellent work young one. Take this armor and wear it with pride!"); #Text made up
    quest::summonitem(quest::ChooseRandom(4350,4351,4352,4353,4354,4355,4356,4357,4358,4359)); #Random Sparring Armor Piece
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Monk');
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:cabeast  ID:3429 -- Master_Bain 
