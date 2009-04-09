sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Unless you intend to [make yourself useful]. do not bother me.  I await the return of our Lord. Cazic-Thule.  He comes. and I shall be the first to greet Him.  I will train you. if need be. for He looks upon those who aid Him kindly.  If you are not here for training. return to your meditations or bother someone else.");
}
if($text=~/i want to make myself useful/i){
quest::say("One of our spies has reported a sighting of Malik Zaren. a courier of [the High Council].  He was seen resting at an inn called 'Golden Roosters' in High Pass Hold and is en route to Erudin Palace. He may be carrying a message containing information of great value to us.  Hunt him down and return to me with the letter he carries. I will reward you for this task.");
}
if($text=~/what high council/i){
quest::say("The High Council is the governing board of Erudin. our sworn enemies.  Beware of these types. they will not look upon you warmly.");
}
if($text=~/I intend to make myself useful/i){
quest::say("One of our spies has reported a sighting of Malik Zaren. a courier of [the High Council].  He was seen resting at an inn called 'Golden Roosters' in High Pass Hold and is en route to Erudin Palace. He may be carrying a message containing information of great value to us.  Hunt him down and return to me with the letter he carries. I will reward you for this task.");
}
if($text=~/i wish to make myself usefull/i){
quest::say("One of our spies has reported a sighting of Malik Zaren. a courier of [the High Council].  He was seen resting at an inn called 'Golden Roosters' in High Pass Hold and is en route to Erudin Palace. He may be carrying a message containing information of great value to us.  Hunt him down and return to me with the letter he carries. I will reward you for this task."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:paineel  ID:75109 -- Shevra_Kollintar 
