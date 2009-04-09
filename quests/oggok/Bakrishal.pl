sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Whats do yuz wants? Yuz come to mez to lern bout speshul armorz? If'n yuz ar a Beastlord, yuz kan lern to kraft yur own armor, yuz just needz da recipe. Ar yuz a [Beastlord]?");
  }
  if($text=~/beastlord/i){
    quest::say("Mez tink dat yuz were. Letz begin yur traineeng. Da furst ting dat yuz needz to do is gather da itemz dat will be uzed in da krafteeng of da [armor] and den yuz can kraft dem in dis majikal assembly kit.");
    # Summon Assembly Kit of Scale
    quest::summonitem(51379);
  }
  if($text=~/armor/i){
    quest::say("Da itemz you will needz to gather will be all ober da Feerrott. Dese itemz will be hard for yuz to gather, dey come from some of da meanest tings in da Feerrott. Once yuz are redy to begin, tell mez da piece dat yuz wantz to kraft and mez will give yuz da recipez dat yuz will need when making da armor. I have recipez for [Caps], [Bracers], [Sleeves], [Boots], [Leggings], [Gloves] and [Tunics].");
  }
  if($text=~/sleeves/i){
    quest::say("Da sleeves is gud to get, yuz can never be too protektive of yur body, and da armz is whut you needz to do all yur huntin. If yuz want to kraft a sleeves, yuz need to gather one yellow lizard scale, a long lizard tail, and one large snake skin, den yuz combine dem together in yur magikal assembly kit to create da material yuz needz. Once yuz have da material, den you take it to a loom wit dis pattern and create yur sleeves.");
    # Summon: Armband Pattern of Scale
    quest::summonitem(51357);
  }
  if($text=~/boots/i){
    quest::say("Da bootz is someting dat you needz to wear often, specially when in da Feerrott, yuz never know when yuz might step in a surprize dat one o' da lizzies in dere might leeve for yuz. If yuz want to kraft a boots, yuz need to gather one yellow lizard scale, a ruined wolf pelt, and two black spider silks, den yuz combine dem together in yur magikal assembly kit to create da material yuz needz. Once yuz have da material, den you take it to a loom wit dis pattern and create yur boots.");
    # Summon: Boot Pattern of Scale
    quest::summonitem(51360);
  }
  if($text=~/bracers/i){
    quest::say("Da bracer is one o da best itemz dat you can kraft, it protekts yur wrists from da harsh blows dey normally get fightin in da Feerrott. If yuz want to want to kraft a bracer, yuz need to gather one yellow lizard scale, two bone chips, and one piece of light colored fungus, den yuz combine dem in yur magikal assembly kit to create da material yuz needz. Once yuz have da material, den you take it to a loom wit dis pattern and create yur bracer.");
    # Summon: Bracer Pattern of Scale
    quest::summonitem(51358);
  }
  if($text=~/tunics/i){
    quest::say("Da tunic is a gud piece to have, it protektz yuz from all da beatingz dat you get if you fight in da Feerrott. If yuz want to kraft a tunic, yuz need to gather one yellow lizard scale, two pristine lizard scales, one long lizard tail, and two black spider silks, and kraft dem into dis here majikal assembly kit to get yur tunic material. Den yuz take dat material to a loom wit dis pattern to make da tunic. After you make da armor, I have sumting else for you if you tink you [strong] enuff.");
    # Summon: Breastplate Pattern of Scale
    quest::summonitem(51362);
  }
  if($text=~/gloves/i){
    quest::say("Da glovez is also someting dat you want to get as soon as yuz can. Da fingerz is whut we use to keep us alive, witout dem, wez wud be in truble. If yuz want to kraft a gloves, yuz need to gather one yellow lizard scale, two spiderling silks, and two pristine lizard talons, den yuz combine dem together in yur magikal assembly kit to create da material yuz needz. Once yuz have da material, den you take it to a loom wit dis pattern and create yur gloves.");
    # Summon: Gauntlet Pattern of Scale
    quest::summonitem(51359);
  }
  if($text=~/caps/i){
    quest::say("Always gud to protekt yur nogginz, To kraft da cap, yuz needz to gather one yellow lizard scale, one piece of dark colored fungus, two pristine spider silks an combine dem in yur assembly kit. Once yuz got da material, yuz can take it to a loom and weave dem together with dis pattern to craft a cap to protekt yur hed.");
    # Summon: Helm Pattern of Scale
    quest::summonitem(51356);
  }
  if($text=~/leggings/i){
    quest::say("Da leggingz is almost da most impotent item dat you can kraft, and dey offer much protekshun. If yuz want to kraft a leggings, yuz need to gather one yellow lizard scale, one long lizard tail, and two pristine lizard talons, den yuz combine dem together in yur magikal assembly kit to create da material yuz needz. Once yuz have da material, den you take it to a loom wit dis pattern and create yur leggingz.");
    # Summon: Legging Pattern of Scale
    quest::summonitem(51361);
  }
  if($text=~/strong/i){
    quest::say("In da jungle dere be many dangerus beasts. You show you strong. You show you have power. Find da tree snakes and bring me four of dere fangs. You do this and I reward you.");
  }
}

sub EVENT_ITEM {
  # Handin: Tree Snake Fang
  if(plugin::check_handin(\%itemcount, 55212 => 4)){
    quest::say("Guud job! Here da reward me promised you $name.");
    # Summon: Bakrishal's Scaled Claws
    quest::summonitem(55213);
  }
}


