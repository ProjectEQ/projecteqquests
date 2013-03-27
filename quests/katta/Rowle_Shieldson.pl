# Beer for the guards
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::signalwith(160208,100,0);
    quest::say("Sure'n this one came from Norrath, eh Tack? One wonders if'n a bottle o' one on o' the finer things in life might be in our 

future, if we were to ask politely?");
    quest::signalwith(160208,101,0);
  }
  if ($text=~/share a pint/i) {
    quest::say("That'd be great! By Brell, a short beer or a honey mead'd be a nice change from?");
    quest::signalwith(160208,102,0);
  }
  if ($text=~/trouble/i) {
    quest::emote("clears his throat and flashes a broken-toothed grin your way, 'Ye know, me dwarven heart longs for me first taste o' some underfoot brown, a reputed fine stout not available 'ere on Luclin... Ye know, if ye can manage it that is.'");
    quest::signalwith(160208,103,0);
  }
}

sub EVENT_SIGNAL {
  if ($signal == 201) {
    quest::emote("catches on slowly, 'ahhh, roight! Good show, Tack! D'ye think 'e would go te that kinda trouble fer us?'");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19967 => 1)) {
    quest::emote("takes a wee sip and smacks his lips together, proclaiming, 'Ahhh, a finer stout has never passed my lips, ' before draining the mug in one gulp. 'Yer a saint amongst us, I say. Feel free to keep 'em coming, $name!'");
    quest::exp(10000);
    quest::faction(350,10); #validus custodus
    quest::faction(168,10); #katta castellum citizens
    quest::faction(206,10); #magus conlegium
    quest::faction(228,-30); #nathyn illuminious
    quest::faction(55,-30); #coterie of the eternal night
    quest::faction(284,-30); #seru
    quest::faction(139,-30); #hand of seru
    quest::faction(96,-30); #eye of seru
    quest::faction(138,-30); #hand legionnaires
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: katta ID: 160207 NPC: Rowle_Shieldson

