sub EVENT_SAY { 
if($text=~/i have come to worship/i){
quest::say("Very well. You worship quietly then. May Brell Serilis bless you.");
}
if($text=~/i have come to pay your respects/i){
quest::say("You have. well then! You can pay your respects by bringing me a [present].");
}
if($text=~/i have come to pay my respects/i){
quest::say("You have. well then! You can pay your respects by bringing me a [present].");
}
if($text=~/what present/i){
quest::say("I like necklaces. I wear necklaces made from every kind of beast. The power of the beast is contained within each necklace. The more necklaces I wear. the greater my power! Bring me a Bear Fang Necklace. a Wolf Fang Necklace and a Panther Fang Necklace. This will show your devotion to the temple. Then perhaps I can do you a [favor].");
}
if($text=~/I/i){
quest::say("You have. well then! You can pay your respects by bringing me a [present].");
}
if($text=~/I/i){
quest::say("Very well. You worship quietly then. May Brell Serilis bless you.");
}
if($text=~/I have come to pay respects/i){
quest::say("You have. well then! You can pay your respects by bringing me a [present]."); }
}
#END of FILE Zone:jaggedpine  ID:181124 -- Oracle_Jaarl 

