sub EVENT_SAY {
  if($text=~/hail/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 7) {
    quest::emote("beams with excitement");
    quest::say("I recognize you! One of the adventurers we've heard tales about! There are rumors of you destroying the Legion of Mata Muram. Have you come to set us free?");
}
}
  if($text=~/set you free/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 7) {
    quest::say("Bless you, we're saved! Listen up, friend. I've already formulated a plan to stage a quick and decisive escape, but first we need to get our hands on a complete set of shackle keys. Just a few won't suffice; it must be entire set. If we were to rescue only some of my brethren, those that remain behind would be brutally tortured beyond imagination. Now, I've watched the guards carefully and counted the silvery keys they carry. There are ten in total. Combine the set in this sack and return it to me. I knew you would help!");
    quest::summonitem(52100);
    }
    }
    }
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52161 =>1 )) {
    quest::emote("fishes a jagged key from the sack and tries it on his manacles. They unlock with a loud snap and slide off his wrists. His expression melts into simultaneous shock and elation. ");
    quest::say("YES! We will be freed. Very soon now, these chains will bind my people no longer! And as for you, $name, you will become a legend among my people.");
    quest::emote("can barely contain his excitement.");
    quest::say("This is wonderful news, friend. Freedom is within our grasp! The only problem remaining is the ever-present guards. They are always watching over us. We would need a monumental distraction to buy enough time for me to release everyone. Which is where you come in. One of your kind who goes by the name of Reyna has been taken to the arena and has been tortured daily in front of the Muramite masses. If you were to create enough of a ruckus in the arena trying to free her I think we could make our escape.");
    quest::faction(363,10);
    quest::faction(416,-10);
    quest::exp(10000);
    quest::setglobal("bic",8,5,"F");
  }
  plugin::return_items(\%itemcount);
}