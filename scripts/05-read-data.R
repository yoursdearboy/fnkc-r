# Импорт Excel файла
#
# * path - путь до файла
# * sheet - лист
# * range - диапазон ячеек

data <- readxl::read_excel(
  path = "data.xlsx",
  sheet = "Лист 1",
  range = "A1:F30"
)


# Определение списка допустимых значений для столбца
#
# * column1 - название столбца
# * levels - список значений

data$column1 <- factor(data$column1, levels = c("Вариант 1", "Вариант 2", "Вариант 3"))


# Проверка

summary(data)
str(data)
