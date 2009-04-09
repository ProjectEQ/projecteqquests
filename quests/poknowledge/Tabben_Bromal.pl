sub EVENT_SAY {
 if($text =~ /Hail, Tabben Bromal/i) {
	quest::say("What is it? What do you wan. . . Oh bloody underfoot, do forgive me, traveler. I'm not used to all this bickering and flittering about -- you know, the bustle of the 'living' city. The racket, the noise, and the wails of the children. Bah! I came here to escape it, not to relive it. But if I survived it once, I sure as Brell's holy bottom will do it again! In hopes of getting you all out of here as soon as possible and the peace and quiet being resurrected out of your blessed absence, I've agreed to lend some of my knowledge of the more inferior levels of tinkering to those who have an interest in this art. If you don't intend on purchasing any materials, then be off with you and leave me in peace. However, if you have coin in your pocket and you plan on spending, then do so quickly. I have more pressing things to do with my time than wait while you leisurely browse my wares.");
 }
 if ($text=~/I am ready/i) {
   quest::say("Very well. You'll need to gather up a dense hammered casing for the outer shell; a crystalline carapace will act to protect the face of the device; and it requires a fiery power source to propel the rotor mechanism. The device is then attached around the neck, much like the one you are wearing. The only difference will be the strands of living chain that will keep it from slipping from around your neck. Place those four items and your talisman in that box and return it to me. We should be able to get this thing built for you without much fuss at all, should all things go well on your end of the task, of course.");
   quest::summonitem(17278);   
 }
}

#Extra components without a trigger:
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 28278 => 1)) {
	quest::emote("takes the document from you and looks at it for a moment. 'Well, this is a beautiful looking schematic. I wonder what they are trying to make with it? Where did you get this? No wait; don't tell me. I'd rather not know. I can make some of this writing out but just barely. What I can read leads me to believe that I'd be better off not knowing.'");
	quest::emote("falls victim to his curiosity and grabs a small kit from the table behind him. 'Take this kit and look for the following parts,' he says as he scrunches his nose at the schematic again. 'We'll need a Tri-coated Metal Casing, one Size C spring, some Creeping silk strands -- whatever those are -- and some Congealed Bile-based Ooze. I'm not sure if this thing is wanting us to make a device or some sort of nasty cocktail, but that's what it's asking for... ewww!'");
quest::summonitem(17277);
	quest::say("Seal those things up in the container that I just gave you and bring it straight back to me. I'll wait here for you and see if I can decipher anymore of this schematic."); #not sure on how to check to see if the container combine works
}
if (plugin::check_handin(\%itemcount, 28283 => 1)) {
quest::say("Oh, you've returned! Very good, $name! Saria and I have made some real progress on the document that you brought us. Watch this and you'll see what I mean!");
	quest::emote("quickly opens the small case and removes the parts. He takes a tiny spanner, several small bolts, and a long wire and quickly pieces together what appears to be a small clockwork talisman. He pulls a leather string through the top of it and offers it to you.");
quest::summonitem(28284);
	quest::say("That should work for you, but from what we gathered, there's another layer of mechanics that works to shield and envelope the existing talisman. It's going to require more parts. So take this container and let me know when you're [ready] to write down the names of the next set of parts.");
quest::exp(100000);
}
if (plugin::check_handin(\%itemcount, 28289 => 1)) {
  quest::emote("once again opens the case and begins to tinker with the items. Moving ever so swiftly and gently, he changes the talisman.");
  quest::summonitem(28290);
  quest::say("take this schematic to Elder Clinka in the Plane of Tranquility. He should be able to decifer it for you.");
  quest::summonitem(28291);
  quest::exp(125000);
}
}
