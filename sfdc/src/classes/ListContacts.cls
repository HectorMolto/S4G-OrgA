global class ListContacts {
    
    global List<Contact> contacts {get; set;}
    Integer i {get; set;}
    Integer maxContacts {get; set;}
    
    public ListContacts(Integer numberContacts){
        maxContacts = numberContacts;
        contacts = getContacts();
    }
    
    public List<Contact> getContacts(){
        List<String> firstNames = getNames('firstNames');
        List<String> lastNames = getNames('lastNames');
        Integer sizeFirstNames = firstNames.size();
        Integer sizeLastNames = lastNames.size();
        List<Contact> randContacts = new List<Contact>();
        system.debug(sizeFirstNames + ' ' + sizeLastNames);
        for(i = 0; i < maxContacts; i++) {
            //Contact cnt = new Contact();
            randContacts.add(new Contact(
                FirstName = firstNames.get(randomIndex(sizeFirstNames)), 
                LastName = lastNames.get(randomIndex(sizeLastNames)))
            );
        }
    	return randContacts;
    }
    
    public List<String> getNames(String resource){
        List<String> names = new List<String>();
        StaticResource srNames = [SELECT id, body from StaticResource WHERE Name = :resource];
        String namesList = srNames.body.toString();
        return names = namesList.split('\n');   
    }
    
    public Integer randomIndex(Integer size){
        Integer rand = Math.floor(Math.random() * size - 1).intValue();
        return rand;
    }
}