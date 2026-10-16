# Payslip table layout update

The employee payslip view now displays salary components in structured tables suitable for print/PDF:
- Employee details and pay period table
- Earnings table: Basic salary, HRA, travel allowance, food allowance, other allowance, total earnings
- Deductions table: Income tax/TDS, provident fund, other deductions, total deductions
- Net salary payable summary
- Salary history table with generated date, payment date, gross earnings, deductions, net salary and a Print / Save as PDF action

The layout adapts to mobile screens. In the browser's print dialog, choose **Save as PDF** to save a personal payslip. Existing payroll API and database fields are reused; no schema change is needed.
