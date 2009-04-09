# a Sarnak Spy, Frontier Mountains
# Second part of the chardok quest, initiated by Herald Telcha
# Regal Band of Bathezid
# global RegalBandBathezid, needed to be sure players won't jump to the last part of the quest
#   at 1 : you gave the Signet of Service to the goblin traitor

sub EVENT_SAY{
  if ($RegalBandBathezid==1) { # we handed the Signet of Service yet
    if ($text=~/proceed/i){
      quest::say("Good, here then is what you must do. It's pretty simple actually and even one such as you should have no troubles. Skargus has been trading in slaves with the Iksar. He has a courier there visits the outskirts of Cabilis and sends weekly reports back to Droga. If we could get that report, Skargus would be finished. Will you go to Cabilis and [get the report]?");
    }
    if ($text=~/get the report/i) {
      quest::emote("scowls at you, clearly unimpressed by your efforts. 'Of course you'll go get the report fool, but do you think that the courier will just give to you?' The sarnak shakes his head sadly. 'Okay, look. Go into Droga and try to get a warlord's insignia off one of the goblins in there. Take this forged note to the courier I've written out, along with the insignia to Warslik's woods and give it to the courier. With luck, he'll believe you work for Skargus and give you the report. If you get the report, find Gragbar and give it to him.'");
      quest::summonitem(6471); # 6471  Forged Note to Courier
    }
  }
}

sub EVENT_ITEM{
  if (plugin::check_handin(\%itemcount,6472=>1)) { # Traitor's note, from goblin traitor
    quest::emote("reads the note slowly, turning it around in his claws a few times before completing it. 'I see you spoke with that half-wit goblin! I hate hate hate it when he sends me a note, his penmanship is almost illegible. I hope he informed you of the situation, he's really not the most dependable agent of Di'zok, and sadly his note doesn't really make much sense. No matter though, are you ready to [proceed] in this mission?'");
  }
  plugin::return_items(\%itemcount);
}

