# Test Cases and Results

| ID | Feature | Steps | Expected result | Actual result | Status | Evidence |
|---|---|---|---|---|---|---|
| TC01 | Validation rule | Create a Client with Email `test-client@gmail.com` | Error: Please Enter Valid Email Address | Error shown, record not saved | Pass | [screenshot](../09-Testing-Results-and-Conclusion/screenshots/TC01_validation_rule_invalid_email_error.png) |
| TC02 | Apex trigger: PreventDoubleBooking | Create an Event at Grand Palace Hall on 11/20/2026 (already booked) | Error: This Venue is already booked on this date. | Error shown, record not saved | Pass | [screenshot](../09-Testing-Results-and-Conclusion/screenshots/TC02_double_booking_error.png) |
| TC03 | Apex trigger: venue status | Open Grand Palace Hall (Sharma Wedding is Confirmed) | Availability Status = Reserved | Reserved | Pass | [screenshot](../09-Testing-Results-and-Conclusion/screenshots/TC03_venue_reserved_on_confirmed_event.png) |
| TC04 | Approval Process | Set Pongal Celebration to Pending Cancellation, submit, approve | Approval History = Approved, Event Status = Canceled | Approved and Canceled | Pass | [submit](../09-Testing-Results-and-Conclusion/screenshots/TC04a_submit_for_approval.png), [approve](../09-Testing-Results-and-Conclusion/screenshots/TC04b_approve_event.png), [history](../09-Testing-Results-and-Conclusion/screenshots/TC04c_approval_history_approved.png), [status](../09-Testing-Results-and-Conclusion/screenshots/TC04d_event_status_canceled.png) |
| TC05 | Scheduled Apex | Setup > Scheduled Jobs | Daily Event Completion job scheduled (8 PM) | Job listed, next run scheduled | Pass | [screenshot](../09-Testing-Results-and-Conclusion/screenshots/TC05_scheduled_job.png) |

Additional checks: Event Budget formula shows $50,000 for a Wedding; the report and dashboard show upcoming events grouped by month.
