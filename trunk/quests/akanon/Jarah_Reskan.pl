sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. child. Welcome to Gemchopper Hall. I trust that you are a [warrior]. or perhaps you are lost..?");
}
if($text=~/I am a warrior/i){
quest::say("That is good news! We gnomes are not known for our love of battle so it is always good to bring new blood into our ranks. We shall prove our worth as warriors to all other races. For now. there is much to do in Ak'Anon. There are [rogue clockworks] and the [cargo clockwork].");
}
if($text=~/what rogue clockworks?/i){
quest::say("The clockworks are the responsibility of Manik Compolten. Speak with him - I am sure he is here somewhere."); }
}

sub EVENT_ITEM {
 #do all other handins first with plugin, then let it do disciplines
 plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
 plugin::return_items(\%itemcount);
}
#END of FILE Zone:akanon  ID:55172 -- Jarah_Reskan 
