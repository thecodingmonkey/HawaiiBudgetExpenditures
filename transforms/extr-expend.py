# extr-expend.py - Get subset of data from downloaded expense dataset
#                - 03/16/16, russtoku@gmail.com
#
# Columns/Fields:
#  0: Fiscal_Year
#  1: Fiscal_Period
#  2: Department
#  3: Program
#  4: Expense_Category
#  5: Fund
#  6: Vendor_Name
#  7: Vendor_Number
#  8: Payment_Number
#  9: Payment_Method
# 10: Payment_Issue_date
# 11: Payment_Status
# 12: Amount
#
# Columns of interest:
#  0: Fiscal_Year
#  2: Department
#  4: Expense_Category
# 12: Amount

import csv

with open('data/Expenditures.csv','r') as source:
    reader = csv.reader(source)
    with open('expended.csv','w') as dest:
        writer = csv.writer(dest)
        try:
            for row in reader:
                writer.writerow((row[0], row[2].strip(), row[4].strip(), row[12]))
        except csv.Error as e:
            close(dest)
            close(source)
            sys.exit(e)

