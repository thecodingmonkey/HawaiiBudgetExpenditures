# extr-budget.py - Get subset of data from downloaded expense dataset
#                - 03/16/16, russtoku@gmail.com
#
# Columns/Fields:
#  0: Fiscal Year
#  1: Department
#  2: sub-deparment
#  3: Program
#  4: Expense Category
#  5: Recommended Amount
#  6: approvedAmount
#  7: Fund
#  8: Fund Type
#  9: Description
# 10: Expense Type
#
# Columns of interest:
#  0: Fiscal_Year
#  1: Department
#  6: approvedAmount
#  8: Fund
# 10: Expense Type

import csv

with open('data/budget.csv', 'r') as source:
    reader = csv.reader(source)
    with open('budgeted.csv','w') as dest:
        writer = csv.writer(dest)
        try:
            for row in reader:
                writer.writerow((row[0], row[1].strip(), row[6], row[8].strip(), row[10].strip()))
        except csv.Error as e:
            close(dest)
            close(source)
            sys.exit(e)

