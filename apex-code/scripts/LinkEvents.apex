// Links imported sample Events to their Venue and Client (Data Import Wizard cannot map custom lookups)
Map<String, List<String>> m = new Map<String, List<String>>{
  'Sharma Wedding' => new List<String>{'Grand Palace Hall','Rahul Sharma'},
  'TechNova Annual Meet' => new List<String>{'Sunrise Convention Center','TechNova Solutions'},
  'Aarav Birthday Bash' => new List<String>{'Heritage Garden','Priya Nair'},
  'Silver Jubilee Anniversary' => new List<String>{'Royal Orchid Banquet','Karthik Raman'},
  'Winter Music Fest' => new List<String>{'City Lights Auditorium','Sneha Iyer'},
  'New Year Gala' => new List<String>{'Skyline Rooftop','Vikram Singh'},
  'Pongal Celebration' => new List<String>{'Green Valley Farmhouse','Meena Krishnan'},
  'Startup Founders Summit' => new List<String>{'Orchid Conference Hall','Arjun Mehta'},
  'Beach Wedding Reception' => new List<String>{'Pearl Beach Resort','Divya Reddy'},
  'Alumni Meet 2026' => new List<String>{'Lakeview Resort','Ananya Das'}
};
Map<String, Id> venues = new Map<String, Id>();
for (Venue__c v : [SELECT Id, Name FROM Venue__c]) venues.put(v.Name, v.Id);
Map<String, Id> clients = new Map<String, Id>();
for (Client__c c : [SELECT Id, Name FROM Client__c]) clients.put(c.Name, c.Id);
List<Event__c> evs = [SELECT Id, Name FROM Event__c WHERE Name IN :m.keySet()];
for (Event__c ev : evs) {
  ev.Venue__c = venues.get(m.get(ev.Name)[0]);
  ev.Client__c = clients.get(m.get(ev.Name)[1]);
}
update evs;
