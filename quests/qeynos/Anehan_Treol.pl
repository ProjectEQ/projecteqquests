sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Ah.. Hello there..  $name, was it?  Yes, right, $name.  Anyhow, my name's Anehan Treol, member of the League of Antonican Bards.  Feel free to visit our humble guild house here in South Qeynos.  It's called the Wind Spirit's Song and we often put on free shows there.  I think you'd enjoy it.  Anyway, nice chatting with you, and I hope to see you again soon."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18021 =>1 )) {
    quest::say("Oh, report time already again? Yeah, here ya go, $name. Be careful around here at night, I've been seeing some rough looking characters lurking about.");
    quest::summonitem(18022);
    quest::faction( 192,2);
   quest::faction( 184,2);
   quest::faction( 135,2);
   quest::faction( 273,-2);
   quest::faction( 207,-2);
   quest::exp(200);
    
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos  ID:1003 -- Anehan_Treol 

