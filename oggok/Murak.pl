# items: 51378, 51349, 51351, 51350, 51353, 51354, 51352, 51355, 55208, 55209
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Yuz be a shaman, yes? Gud, mez have many tings to teach yuz, yuz have lots of training still. Da first ting we haz to work on is teeching yuz to make some armor. If yuz a [shaman], mez can teech you da ways of our class.");
  }
  if ($text=~/shaman/i) {
    quest::say("Mez tink dat yuz were. Letz begin yur traineeng. Da furst ting dat yuz needz to do is gather da itemz dat will be uzed in da krafteeng of da [armor] and den yuz can kraft dem in dis majikal assembly kit.");
    quest::summonitem(51378); # Item: Assembly Kit of Protection
  }
  if ($text=~/armor/i) {
    quest::say("Da itemz you will needz to gather will be all ober da Feerrott. Dese itemz will be hard for yuz to gather, dey come from some of da meanest tings in da Feerrott. Once yuz are redy to begin, tell mez da piece dat yuz wantz to kraft and mez will give yuz da recipez dat yuz will need when making da armor. I have recipez for [Helms], [Bracers], [Sleeves], [Boots], [Legplates], [Gloves] and [Breastplate].");
  }
  if ($text=~/helm/i) {
    quest::say("Oh! Yuz be a smert ogre, dat yuz are! Protektshun for dat hed of yurz be bery impotent! If yuz want to kraft da helm, yuz needz to gather an orange lizard scale, one chunk of dark colored fungus, and one short lizard tail. Once yuz have dem items, yuz need to craft dem togeder in yur majikal kit to get da helm material. When yuz got da material, yuz need to take it to da forge wit dis mold and smelt it into a gud helm.");
    quest::summonitem(51349); # Item: Helm Mold of Protection
  }
  if ($text=~/bracer/i) {
    quest::say("Da bracer is a gud piece to have. If yuz want to kraft a bracer, yuz need to gather an orange lizard scale, a fire beetle leg, two metal bits, and a flask of water. Once yuz have dem items, yuz need to craft dem togeder in yur majikal kit to get da bracer material. When yuz got da material, yuz need to take it to da forge wit dis mold and smelt it into a gud bracer.");
    quest::summonitem(51351); # Item: Bracer Mold of Protection
  }
  if ($text=~/sleeves/i) {
    quest::say("Da sleeves is a gud piece to have, speshully if yuz fight tings dat are taller den da knee. If yuz want to kraft a sleeves, yuz need to gather an orange lizard scale, one long lizard tail and a black lizard talon. Once yuz have dem items, yuz need to craft dem togeder in yur majikal kit to get da armplate material. When yuz got da material, yuz need to take it to da forge wit dis mold and smelt it into a gud set of armplatez.");
    quest::summonitem(51350); # Item: Armplate Mold of Protection
  }
  if ($text=~/boots/i) {
    quest::say("Da boots is a gud piece to have. If yuz want to kraft a boots, yuz need to gather an orange lizard scale, one green lizard scale, and wun giant bat fur. Once yuz have dem items, yuz need to craft dem togeder in yur majikal kit to get da boot material. When yuz got da material, yuz need to take it to da forge wit dis mold and smelt it into a gud set of bootz.");
    quest::summonitem(51353); # Item: Boot Mold of Protection
  }
  if ($text=~/legplates/i) {
    quest::say("Legplatez is prollee da most impotent armer dat yuz can get. Most of da emenies dat yuz will fight will go for da legz, widout legz, yuz become a bery easy target. Da legplates is a gud piece to have. If yuz want to kraft a legplates, yuz need to gather two orange lizard scales, one black spider silk, and one pristine spider silk. Once yuz have dem items, yuz need to craft dem togeder in yur majikal kit to get da legplate material. When yuz got da material, yuz need to take it to da forge wit dis mold and smelt it into a gud set of legplatez.");
    quest::summonitem(51354); # Item: Legplate Mold of Protection
  }
  if ($text=~/gloves/i) {
    quest::say("Fingerz must be protekted at all timez, if yuz looze a finger, yuz kant weild weaponz as gud anymore, and dat wud not be a good ting. If yuz want to kraft a gloves, yuz need to gather an orange lizard scale, one brown lizard talon, and one green lizard talon. Once yuz have dem items, yuz need to craft dem togeder in yur majikal kit to get da glove material. When yuz got da material, yuz need to take it to da forge wit dis mold and smelt it into a gud pair of glovez.");
    quest::summonitem(51352); # Item: Gauntlet Mold of Protection
  }
  if ($text=~/breastplate/i) {
    quest::say("Da breastplate is da most protektive armer yuz can get, but iz also da most impotent one if yuz plan on fighting in da army. If yuz want to kraft a tunic, yuz need to gather two orange lizard scales, one yellow lizard scale, and three pristine spider silks. Once yuz have dem items, yuz need to craft dem togeder in yur majikal kit to get da brestplate material. When yuz got da material, yuz need to take it to da forge wit dis mold and smelt it into a gud brestplate. After yuz make da breastplate mebbe me give you anuder [job].");
    quest::summonitem(51355); # Item: Breastplate Mold of Protection
  }
  if ($text=~/job/i) {
    quest::say("I been making necklace for ceremony. Me needs four more tings to finish it. If yuz could find four lizardman mystic scales, I give you a reward.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55208 => 4)) {
    quest::say("Dese gud and shiny. Here be your reward. Gud luck.");
    quest::summonitem(55209); # Item: Murak's Staff of Protection
    quest::exp(100);
  }
}

# Quests by mystic414