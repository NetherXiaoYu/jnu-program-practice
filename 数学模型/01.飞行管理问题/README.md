# 飞行管理问题 - 数学模型第一次作业

## 文件结构

```
|- imgs/                        所用到的所有图片
|- SimpleQueue.m                自定义简单队列（因为 Matlab 自带的队列不想搞）
|- calcMaxAndReturnParams.m     对于问题 (a) 的其中一个代码，找到最大值并且返回参数以及结果
|- calcMinAndReturnParams.m     对于问题 (a) 的其中一个代码，找到最小值并且返回参数以及结果
|- newCalcMaxAndReturnParams.m  使用值域分割方法进行 calcMaxAndReturnParams.m 的内容，可大幅缩减运算时间
|- distance.m                   数据可视化文件，将修改角度后的每辆飞机之间的距离进行绘制
|- originaldistance.m           数据可视化文件，将修改角度前的每辆飞机之间的距离进行绘制
|- routegraph.m                 数据可视化文件，将飞机的坐标与时刻关系进行三维图绘制
|- main.m                       主程序，用来计算需要修改的飞机及其角度的
```

## 具体理论

### 计算两架飞机距离最短的时刻

首先我们对每架飞机的横方向和纵方向进行拆分，我们可以获得其关于时刻 $t$ 的横坐标和纵坐标式子如下：

$$
\begin{flalign}
x_{t+1} &= x_0 + t k \cos(\theta) \\
y_{t+1} &= y_0 + t k \sin(\theta)
\end{flalign}
$$

其中 $\theta$ 是飞机的在平面上的飞行角度， $k$ 为每个时刻飞机移动的距离， $x_0$ 和 $y_0$ 为飞机初始的横纵坐标。我们已知飞机航速为 800km/h，我们不妨设每个时刻 $t$ 为 9 秒使得：

$$
\begin{equation}
k := \frac{800}{3600}\times9 = 2
\end{equation}
$$

由题目我们可知每架飞机的航速一样，故我们有两架飞机（飞机1和飞机2，使用下标区分）在时刻 $t$ 的距离如下：

