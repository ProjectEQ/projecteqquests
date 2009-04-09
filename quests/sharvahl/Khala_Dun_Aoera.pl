#Quest for Whiptail Poison Gland
#Zone:sharvahl  ID:155302 -- Khala_Dun_Aoera

sub EVENT_SAY {
  if ($text=~ /hail/i)  {
   quest::say ("Welcome to our fair city traveler. We have much in the way of
       fine food and entertainment. If you are planning to explore the crater,
       please beware of the [vermin] infesting the area.");
}
if($text=~/vermin/i) {
   quest::say("There are all kinds of bugs, worms, and even grimlings that
       roam through the crater. They scavenge the food dropped below
      by careless people, as well as the occasional unskilled citizens
       and adventurers who wish to put their hunting prowess to the test.
       If you are considering hunting in the crater despite my warnings,
       do consider assisting our city by returning with some of the
       scorpion glands. If you supply Spiritist Ragnar with these glands,
       he will be able to make a sufficient anti venom for those who are
       bit by these horrid little beasts.");
}
}

#END of FILE Zone:sharvahl  ID:155302 -- Khala_Dun_Aoera
