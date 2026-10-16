# Employee portal UI and profile update

This update adds the HROne-inspired split login screen, staged company-email then password sign-in, an employee-first dashboard with notifications on the right, a monthly calendar with approved PL/CL days marked orange, leave-balance cards, tabbed profile sections, family-details persistence, employee document upload/download, and reordered HR handbook / payslip navigation. Monthly attendance Excel export and table-based payslip print-to-PDF remain available.

## Apply the database migration

Run the following from the project root against the same PostgreSQL database used by the server:

```bash
psql -U postgres -d hrms_db -f database/migrations/003_employee_profile_documents.sql
```

Replace `hrms_db` with the database name configured in `server/.env`. If creating a fresh database, `database/schema.sql` now also includes the two new tables. Existing installations should run the migration above.

## Employee profile documents

Employees can upload PDF, PNG, JPG, DOC/DOCX, XLS/XLSX files up to 3 MB each. Documents are stored as PostgreSQL `BYTEA` records and are only listed/downloadable by the authenticated employee who owns the record. Only upload documents that are appropriate for your organization's data-handling policy; restrict database access and use HTTPS in deployment.

## Login flow

The sign-in screen first asks for a company email. Selecting **Next** reveals the password step. Authentication is still validated by the existing API; the staged screen does not bypass password verification. Demo credentials are described in `README.md` and seeded by `npm run seed`.

## Attendance and payslips

The Attendance page has a monthly Excel download action. The Payslips page lists generated salary slips in a table; **Download PDF** opens the browser print dialog, where the user can choose **Save as PDF**. The admin payroll page generates salary slips and inserts employee notification records; notifications appear on the employee dashboard and notifications page after refresh.
