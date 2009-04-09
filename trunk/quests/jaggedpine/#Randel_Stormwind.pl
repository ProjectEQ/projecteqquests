#BeginFile: #Randel_Stormwind.pl
#Quest for Jaggedpine - Randel Stormwind: Jaggedpine Poacher Heads

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met, $name. This has been a very stressful time for many of us and some of
us have been kind of edgy lately. We've lived here for generations and in relative seclusion
and we enjoyed a simple life for the most part. Unfortunately, this was not to last and the
sudden [change] has left many on edge.");
  }
  if($text=~/change/i) {
    quest::say("There are a lot of people that resent the outsiders and view their presence as
corrupting our way of life. It's more then just the new guards and the sudden influx of people
though. This is sort of a long story that begins when my grandfather was just a lad. It was
during the rule of Antonius III that public [access] to the Jaggedpine Forest [was
restricted].");
  }
  if($text=~/access was restricted/i) {
    quest::say("The Protectors of the Pine became concerned when adventurers began wandering
through Jaggedpine Forest and into the Unkempt Wood. Most that did were never heard from ever
again. The residents of Surefall feared retaliation from the Unkempt for those trespassing into
their territory and Antonius smartly reasoned that if Surefall Glade were to be taken, Qeynos
would surely be next. So he declared Jaggedpine Forest and all points eastward off limits. So
it was just our ancestors that dwelled on the [Throne of Karana's Fury].");
  }
  if($text=~/Throne of Karana/i) {
    quest::say("Yes, that was what this place was called until recently but I'll get to that
part in a minute. We who acted as stewards were allowed to come and go as we pleased through
Surefall Glade. For the longest time things were peaceful. Sure, we had problems with the odd
[poacher] here or there but for the most part it was peaceful. However, trouble began when an
[outsider] snuck through Surefall Glade and entered the Unkempt Wood."); #'outsider' still needed
  }
  if($text=~/poacher/i) {
    quest::say("Yes poachers often sneak in and mindlessly kill our sacred bears for their
skins. Often they'll kill a mother bear and leave their cubs for dead. If I am able, I'll take
the cub and raise it. If I do my job well, I'm able to release the bear back into the wild once
it is old enough to fend for itself. There is one [group] of poachers I'm particularly worried
about though.");
  }
  if($text=~/group/i) {
    quest::say("They are a pair of ne'er-do-well couples that have been terrorizing the animals
recently, killing and maiming every creature they happen across. It's their sick idea of sport.
They need to be stopped. They call themselves the [Pirates of the Pine].");
  }
  if($text=~/Pirates of the Pine/i) {
    quest::say("They are a bunch of good for nothing lowlives! I would stop them myself but
sadly, I lack skill with a weapon. You on the other hand, look like you can handle yourself
pretty well. If you are able to bring these four to justice, return to me with proof. You will
be justly compensated for your efforts.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 9270 => 1, 9271 => 1, 9272 => 1, 9273 => 1)) {
    quest::say("Great Karana's blessing!! I see justice by your hand is both swift and eternal.
I would never have had the skill nor the heart to carry out these miscreant's punishment the
way you have. I'm glad to call you a friend and not an enemy. Well, I did promise just
compensation for your efforts and I'm true to my word. Please take this ring as a token of my
gratitude.");
    quest::summonitem(9226); #Sigil Ring of Jaggedpine
    quest::faction(271,10); #Residents of Jaggedpine
    quest::faction(159,10); #Jaggedpine Treefolk
    quest::faction(265,10); #Protectors of Pine
    quest::faction(135,10); #Guards of Qeynos
  }
  else {
    quest::say("I have no need of this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#EndFile: #Randel_Stormwind.pl