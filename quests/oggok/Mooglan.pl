sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Yuz come lookeeng to make sum armorz? Yuz come to da right place, if'n yuz be a shadowknight. Is you a [shadowknight]?");
  }
  if ($text=~/shadowknight/i) {
    quest::say("Mez tink dat yuz were. Letz begin yur traineeng. Da furst ting dat yuz needz to do is gather da itemz dat will be uzed in da krafteeng of da [armor] and den yuz can kraft dem in dis majikal assembly kit.");
    quest::summonitem(51380);
  }
  if ($text=~/armor/i) { # Made up sentence about the job, rest is real text.
    quest::say("Da itemz you will needz to gather will be all ober da Feerrott. Dese itemz will be hard for yuz to gather, dey come from some of da meanest tings in da Feerrott. Once yuz are redy to begin, tell mez da piece dat yuz wantz to kraft and mez will give yuz da recipez dat yuz will need when making da armor. I have recipez for [Helm], [Bracers], [Sleeves], [Boots], [Legplates], [Gloves] and [Breastplate].  Once yuz done wit da armorz, mez hab a job fer yuz, if I can [trust] yuz.");
  }
  if ($text=~/helm/i) {
    quest::say("Da helm iz da most impotent piece to get, since it protekt da smertest part of da body. To kraft da helm, yuz needz to gather a pristine lizard scale, one chunk of light colored fungus, and two spider legs, and kraft dem into dis here majikal assembly kit to get yur helm material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud helm.");
    quest::summonitem(51370);
  }
  if ($text=~/bracer/i) {
    quest::say("Da bracer is a gud piece to have. If yuz want to kraft a bracer, yuz need to gather a pristine lizard scale, two bone chips, and a pristine spider silk, and kraft dem into dis here majikal assembly kit to get yur bracer material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud bracer.");
    quest::summonitem(51372);
  }
  if ($text=~/sleeves/i) {
    quest::say("Da sleeves is also a importent piece or armer, one dat will serve yuz well if yuz decide to make some. If yuz want to kraft a sleeves, yuz need to gather a pristine lizard scale, one long lizard tail, and a chunk of dark colored fungus, and kraft dem into dis here majikal assembly kit to get yur armplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud set of sleeves.");
    quest::summonitem(51371);
  }
  if ($text=~/boots/i) {
    quest::say("Da boots is a gud piece to have, dey is gud for trompin around in da Feerrott and even gud for skweeshing da big bugs dat lives out dere. If yuz want to kraft a boots, yuz need to gather a pristine lizard scale, two spiderling silks, and a giant bat wing, and kraft dem into dis here majikal assembly kit to get yur boot material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud set of boots.");
    quest::summonitem(51374);
  }
  if ($text=~/legplates/i) {
    quest::say("Wez Ogre have big legz, which make big targets for da enemies, so itz a gud ting to protekt dem as best you can. To kraft some legplates, yuz need to gather two pristine lizard scales, one black spider silk, and one chunk of multi-colored fungus, and kraft dem into dis here majikal assembly kit to get yur legplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into some gud legplates.");
    quest::summonitem(51375);
  }
  if ($text=~/gloves/i) {
    quest::say("We also have big handz, which makes dem very easy to get hurt in da battles, so it also be a good idea to protekt dem too. If yuz want to kraft a gloves, yuz need to gather a pristine lizard scale, one black lizard scale, and one spiderling silk, and kraft dem into dis here majikal assembly kit to get yur gloves material. Den yuz take dat material and dis mold to a forge and smelt dem together into a some gud gloves.");
    quest::summonitem(51373);
  }
  if ($text=~/breastplate/i) {
    quest::say("Da brestplate is a gud piece to have, it protektz yuz from all da beatingz dat you get if you fight in da Feerrott. If yuz want to kraft a brestplate, yuz need to gather two pristine lizard scales, one black lizard scale, and four black spider silks, and kraft dem into dat there majikal assembly kit to get yur brestplate material. Den yuz take dat material and dis mold to a forge and smelt dem together into a gud breastplate.");
    quest::summonitem(51376);
  }
  if ($text=~/trust/i) {
    quest::say("Sumbudy make Mooglan angry. No one make me angry and live. You go into da jungle and find me four jungle spider venom sacs. Me want to make da poison to kill dis person! Dis be secret. You not tell anybody! If you do dis for me, I give you a reward. Now go!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55210 => 4)) {
    quest::say("Dis be good. You do a great evil work on dis day. Take dis weapon.");
    quest::summonitem(55211);
    quest::exp(100);
  }
  else {
    quest::say("I not needz dis."); # text made up
    plugin::return_items(\%itemcount);
  }
}

# Quests by mystic414