package spacerep;


class ReminderData implements ModuleData {
    @:perm var reminder(get, set): Persistent<Reminder>;
    @:semi var card_data(get, set): CardData;

    @:perm var history(get, never): Persistent<ReminderHistory>;
    @:perm var scheduler(get, never): Persistent<ReminderScheduler>;
}

// Local Variables:
// haxe-module: "hx_spacerep"
// End:
