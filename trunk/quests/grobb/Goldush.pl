sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hi dere, yuz look like a warrior dat cud use some decent armor, is you a [warrior]?");
  }
  
  if ($text=~/warrior/i) {
    quest::say("Dat's good, mez wudn't want to give out da sekrets of da warriors to sumone not of da clan. Dere is tons of itemz dat yuz will need to gather to craft yur armor, most of dem kan be found in da forest of Nektulos. I kan teech yuz to craft a [Helm], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets], and a [Breastplate]. Take dis kit to help make yer armor.");
    quest::summonitem(55164);
  }
  if ($text=~/helm/i) {
    quest::say("To craft Da Basher Helm, yous needs ta find is an Alligator Hide, a Ball of Pulpy Fungus, a Cracked Skeleton Skull, and a Giant Moccasin Fang. When you find dese items, put dem in yer kit and combine dem. Den take Da Basher Helm Material to da forge with dis mold to make yer new helm. It will protekt yur head gud.");
    quest::summonitem(55172);
  }
  
  if ($text=~/bracers/i) {
  quest::say("To craft Da Basher Bracer, you needs ta find a Crab Spider's Carapace, two Spiderling Silks, and a Malleable Bleeder Skin. Den you needs ta combine dese itemz in yer kit. Den take Da Basher Bracer Material to da forge with dis mold to make yer new bracer.");
    quest::summonitem(55173);
  }
  
  if ($text=~/armguards/i) {
    quest::say("To craft Da Basher Armguards, yuz need ta get Moccasin Eggs, some Bleeder Wings, Moccasin Scales, and a Kobold Talisman. When you find all dese items, put dem in yer kit and combine dem. Den take Da Basher Armguards Material to da forge with dis mold to make yer new armguards.");
    quest::summonitem(55174);
  }
  
  if ($text=~/boots/i) {
    quest::say("To craft Da Basher Boots, find a Kobold Scalp, two Chunks of Digested Earth, and an Undead Froglok Talisman. When youz find dese items, combine dem in yer kit. Den youz needs ta take Da Basher Boots Material to a forge with dis here mold ta make yer new boots.");
    quest::summonitem(55175);
  }
  
  if ($text=~/greaves/i) {
    quest::say("If youz wants ta make Da Basher Greaves, youz needs ta find a Giant Moccasin Eye, two Kobold Livers, and a Larval Carapace. After you does dat, den you needs ta take Da Basher Greaves Material to da forge with dis mold ta maker da greaves.");
    quest::summonitem(55176);
  }
  
  if ($text=~/guantlets/i) {
    quest::say("If youz wants ta make Da Basher Gauntlets to protect yer handses, den you need ta find a Bleeder's Poison Sac, Blackened Fungus, and two Bleeder Carapaces. Den youz needs ta take Da Basher Gauntlets Material to a forge with dis here mold ta make yer new Gauntlets.");
    quest::summonitem(55177);
  }
  
  if ($text=~/breastplate/i) {
    quest::say("Dis be hardest part to make. You need to find some Pristine Moccasin Scales, Burly Kobold Ears, a Pristine Bull Alligator Hide, and some Moccasin Poison. If you finds dese items, combine dem in yer kit and den take Da Basher Breastplate Material to da forge with dis mold. After you make yer breastplate, you can [help] me wit sumting.");
    quest::summonitem(55178);
  }
  
  if ($text=~/help/i) {
    quest::say("Goldush don't like da frogs in da swamp at all. You find dem and smash dem! You bring me proof you kill dem. Bring me one Pristine Froglok Eye and some Bull Alligator Spines. Youz might need ta get some other trolls ta help youz with dis. If you gives me deze items, I give you reward!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 51038 =>1, 13372 =>1  )) {
    quest::summonitem(55186);
    quest::ding();
    quest::exp(100);
  }
  
  plugin::return_items(\%itemcount);
}