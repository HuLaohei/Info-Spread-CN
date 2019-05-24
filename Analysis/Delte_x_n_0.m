function [T,L,L_T] = Delte_x_n_0(x_n,vertices,T,L,L_T,epsilon)
%消除x_n中值过小对于整体的影响

%参数解释：
%1.x_n：稳定状态
%2.vertices：节点集合
%3.T，L，T_L：需要被处理矩阵
%4.epsilon：判断x_n是否为0的标准

    flag=(x_n(vertices)<epsilon);
    if(sum(flag)~=0)
        T(x_n(vertices)<epsilon,:)=[];
        L(x_n(vertices)<epsilon,:)=[];
        L_T(x_n(vertices)<epsilon,:)=[];
    end
end

