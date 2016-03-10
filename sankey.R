library(readr)
library(rCharts)

budget_data = readr::read_csv("MergedData.csv")
expense = data.frame(
  source = budget_data$Department,
  target = budget_data$Expense_Category,
  value = budget_data$TotalExpense
)
budget = data.frame(
  source = budget_data$Department,
  target = budget_data$Expense_Category,
  value = budget_data$TotalBudget
)

sankeyPlot <- rCharts$new()
sankeyPlot$setLib('http://timelyportfolio.github.io/rCharts_d3_sankey/libraries/widgets/d3_sankey')
sankeyPlot$set(
  data = expense,
  nodeWidth = 15,
  nodePadding = 10,
  layout = 32,
  width = 700,
  height = 2500,
  units = "points"
)
sankeyPlot