# Reading an excel file using Python
import xlrd

# Give the location of the file
loc = ("C:/Users/wally/Documents/Python/Demo2/WebTours/TestSuite/WebTours_Acceptance.xlsx")

def get_excel_value(row, col):
    # To open Workbook
    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(1)

    wb.release_resources()
    obj = sheet.cell_value(int(row), int(col))
    return obj