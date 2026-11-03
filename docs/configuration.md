# Declarative Configuration (built in Setup)

## Objects
Event, Client, Vendor, Venue, Feedback, Event Vendor (junction: Event <-> Vendor, two Master-Detail relationships).

## Key fields
- **Event:** Event Type (picklist), Event Date, Event Status (Planned, Confirmed, Completed, Pending Cancellation, Canceled, Rejected), Event Budget (formula by Event Type), Venue (lookup), Client (lookup)
- **Client:** Email, Phone, Address, Country, City
- **Vendor:** Service Type (multi-select), Email, Phone, Status
- **Venue:** Address, Location (URL), Capacity, Availability Status
- **Feedback:** Rating, Comments, Event (lookup, filtered by same Client), Client (lookup)

## Event Budget formula
```
CASE(TEXT(Event_Type__c),
  "Wedding", 50000, "Corporate", 30000, "Birthday", 10000, "Anniversary", 20000,
  "Festival", 60000, "Concert", 40000, "Other", 15000, 0)
```

## Validation rule (Client)
Rule: `Email_Valid_Address`
```
NOT(REGEX(Email__c, "^[a-zA-Z0-9._]+@[a-zA-Z0-9.]+\\.[a-zA-Z]{2,}$"))
```
Error message: `Please Enter Valid Email Address`

## Approval Process (Event): Event_Cancellation_Process
- Entry criteria: Event Status = Pending Cancellation
- Initial submission: email alert to the Event Coordinator role
- Step 1 "Manager Review": approver = Event Admin user
- Final approval: Event Status -> Canceled, email alert to the event owner
- Final rejection: Event Status -> Rejected, email alert to the event owner

## Record-triggered Flow: Client Reminder - 3 Days Before
- Object: Event, entry condition Event Status = Confirmed
- Scheduled path `3_Days_Before`: 3 days before Event Date
- Action: Send Email to the Client's email, CC the event owner

## Security
- Profiles: Event Admin, Event Coordinator, Vendor Manager, Client Profile
- Roles: Event Admin > Event Coordinator, Vendor Manager, Client
- Permission Set: Feedback Manager (Feedback: Read, Create, Edit, Delete), assigned to the Event Coordinator user
- OWD: Event = Private; Sharing rule `Event_Sharing_For_Vendors` (Event Coordinator -> Vendor Manager, Read Only)

## UI
- Lightning App: Event Planner (Events, Clients, Vendors, Venues, Feedbacks, Reports, Dashboards)
- Report: Upcoming Events by Month (folder: EventForce Report)
- Dashboard: EventForce Operations Dashboard (donut chart)
