package spacerep;

class ReminderData implements ModuleData {
    @:semi var reminder(get, set): Reminder;
    @:semi var cardData(get, set): CardData;

    @:perm var history(get, null): Persistent<ReminderHistory>;
    @:perm var scheduler(get, null): Persistent<ReminderScheduler>;
}

// Local Variables:
// haxe-module: "hx_spacerep"
// End:
