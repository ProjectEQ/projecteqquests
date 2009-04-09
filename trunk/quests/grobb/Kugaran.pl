sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Whut yoo want from Kugaran! Unless yoo [Shadowknight] yoo leave me alone.");
  }
  
  if ($text=~/shadowknight/i) {
    quest::say("I don't know if I should trust yoo but I suppose I can let yoo prove yerself. If yoo are [interested] in helping me wit gadaring some tings and [creating yer own armor] yoo let Kugaran know.");
  }
  
  if ($text=~/creating my own armor/i) {
    quest::say("Well den I guess we get started. Dere isn't much to tell besides dat yoo will have to go out and collect [various items] fer yer armor materials. First tings first go ahead and take yer assembly kit now, it is in here dat yoo will put da items yoo collect to make yer armor material. Once yoo have da material yoo can use it wit da right mold I gib yoo to make yer armor.");
    quest::summonitem(61096);
  }
  
  if ($text=~/various items/i) {
    quest::say("Dere are lots of tings yoo will need. Once yoo are ready I can gib yoo da mold fer Dark Basher's [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates]. When yoo are ready to make a piece yoo tell me which piece you [wish to craft] and I gib yoo da right mold.");
  }
  
  if ($text=~/helm/i) {
    quest::say("To create yer helm material yoo will need to combine 2 small bricks of ore, a giant snake rattle, and a fungus clump in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Helm.");
    quest::summonitem(22610);
  }
  
  if ($text=~/bracers/i) {
    quest::say("To create yer Bracer material yoo will need to combine 1 Brick of Crude Bronze, 2 Snake Scales, 1 Ruined Bear Pelt and 1 Bottle in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Bracer.");
    quest::summonitem(22611);
  }
  
  if ($text=~/armguards/i) {
    quest::say("To create yer armguard material yoo will need to combine 1 small bricks of ore, 2 snake fangs and spiderling legs in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Armguards.");
    quest::summonitem(22613);
  }
  
  if ($text=~/boots/i) {
    quest::say("To create yer boot material yoo will need to combine 3 Bricks of Crude Bronze, 1 Giant Wood Spider Femur, 1 Shadow Wolf Pelt and 1 Ration in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Boots.");
    quest::summonitem(22612);
  }
  
  if ($text=~/greaves/i) {  
    quest::say("To create yer greaves material yoo will need to combine 4 Bricks of Crude Bronze, 2 Ruined Wolf Pelts, 1 Fire Beetle Leg and 1 Mead in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Greaves.");
    quest::summonitem(22614);
  }
  
  if ($text=~/gauntlets/i) {
    quest::say("To create yer gauntlets material yoo will need to combine a Small Mosquito Wing, a Large Snake Skin, two Zombie Skins, and one Small Brick of Ore in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Gauntlets.");
    quest::summonitem(22615);
  }
  
  if ($text=~/breastplate/i) {
    quest::say("To create yer breastplate material yoo will need to combine 5 Bricks of Crude Bronze, 1 Calcified Sternum, 1 Zombie Skin, 1 Halfling Ribcage, 1 Spider Legs and 1 Orc Skull in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Breastplate. Return to me for one [final task] I have to ask of yoo after yoo have completed yer breastplate.");
    quest::summonitem(22616);
  }
  
  if ($text=~/final task/i) {
    quest::say("Da task is to get me a few [important items] that I need for me studies. If yoo go get dem I give you nice shiny ting.");
  }
  
  if ($text=~/important items/i) {
    quest::say("Me needs 1 Burned Out Lightstone, 1 Halfling Clavicle and 2 Cracked Helms of the Lifebringer. Bring me these tings and I give yoo nice reward.");
  }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 19578 => 1, 10299 => 1, 22601 => 2)) {
   quest::summonitem(61101);
   quest::ding();
   quest::exp(100);
 } 
 plugin::return_items(\%itemcount);
}