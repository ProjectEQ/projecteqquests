#BeginFile: Erandi_Natasu.pl
#Quest for Paineel - Erandi Natasu: Pirate Trouble

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("looks nervously about before leaning in close to your ear. 'Do you need [work]?'");
  }
  if($text=~/work/i) {
    quest::say("My name is Erandi Natasu. I am here representing a group of interested parties among the merchant coalitions across Norrath. You do not need to know who is involved with this. We are looking to hire a few people to [take care] of some things for us.");
  }
  if($text=~/take care/i) {
    quest::say("Our businesses are hurting, people cannot keep up their stock or afford to stay in business with the upsurge in [piracy] upon our waters. Trade lines are cut between the continents; supplies are not arriving at their proper destinations. It is quite dreadful.");
  }
  if($text=~/piracy/i) {
    quest::say("As the pirates that reside in Broken Skull Rock become stronger and more bold, the attacks on our ships have increased dramatically. Would you be interested in helping the very merchants that supply your food and clothing by performing some mercenary services?");
  }
  if($text=~/help/i) {
    quest::say("Wonderful! There are a few ships in particular that have been causing us much grief, their names are Stormwave, Lady Dirulia, Dandolak's Run, Oceancrasher, and Windscorn. Between these five ships terror has been spread to the end of the seas. Each crew seems to have some kind of common badge amongst themselves, if you can slay two members of every crew I believe the merchants would be satisfied. Bring us these seals and we will be most pleased.");
    quest::summonitem(17181); #Merchant's Crate
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,54016 => 1)) {
    quest::say("How marvelous! The Coalition will be delighted by this win. We have all worked together to obtain this as a prize for whomever would be successful in this mission, please accept it and our gratitude.");
    quest::summonitem(54017); #Symbol of Loyalty to the People
  }
  else {
    quest::say("I have no need of this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#EndFile: Erandi_Natasu.pl