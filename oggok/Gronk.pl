# Ogre warrior newbie quests

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hi dere, yuz be talking to Gronk, mez know lotz bout da krafting of arnor dat protekts our yung warriors. If yuz a [warrior] come lookeeng to make sum armorz, yuz find da right Ogre.");
  }
  if ($text=~/warrior/i) {
    quest::say("Mez tink dat yuz were. Letz begin yur traineeng. One of da furst tingz dat yuz needz to do is gather da itemz dat will be uzed in da krafteeng of da [armor] and den yuz can kraft dem in dis majikal assembly kit.");
    quest::summonitem(51377);
  }
  if ($text=~/armor/i) {
    quest::say("Da itemz you will needz to gather will be all ober da Feerrott. Dese itemz will be hard for yuz to gather, dey come from some of da meanest tings in da Feerrott. Once yuz are redy to begin, tell mez da piece dat yuz wantz to kraft and mez will give yuz da recipez dat yuz will need when making da armor. I have recipez for [Helms], [Bracers], [Sleeves], [Boots], [Legplates], [Gloves] and [Breastplate].");
  }
  if ($text=~/helm/i) {
    quest::say("A gud smert warrior wud not be widout his helm, oderwize yuz wud not be a smert warrior! Da recipe to kraft a helm... mez gotz it somewhere... Oh yes! To kraft da helm, yuz needz to gather a white lizard scale, one chunk of dark colored fungus, and a bone chip. Combine dese items in yur assembly kit to get da helm material. Once yuz got da material, den yuz need to use dis mold and smelt da material into da shape of a helm.");
    quest::summonitem(51363);
  }
  if ($text=~/bracer/i) {
    quest::say("Da bracer is da only ting dat you have sumtimz to cover yur wristz. Da wristz is bery impotent in da battle strat-a-geez dat we use in da Feerrott. If yuz want to kraft a bracer, yuz need to gather a white lizard scale, one black spider silk, and a fire beetle leg. Combine dese items in yur assembly kit to get da bracer material. Once yuz got da material, den yuz need to use dis mold and smelt da material into a bracer.");
    quest::summonitem(51365);
  }
  if ($text=~/sleeves/i) {
    quest::say("Sleevez is often hard to come by if yuz an ogre, since wez have such large armz. Dunt worry mez can teech yuz how to make some sleevez yurself, and dey will protekt yur arms gud. Furst ting, yuz need to gather a white lizard scale, one chunk of multi-colored fungus, and a piece of froglok tadpole flesh. Combine dese items in yur assembly kit to get da sleeve material. Once yuz got da material, den yuz need to use dis mold and smelt da material into a set of armplatez.");
    quest::summonitem(51364);
  }
  if ($text=~/boots/i) {
    quest::say("A gud warrior goes nowhere widout his boots! If a warrior dusnt have boots, den he not be able to travel bery far widout getting hurtz feetz. To kraft sum bootz, yuz need to gather a white lizard scale, one short lizard tail, and a tuft of giant bat fur. Combine dese items in yur assembly kit to get da boot material. Once yuz got da material, den yuz need to use dis mold and smelt da material into a set of bootz.");
    quest::summonitem(51367);
  }
  if ($text=~/legplates/i) {
    quest::say("Legplatez is prollee da most impotent armer dat yuz can get. Most of da emenies dat yuz will fight will go for da legz, widout legz, yuz become a bery easy target. Da legplates is a gud piece to have. If yuz want to kraft a legplates, yuz need to gather a white lizard scale, one brown lizard scale, and two pieces of pristine spider silk. Once yuz have dem items, yuz need to craft dem togeder in yur majikal kit to get da legplate material. When yuz got da material, yuz need to take it to da forge wit dis mold and smelt it into a gud set of legplatez.");
    quest::summonitem(51368);
  }
  if ($text=~/gloves/i) {
    quest::say("A lotz can be sed about da glovez, but yuz look like a smert Ogre, I shudnt need to tell yuz about dem all. If yuz want to kraft a gloves, yuz need to gather a white lizard scale, one spiderling silk, one green lizard talon, and one black lizard talon. Once yuz have dem items, yuz need to craft dem togeder in yur majikal kit to get da glove material. When yuz got da material, yuz need to take it to da forge wit dis mold and smelt it into a gud set of glovez.");
    quest::summonitem(51366);
  }
  if ($text=~/breastplate/i) {
    quest::say("A gud strong warrior wud not be widout his brestplate, oderwize yuz wud not be a strong warrior for long! Da recipe to kraft kraft a brestplate... Oh yes! Yuz need to gather a white lizard scale, two orange lizard scales, and one chunk of light colored fungus. Combine dese items in yur assembly kit to get da brestplate material. Once yuz got da material, den yuz need to use dis mold and smelt da material into da shape of a brestplate. After yuz maka da brestplate, mebbe me gives ya anuder [job].");
    quest::summonitem(51369);
  }
  if ($text=~/job/i) {
    quest::say("Gronk used to have girlfriend. Her name was Hermina. One day we iz sittin by da river on da big bridge. Hermina made Gronk's favorut treat, candeed lizard man brainz for da lunch. Hermina went into da water for da swim and never came back. Me looked fer her but never found her again. Gronk think dat da gaterz ate her. Huh? Me crying?! Gronk not cry! Gronk be strong! Mebbe you [help find] what happen to her?");
  }
  if ($text=~/help find/i) {
    quest::say("If you find anyting about her, I give you reward.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55206 => 1)) {
    quest::say("What be dis??! No, my preshus Hermina!!! Why dis have to happen? Huh? No, Gronk not crying!!!! Take dis weapon for da help and leave Gronk for now.");
    quest::summonitem(55207);
    quest::exp(100);
  }
}

# Quests by mystic414