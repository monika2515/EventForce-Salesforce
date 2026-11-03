// Creates 10 sample Feedback records linked to Event and Client
List<List<String>> rows = new List<List<String>>{
  new List<String>{'5','Beautiful venue and smooth coordination.','Sharma Wedding','Rahul Sharma'},
  new List<String>{'4','Well organised corporate meet.','TechNova Annual Meet','TechNova Solutions'},
  new List<String>{'5','Kids loved the decoration.','Aarav Birthday Bash','Priya Nair'},
  new List<String>{'4','Food was excellent, sound could be better.','Silver Jubilee Anniversary','Karthik Raman'},
  new List<String>{'3','Event was canceled, refund took time.','Winter Music Fest','Sneha Iyer'},
  new List<String>{'5','Great lighting and music for the gala.','New Year Gala','Vikram Singh'},
  new List<String>{'4','Traditional setup was lovely.','Pongal Celebration','Meena Krishnan'},
  new List<String>{'5','Perfect venue for the summit.','Startup Founders Summit','Arjun Mehta'},
  new List<String>{'4','Sea view was amazing.','Beach Wedding Reception','Divya Reddy'},
  new List<String>{'5','Great alumni turnout and service.','Alumni Meet 2026','Ananya Das'}
};
Map<String, Id> events = new Map<String, Id>();
for (Event__c e : [SELECT Id, Name FROM Event__c]) events.put(e.Name, e.Id);
Map<String, Id> clients = new Map<String, Id>();
for (Client__c c : [SELECT Id, Name FROM Client__c]) clients.put(c.Name, c.Id);
List<Feedback__c> fbs = new List<Feedback__c>();
for (List<String> r : rows) {
  fbs.add(new Feedback__c(Rating__c = r[0], Comments__c = r[1], Event__c = events.get(r[2]), Client__c = clients.get(r[3])));
}
insert fbs;
