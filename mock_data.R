data_1 <- read.table("mock_data_1.txt",header = TRUE)
data_2 <- read.table("mock_data_2.txt",header = TRUE)
data_3 <- read.table("mock_data_3.txt",header = TRUE)

data <- cbind(data_1,data_2,data_3)
data_long <- data %>%
  pivot_longer(cols = c("Group1","Group2","Group3"),
               names_to = "Group",
               values_to = "Value")
data_long$Group <- as.factor(data_long$Group)
str(data_long)
ggplot(data = data_long,
       mapping = aes(x = Group,y = Value, color = Group)) +
  geom_boxplot()
model <- aov(Value ~ Group, data = data_long)
hist(resid(model), main = "residuals") 
shapiro.test(resid(model))
plot(model, 2)

plot(model, 1)

summary(model)
