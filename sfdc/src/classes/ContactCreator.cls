global class ContactCreator implements Database.Batchable<sObject> {
    
    global integer numberContacts {get; set;}
    
    global List<Contact> start(Database.BatchableContext bc) {
        ListContacts cnt = new ListContacts(numberContacts);
        return cnt.contacts;
    }
    
    global void execute(Database.BatchableContext bc, List<Contact> scope) {
        insert scope;
    }

    global void finish(Database.BatchableContext bc) {
        
    }
}