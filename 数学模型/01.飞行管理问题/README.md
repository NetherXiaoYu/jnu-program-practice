# 飞行管理问题 - 数学模型第一次作业

## 文件结构

```
|- SimpleQueue.m                自定义简单队列（因为 Matlab 自带的队列不想搞）
|- calcMaxAndReturnParams.m     对于问题 (a) 的其中一个代码，找到最大值并且返回参数以及结果
|- calcMinAndReturnParams.m     对于问题 (a) 的其中一个代码，找到最小值并且返回参数以及结果
|- distance.m                   数据可视化文件，将修改角度前后的每辆飞机之间的距离进行绘制
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

显然 $\sigma_1$ 与 $\sigma_2$ 不能同时为 0，这个稍后会再进行讨论，现在我们令 $r = 0$ 从而得出两架飞机距离最近的时刻 $t$：

$$
\begin{equation}
t = -\frac{{\left(x_1-x_2 \right)} \left(4 \cos \left(\theta_1 \right)-4 \cos \left(\theta_2 \right)\right) +{\left(y_1-y_2 \right)} (4 \sin \left(\theta_1 \right)-4 \sin \left(\theta_2 \right)) }{{\left(2 \sin \left(\theta_1 \right)-2 \sin \left(\theta_2 \right)\right)} \left(4 \sin \left(\theta_1 \right)-4 \sin \left(\theta_2 \right)\right) +{\left(2 \cos \left(\theta_1 \right)-2 \cos \left(\theta_2 \right)\right)} \left(4 \cos \left(\theta_1 \right)-4 \cos \left(\theta_2 \right)\right) } 
\end{equation}
$$

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

我们设横纵坐标为初始坐标（即成为常数）并用题目 (a) 中的程序求出其两架飞机最大时候的距离及其角度 $\theta'_1$ 和 $\theta'_2$，其中 $\theta'_1 \in \left[\theta_1 - \frac{\pi}{6},  \theta_1 -\frac{\pi}{6}\right]$ 以及 $\theta'_2 \in \left[\theta_2 - \frac{\pi}{6},  \theta_2 -\frac{\pi}{6}\right]$，求出之后我们对角度修改为新的角度 $\theta'_1$ 和 $\theta'_2$ 并且分别重新计算飞机 1 和飞机 2 与其他飞机的相撞情况。

### 代码实现

详见 [main.m](./main.m)

## ToDo

- [ ] 伪代码及代码分析
- [ ] 性能测试及分析
- [ ] 图表
- [ ] 在距离函数 $f$ 中的 $\sigma_1 \ne 0$ 和 $\sigma_2 \ne 0$ 的证明
