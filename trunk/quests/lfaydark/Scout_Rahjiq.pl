sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is a pleasure to meet you. but I do not have time to speak.  I am waiting on official word from Shar Vahl.  If you have been sent to assist me. please show me the Official Seal of the Khati Sha at this time.  If you are not such a person. please carry on with your business and leave me to tend to mine."); }

}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9031 =>1 )) {
    quest::say("Keep your head down, mate! The spirit that you have come for is very close. I have spotted it several times today. It keeps appearing near that odd structure just over the hill. Be careful not to attract the attention of those invisible creatures that roam near the structure. Just release the spirit and return the totem to me. I'll prepare the totem for placement in the container that you were given.");
    quest::emote("The air before the large monolith grows solid, as misty tendrils wrap together in the shape of a large wolf.");
    quest::spawn(57119,0,0,-1675,-337,0) 
  }
  if (plugin::check_handin(\%itemcount, 9034 =>1 )) {
  quest::emote("wraps the totem and returns it with the seal you gave him and says");
  quest::say("That spirit was very powerful. I'm glad that you were able to release it. Please keep this totem safe until you can return to Shar Vahl. Once you collect all of the totems, seal the box and return it to your master. May the spirits watch over you!");
  quest::summonitem(9031);
  quest::summonitem(9035);
    
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:lfaydark  ID:5796 -- Scout_Rahjiq 