$$
\begin{equation}
f(t, x_1, x_2, y_1, y_2, \theta_1, \theta_2) := \sqrt{((x_1 + 2 t \cos(\theta_1) - (x_2 + 2 t  \cos(\theta_2))^2 + ((y_1 + 2 t  \sin(\theta_1) - (y_2 + 2 t \sin(\theta_2))^2}
\end{equation}
$$

显然 $f(t)$ 对 $t$ 可导，故我们有两架飞机对每时刻 $t$ 变化率为：

$$
\begin{equation}
\frac{\partial f}{\partial t}(t, x_1, x_2, y_1, y_2, \theta_1, \theta_2) = \frac{2 {\left(2 \cos \left(\theta_1 \right)-2 \cos \left(\theta_2 \right)+1\right)} \sigma_2 +2 {\left(2 \sin \left(\theta_1 \right)-2 \sin \left(\theta_2 \right)\right)} \sigma_1 }{2 \sqrt{{\sigma_2 }^2 +{\sigma_1 }^2 }} =: r
\end{equation}
$$

其中

$$
\begin{flalign}
\sigma_1 &= y_1-y_2 +2 t \sin \left(\theta_1 \right)-2 t \sin \left(\theta_2 \right) \\
\sigma_2 &= x_1-x_2 +2 t \cos \left(\theta_1 \right)-2 t \cos \left(\theta_2 \right)
\end{flalign}
$$

显然 $\sigma_1$ 与 $\sigma_2$ 不能同时为 0，这个我们建立 **特例1** 专门讨论 $\sigma_1$ 与 $\sigma_2$ 同时为 0 的情况，现在我们令 $r = 0$ 从而得出两架飞机距离最近的时刻 $t$：

$$
\begin{equation}
t = -\frac{{\left(x_1-x_2 \right)} \left(4 \cos \left(\theta_1 \right)-4 \cos \left(\theta_2 \right)\right) +{\left(y_1-y_2 \right)} (4 \sin \left(\theta_1 \right)-4 \sin \left(\theta_2 \right)) }{{\left(2 \sin \left(\theta_1 \right)-2 \sin \left(\theta_2 \right)\right)} \left(4 \sin \left(\theta_1 \right)-4 \sin \left(\theta_2 \right)\right) +{\left(2 \cos \left(\theta_1 \right)-2 \cos \left(\theta_2 \right)\right)} \left(4 \cos \left(\theta_1 \right)-4 \cos \left(\theta_2 \right)\right) } 
\end{equation}
$$

这里显然的分母不能为 0 ，故我们同样建立 **特例2**，即分母为 0 的情况。

### 飞机相撞的处理

显然的，只需要将上一部分所计算的 $t$ 代入到距离函数 $f$ 中即可得到两架飞机（飞机 $i$ 和 飞机 $j$）预计最贴近的距离 $d_{i, j}$，根据题目我们可以定义 $d_{i, j} > 8$ 的时候表明飞机不会相撞，可以进行与其他飞机的比较计算，反之则计算所需调整角度并且重新检测。我们可以将 $t$ 的原式子代入到 $f(t)$ 的原式子有：

$$
\begin{equation}
F\left(x_1, x_2, y_1, y_2, \theta_1, \theta_2\right) = \sqrt{{{\left(x_1-x_2 -\frac{2 \cos \left(\theta_1 \right) \sigma_2 }{\sigma_1 }+\frac{2 \cos \left(\theta_2 \right) \sigma_2 }{\sigma_1 }\right)}}^2 +{{\left(y_1-y_2 -\frac{2 \sin \left(\theta_1 \right) \sigma_2 }{\sigma_1 }+\frac{2 \sin \left(\theta_2 \right) \sigma_2 }{\sigma_1 }\right)}}^2}
\end{equation}
$$

其中

$$
\begin{flalign}
\sigma_1 & ={\left(2 \sin \left(\theta_1 \right)-2 \sin \left(\theta_2 \right)\right)} {\left(4 \sin \left(\theta_1 \right)-4 \sin \left(\theta_2 \right)\right)}+{\left(2 \cos \left(\theta_1 \right)-2 \cos \left(\theta_2 \right)\right)} {\left(4 \cos \left(\theta_1 \right)-4 \cos \left(\theta_2 \right)\right)} \\ 
\sigma_2 &={\left(x_1-x_2 \right)} {\left(4 \cos \left(\theta_1 \right)-4 \cos \left(\theta_2 \right)\right)}+{\left(y_1-y_2 \right)} {\left(4 \sin \left(\theta_1 \right)-4 \sin \left(\theta_2 \right)\right)}
\end{flalign}
$$

因为上一部分我们设定了特例，故这里的 $\sigma_1$ 与 $\sigma_2$ 均不为 0 。我们设横纵坐标为初始坐标（即成为常数）并用题目 (a) 中的程序求出其两架飞机最大时候的距离及其角度 $\theta'_1$ 和 $\theta'_2$，其中 $\theta'_1 \in \left[\theta_1 - \frac{\pi}{6},  \theta_1 -\frac{\pi}{6}\right]$ 以及 $\theta'_2 \in \left[\theta_2 - \frac{\pi}{6},  \theta_2 -\frac{\pi}{6}\right]$，求出之后我们对角度修改为新的角度 $\theta'_1$ 和 $\theta'_2$ 并且分别重新计算飞机 1 和飞机 2 与其他飞机的相撞情况。

### 针对特例 1 和 2 的讨论

我们先来讨论**特例 2**，特例 2 有：

$$
{{\left(2 \sin \left(\theta_1 \right)-2 \sin \left(\theta_2 \right)\right)} \left(4 \sin \left(\theta_1 \right)-4 \sin \left(\theta_2 \right)\right) +{\left(2 \cos \left(\theta_1 \right)-2 \cos \left(\theta_2 \right)\right)} \left(4 \cos \left(\theta_1 \right)-4 \cos \left(\theta_2 \right)\right) } = 0
$$

通过运算可知唯有当 $\theta_1 = \theta_2$ 的时候才存在特例 2 的情况，由题目保障飞机刚进入区域边缘时必定与其他飞机保持 60km 的距离并且保证每架飞机航速一样，若飞行角度一样，则必不可能发生相撞，故可将该飞机排除出检测范围。

接下来讨论**特例 1**，要存在特例 1，则两架飞机必定在某时刻 $t$ 存在完全的横纵坐标相撞的情况，即：

$$
\sqrt{(y_1-y_2 +2 t \sin \left(\theta_1 \right)-2 t \sin \left(\theta_2 \right))^2 + (x_1-x_2 +2 t \cos \left(\theta_1 \right)-2 t \cos \left(\theta_2 \right))^2} = 0
$$

且由于我们通过横纵分拆后的方程可计算每架飞机在每个时刻 $t$ 的横纵坐标，故我们可以在运行前先进性运算检测是否会发生完全相撞的情况，从而避免特例 1 的情况发生。

## 具体分析

### 针对数据的预先分析

我们根据题目所给的数据，使用 [Matlab 程序](./routegraph.m)进行三维绘图展示出了每家飞机根据时刻 $t$ 变化的不同的位置如下图（详细图可见 [Matlab 图表](./imgs/routegraph.fig) ）

![https://raw.githubusercontent.com/NetherXiaoYu/jnu-program-practice/master/%E6%95%B0%E5%AD%A6%E6%A8%A1%E5%9E%8B/01.%E9%A3%9E%E8%A1%8C%E7%AE%A1%E7%90%86%E9%97%AE%E9%A2%98/imgs/routegraph.jpg](https://raw.githubusercontent.com/NetherXiaoYu/jnu-program-practice/master/%E6%95%B0%E5%AD%A6%E6%A8%A1%E5%9E%8B/01.%E9%A3%9E%E8%A1%8C%E7%AE%A1%E7%90%86%E9%97%AE%E9%A2%98/imgs/routegraph.jpg)

为了更好的展示，我们根据距离公式使用 [Matlab 程序](./originaldistance.m)画出检测飞机与其他飞机根据时刻 $t$ 变化的距离如下图：

![https://raw.githubusercontent.com/NetherXiaoYu/jnu-program-practice/master/%E6%95%B0%E5%AD%A6%E6%A8%A1%E5%9E%8B/01.%E9%A3%9E%E8%A1%8C%E7%AE%A1%E7%90%86%E9%97%AE%E9%A2%98/imgs/originaldistance.jpg](https://raw.githubusercontent.com/NetherXiaoYu/jnu-program-practice/master/%E6%95%B0%E5%AD%A6%E6%A8%A1%E5%9E%8B/01.%E9%A3%9E%E8%A1%8C%E7%AE%A1%E7%90%86%E9%97%AE%E9%A2%98/imgs/originaldistance.jpg)

可以看到的是，目标飞机将会于区域内的**飞机 3** 和**飞机 5** 发生碰撞，但两架飞机均**不会发生完全相撞，即特例 1 的情况**（与飞机三最短距离仍有约 1km），所以我们代码暂不用实现针对特例 1 的情况，同时通过观察数据我们发生也**不存在特例 2 的情况**，所以代码不用针对上述特例进行处理。

### 调整结果

我们通过运行代码，发现**只需要调整飞机 3 与飞机 6 的飞行角度**，即可完美避开所有飞机，我们将**飞机 3 的飞行角度调整为 232.5321 度**，同时将 **飞机 6 即检测飞机的飞行角度调整为 69.9679 度**，即可避免所有碰撞。通过调整角度后我们重新编写 [Matlab 程序](./distance.m)进行距离画图有如下：

![https://raw.githubusercontent.com/NetherXiaoYu/jnu-program-practice/master/%E6%95%B0%E5%AD%A6%E6%A8%A1%E5%9E%8B/01.%E9%A3%9E%E8%A1%8C%E7%AE%A1%E7%90%86%E9%97%AE%E9%A2%98/imgs/adjusteddistance.jpg](https://raw.githubusercontent.com/NetherXiaoYu/jnu-program-practice/master/%E6%95%B0%E5%AD%A6%E6%A8%A1%E5%9E%8B/01.%E9%A3%9E%E8%A1%8C%E7%AE%A1%E7%90%86%E9%97%AE%E9%A2%98/imgs/adjusteddistance.jpg)

可以发现已经完全达到所设定的目的。

### 代码实现

详见 [main.m](./main.m)

## ToDo

- [ ] 伪代码及代码分析
- [ ] 性能测试及分析
- [x] ~~图表~~
- [x] ~~在距离函数 $f$ 中的 $\sigma_1 \ne 0$ 和 $\sigma_2 \ne 0$ 的证明~~
