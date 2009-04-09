# Earring of Veracity #1 (Insignia)
# Sanctus Seru : torsten reidan
# Marus Seru : reothe
# Netherbian Lair : Legionnaire Dalini, spawned Bregun Dorey

sub EVENT_SAY{
  if ($text=~/hail/i){
    quest::say("Oh, hello there. Sorry I didn't notice you before I was thinking of an [old friend]. This used to be his room. I guess no one else has been assigned to these quarters.");
  }
  if ($text=~/old friend/i) {
    quest::say("His name was Bregun Dorey. What a funny little halfling he was. He had a good heart and worked hard. That is up until one day he just started acting odd, very nervous like he was hiding something. Then all he would talk about was Bixie Treats and then show off some weird heirloom charm bracelet. His time for the question came and due to his odd behavior he was sent to Marus Seru. I sure wish I knew how he was doing.");
  }
}
sub EVENT_ITEM{
  # receive bixie charm
  if (plugin::check_handin(\%itemcount,29852=>1)) {
    quest::say("Bregun is still alive!? Amazing, I thought in his fragile state he wouldn't last long in Marus Seru or the Lair of the Netherbians for that matter. Here, before anyone hears us talking, take this note to him. I believe he was onto something big and I must know what it was.");
    quest::summonitem(29853); # 29853    Sealed Note to Bregun
  }
  # receive bregun's directions
  if (plugin::check_handin(\%itemcount,29854=>1)) {
    quest::emote("pulls out a hollow book entitled 'A Detailed Look at Etiquette and Proper Grammar' and opens it to find a journal placed inside.");
    quest::say("This is astounding. The information in this journal is invaluable and must be brought to the others' attention. Take this insignia. When you are ready to help us further seek out Euzan Jurek, tell him you were sent by me, and he will tell you what you can do to further our cause. I can not tell you more than this, but keep the insignia close to you for now.");
    quest::summonitem(29857); # 29857    Insignia Earring of Veracity
    quest::faction(350,10); # Validus Custodus
    quest::faction(168,10); # Katta Castellum Citizens
    quest::faction(206,10); # Magus Conlegium
    quest::faction(228,-30); # Nathyn Illuminious
    quest::faction(55,-30); # Coterie of the Ethernal Night
    quest::faction(284,-30); # Seru
    quest::faction(139,-30); # Hand of seru
    quest::faction(96,-30); # Eye of seru
    quest::faction(138,-30); # Hand legionnaries
  }
  
  plugin::return_items(\%itemcount);
}

