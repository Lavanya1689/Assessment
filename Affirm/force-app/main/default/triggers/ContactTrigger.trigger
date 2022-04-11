trigger ContactTrigger on Contact (before insert, before update) {

    new ContactTriggerHandler(Trigger.new, Trigger.oldMap).execute();
}