global class CustomContactIterable implements Iterator<Contact> {
        
    List<Contact> contacts {get; set;}
    Integer i {get; set;}
    Integer maxContacts {get; set;}
    
    public CustomContactIterable(Integer numberOfContacts){
        i = 0;
    }
    
    global boolean hasNext(){
        if(i >= contacts.size()) {
          	return false;
        } else {
            return true;
    	}
    }  
    
    global Contact next(){
        if(i == maxContacts){return null;}
        i++;
        return contacts[i-1];
    }
}