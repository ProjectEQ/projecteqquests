#Zone: Iceclad Ocean
#Short Name: iceclad
#Zone ID: 110
#
#NPC Name: Captain Nalot
#NPC ID: 110069
#Quest Status: finished
#
# items: 30047, 30008

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("squints at you through one eye, the other covered by a metallic eyepatch.");
    quest::say("Garrr. What `ave we here? Another beller yellied land blubber, eh? By the looks of ye someones mudder didn't know when ta throw a bad fish back. HAR HAR!");
  }
  if ($text=~/bad fish/i) {
    quest::say("That means I'm callin ya ugly as a piece o' whale blubber but twice as bad smellin, ya son of a water treadin $race. Yer about as smart as the slime we use ta patch our boat hull, aren't ya?");
  }
  if ($text=~/boat/i) {
    quest::say("'Arrrr. So we ain't got a boat right now. What's that got ta do with anythin'? Just cause we ain't got a boat, or a way to sail the waters, or even know how ta sail, don't mean we aren't crusty and dangerous. Just watch yerself cause we're mean.");
  }
  if ($text=~/mean/i) {
    quest::say("Thats right! We're mean, nasty, devious 'n cruel. We'll knock ya down, bite yer knees, and steal yer money. Arrr. We won't always say please and thank you either! Just remember that and don't be tryin' anyhin' funny.");
  }
  if ($text=~/funny/i) {
    quest::say("Uh, I dunno what funny stuff. No one's ever asked that one. You know, just be nice ta everyone I guess. Think ya can do that?");
  }
  if ($text=~/map/i) {
    quest::say("The map? What map? Oh wait, that thing I made ol' what's-his-name do ta get los... uh adventure. Uh, sure. If yer wantin' we've got a job for ya. If ya do it ya get ta be a real member o' me crew.");
  }
  if ($text=~/real member of your crew/i) {
    quest::say("That means ya get ta take orders from me and ya get ta use fancy words like bilge hoistin' land blubbing beller yellied, and more. Anyways, we needed a map so me lads would stop gettin' lost, but the lad I sent out ain't come back with it. I even sent out a search party but I ain't heard from them either. If ya find 'im get the map and get back 'ere.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30047 => 1)) {
    quest::emote("squints and then knocks hard on the metal half of his face to get his eye back in adjustment. 'Arrr. This is perfect. Har! Now we can be plannin' our pillagin' and plunderin' all proper like. Good work, $name!'");
    quest::emote("slaps you on the back and accidentally drops his eyepatch. Being a proper pirate now you conveniently forget to mention it to him.");
    quest::exp(50000);
    quest::summonitem(30008); # Item: Eyepatch of Plunder
  }
  plugin::return_items(\%itemcount);
}

my $shawlsignal = 0;

sub EVENT_SIGNAL {
   #quest::shout("Signal recv: $signal");
   if ($signal == 1) {
      quest::moveto(1309.1, 4591.8, 71.9, 125);
      $shawlsignal = 1;
   }
   elsif ($signal == 3) {
      quest::say("Arrrrrr what is it ye want?");
      quest::signalwith(110118, 3, 500); # NPC: General_Bragmur_
   }
   elsif ($signal == 4) {
      quest::say("Velium eh? Well there matey lets hear what you have got to say!");
      quest::signalwith(110118, 4, 500); # NPC: General_Bragmur_
   }
   elsif ($signal == 10) {
      quest::emote("scratches his head, 'Yar ya do that ya crazy Coldain.'");
      quest::moveto(1324.9, 4638.9, 73.3, 249);
   }
}

sub EVENT_WAYPOINT_ARRIVE {
   if ($shawlsignal == 1) {
      $shawlsignal = 0;
      quest::say("Hrm? Who is scuffin' around out here?");
      quest::settimer("sigone",5);
      #quest::signalwith(110118, 2, 5);
   }
}

sub EVENT_TIMER {
   if ($timer eq "sigone") {
      quest::stoptimer("sigone");
      quest::signalwith(110118, 2); # NPC: General_Bragmur_
   }
}

#END of FILE Zone: iceclad ID:110069 -- Captain_Nalot

