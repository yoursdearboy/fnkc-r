library(tidyverse)


# Боксплот
#
# * data - данные
# * group - группа по оси X
# * numbers - значения по оси Y
#
# * lim - минимальное и максимальное значение на оси Y, можно поставить NA
# * breaks - черточки на оси Y
#
# * labs - подписи
# * base_size - размер текста
# * width - ширина сохраняемого графика
# * height - высота сохраняемого графика

plot_data <- data

ggplot(plot_data, aes(x = group, y = numbers)) +
  geom_boxplot() +
  scale_y_continuous(lim = c(-3, 3), breaks = c(-3, -2, -1, 0, 1, 2, 3)) +
  labs(
    x = "Подпись оси X",
    y = "Подпись оси Y"
  ) +
  theme_classic(base_size = 13)

ggsave("plot.png", width = 4, height = 5)


# Тест Манна-Уитни
#
# * data - данные
# * group - группа
# * numbers - значения

wilcox.test(numbers ~ group, data)


# Тест Манна-Уитни для всех пар
#
# * data - данные
# * group - группа
# * numbers - значения
# * p.adjust.method - поправка (none - нет, holm - Бонферрони-Холма, fdr - False Discovery Rate)

pairwise.wilcox.test(data$numbers, data$group, p.adjust.method = "holm")
pairwise.wilcox.test(data$numbers, data$group, p.adjust.method = "none")
