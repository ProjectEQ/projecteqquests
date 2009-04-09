sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings adventure seeker. I have come from afar to study this strange thicket. The spirits are strong within this region, but they are secretive as well.  I am willing to impart my wisdom to those who will aid me in my exploration. Are you [interested?]");
}
if($text=~/I am interested/i){
quest::say("Very well then! Let us begin.  First you must attune yourself with the nature of spirits. For this you must learn to find a spiritual anchor. Find such a thing within the crater that surrounds Shar Vahl and return it to me.  Then we may continue. I cannot tell you more, but there is a Vah Shir who has the knowledge that you seek. Seek him out in this thicket to learn what you can."); }
}
sub EVENT_ITEM { 
if($itemcount{30601} == 1){
quest::say("Excellent! You have done well.  I can sense that you are in tune with the spirits around you. Take this, for you will need it in your next task. When you are [ready] for your next lesson let me know.");
quest::summonitem("15093","1"); }
}
#END of FILE Zone:shadeweaver  ID:165101 -- Groo_McManus 

