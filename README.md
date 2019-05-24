论文原文见https://www.nature.com/articles/s41567-018-0409-0  
寻找不同拓扑方式以及传播方式的共同点  
主要实现了论文中提到的以下方面：  
<h1>一.数据建立方面</h1>  
<h2>  1.构建传播方程</h2>  
<p>  共有六种类型，分别为R1,N,R2,P,M,E</p>  
<h2>  2.构建复杂网络</h2>  
<p>  共有四种类型，分别为ER和SF以及其变形SF1和SF2</p>
<p>    1.ER:Erdos-Renyi复杂网络</p>  
<p>    2.SF:Scale-free复杂网络，利用BA算法实现</p>  
<p>    3.SF1:SF的变形，将其权重设为随机值</p>  
<p>    4.SF2:SF的变形，利用BBV算法实现</p>  
<p>  还实现了聚类程度C，度相关性Q以及度S的计算</p>  
<h1>二.参数计算方面</h2>  
<p>  1.稳定状态计算:Calculate_x</p>  
<p>  2.j点至i点的激活时间:Calculate_T_ji</p>  
<p>  3.平均激活时间:Calculate_T</p>  
<p>  4.局部激活时间:Calculate_tao_i</p>  
<p>  5.最短路径的计算:Calculate_L</p>  
<p>  6.最短理论激活时间计算:Calculate_L_T</p>  
<p>  7.拟合方程系数的计算:Calculate_theta</p>  
<h1>三.制图部分</h1>  
<p>  1.度与局部激活时间关系:Figure_S_tao_i</p>  
<p>  2.最短路径与激活时间的关系:Figure_L_T</p>  
<p>  3.最短理论激活时间与激活时间关系Figure_L_T_T</p>
