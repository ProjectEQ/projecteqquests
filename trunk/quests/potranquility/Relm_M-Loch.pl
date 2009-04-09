sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings, traveler. Do you find the Plane of Tranquility interesting? Myself, hmm . . . I'm afraid it rather bores me. I have read these ancient tomes, watched the waves lap lazily against the shore, quietly observed the Weavereaders while they ply their trade - and it does nothing for me. My thoughts always return to the one place that has utterly captured my fascination, Innoruuk's realm: the Plane of Hatred. There are not words to describe the exhilarating emotions of rage, terror and anxiety that overwhelm me while in his domain. Unfortunately, my obligations require me to tarry here awhile longer, but if you would like to visit Hate I can take you there. Give me a Fuligan Soulstone to focus upon and I can transport a single person. Of course, I could also send you to an [inferior plane]... ");
 }
if($text=~/inferior plane/i){
                quest::say("Why would you want to go to the Plane of Sky when you can visit Innoruuk instead?!?! Well, if you must go then give me a Cloudy Stone of Veeshan to focus upon and I can transport a single person.");
}
 }

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 10092 => 1)){
		quest::say("Enjoy the exquisite anger, $name, and give my regards to Innoruuk!");
		quest::selfcast(666);
 }
	if(plugin::check_handin(\%itemcount, 10094 => 1)){
		quest::say("Bah. Off you go.");
		quest::selfcast(674);
 }
plugin::return_items(\%itemcount);
}