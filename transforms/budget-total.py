# budget-total.py - Summarize budget total
#                 - 03/16/16, russtoku@gmail.com
#
# Fields:
#   0: Number
#   1: Department
#   2: Expense_Category
#   3: TotalExpense
#   4: TotalBudget
#

import csv
import decimal

decimal.getcontext().prec = 3

with open('data/MergedData.csv', 'r') as source:
    reader = csv.reader(source)
    reader.next()  # skip header row
    total = decimal.Decimal('0')
    dept_totals = {}

    try:
        for row in reader:
            dept = row[1]
            budget_amount = decimal.Decimal(row[3])
            total += budget_amount
            dept_totals[dept] = dept_totals.get(dept, 0) + budget_amount
    except csv.Error as e:
        sys.exit(e)

for dept in dept_totals:
    print "[ 'Total Budget', '%s', %d ]," % (dept, dept_totals[dept] / 1000)

