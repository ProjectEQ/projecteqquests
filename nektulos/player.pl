sub EVENT_TASK_STAGE_COMPLETE {
  if (($task_id == 154) && ($activity_id == 2)) { #Black Eggs for Breakfast Step 2
    $client->Message(15, "It looks like you made an impression on the other hunters and you won! They're more than excited about asking you along for their next hunt. Here is your prize!");
  }
}