sub EVENT_SAY {
  $InInstanceVxed = quest::GetInstanceID("vxed",0);
  $InInstanceTipt = quest::GetInstanceID("tipt",0);
  $InInstanceSnplant = quest::GetInstanceID("snplant",0);
  $InInstancePlant = quest::GetInstanceID("snplant",1);
  $InInstanceLair = quest::GetInstanceID("snlair",0);
  $InInstanceCrematory = quest::GetInstanceID("sncrematory",0);
  $InInstancePool = quest::GetInstanceID("snpool",0);
  if ($text=~/hail/i) {
      if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 1) {
         quest::say("Nice work, speak to the High Priest to continue.");
         quest::say("Do you need to leave an [instance]?");
         quest::setglobal("sewers",2,5,"F");
         $client->Message(4,"You receive a character flag!"); 
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 2  && $qglobals{sewers} == 2) {
         quest::say("Nice work, speak to the High Priest to continue.");
         quest::say("Do you need to leave an [instance]?");
         quest::setglobal("sewers",3,5,"F");
         $client->Message(4,"You receive a character flag!"); 
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 2) {
         quest::say("Thank you for assisting in the Crematory, please visit the Plant to advance.");
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 3  && $qglobals{sewers} == 3) {
        quest::say("Nice work, speak to the High Priest to continue.");
        quest::say("Do you need to leave an [instance]?");
        quest::setglobal("sewers",4,5,"F");
        $client->Message(4,"You receive a character flag!"); 
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 3) {
         quest::say("Thank you for assisting in the Lair, please visit the Plant to advance.");
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 3  && $qglobals{sewers} == 2) {
         quest::say("Thank you for assisting in the Lair, please visit the Crematory to advance.");
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4  && $qglobals{sewers} == 5) {
         quest::say("Nice work, the path to vxed is open, speak with Apprentice Udranda.");
         quest::setglobal("god_vxed_access",1,5,"F");
         $client->Message(4,"You receive a character flag!"); 
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4  && $qglobals{sewers} == 4) {
         quest::say("Nice work, the path to vxed is open, speak with Apprentice Udranda.");
         quest::setglobal("god_vxed_access",1,5,"F");
         $client->Message(4,"You receive a character flag!"); 
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4) {
         quest::say("Thank you for assisting in the Pool, please visit the Plant to advance.");
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4  && $qglobals{sewers} == 2) {
         quest::say("Thank you for assisting in the Pool, please visit the Crematory to advance.");
      }
      elsif (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4  && $qglobals{sewers} == 3) {
         quest::say("Thank you for assisting in the Pool, please visit the Lair to advance.");
      }
else {
  quest::say("Please speak with the High Priest if you desire to assist");
  quest::say("Do you need to leave an [instance]?");
     }
}
if (($text=~/instance/i) && ($InInstanceTipt > 0)) {
    quest::DestroyInstance($InInstanceTipt);
    quest::say("Tipt Instance Destroyed");
    }
if (($text=~/instance/i) && ($InInstanceVxed > 0)) {
    quest::DestroyInstance($InInstanceVxed);
    quest::delglobal($InInstanceVxed.'_vxed_status');
    quest::say("Vxed Instance Destroyed");
    }
if (($text=~/instance/i) && ($InInstanceSnplant > 0)) {
    quest::DestroyInstance($InInstanceSnplant);
    quest::say("Plant Instance Destroyed");
    }
if (($text=~/instance/i) && ($InInstancePlant > 0)) {
    quest::DestroyInstance($InInstancePlant);
    quest::say("Plant Instance Destroyed");
    }
if (($text=~/instance/i) && ($InInstanceLair > 0)) {
    quest::DestroyInstance($InInstanceLair);
    quest::say("Lair Instance Destroyed");
    }
if (($text=~/instance/i) && ($InInstanceCrematory > 0)) {
    quest::DestroyInstance($InInstanceCrematory);
    quest::say("Crematory Instance Destroyed");
    }
if (($text=~/instance/i) && ($InInstancePool > 0)) {
    quest::DestroyInstance($InInstancePool);
    quest::say("Pool Instance Destroyed");
    }
}