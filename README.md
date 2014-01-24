Computing for Data Analysis Assignments
=

Jan 6th to Feb 3rd

---

## Week II

## Week III

### Part II

![Plot II](https://github.com/kelvinleung/DA-Assignments/blob/master/Week_III/Plots/plotting_part_2.png?raw=true)

### Part III

![Plot III](https://github.com/kelvinleung/DA-Assignments/blob/master/Week_III/Plots/plotting_part_3.png?raw=true)

### Part IV

![Plot IV](https://github.com/kelvinleung/DA-Assignments/blob/master/Week_III/Plots/plotting_part_4.png?raw=true)

### Part V

解题思路：

1. 读数据，根据 state 取子集
2. 判断 state 和 outcome，输出错误代码
3. 根据 outcome 取对应的 rate
4. 对数据排序，去除 NA
5. 返回结果

几个用到的 function：

输出错误代码

```
stop("error code")
```

排序

```
order(condition.a, condition.b, ...)
```

去除错误

```
suppressWarnings(expressions)
```

### Part VI

解题思路：

与 Part V 思路一致，**返回结果时增加判断**

1. 读数据，根据 state 取子集
2. 判断 state 和 outcome，输出错误代码
3. 根据 outcome 取对应的 rate
4. 对数据排序，去除 NA
5. **根据 num 返回对应结果**

### Part VII

解题思路：

1. 读数据
2. 判断 outcome，输出错误代码
3. 根据 outcome 取对应的 rate
4. 对数据排序，去除 NA
5. **创建 function 对不同 state 进行选择输出**
6. **利用 ```aggregate()``` 对数据进行分组处理**
7. 返回结果

用到的 function：

```
aggregate(x ~ y, data, FUN)
```

按 y 的分组对 x 进行 FUN 的处理，返回一个含 y 和处理后的 x 的 data frame