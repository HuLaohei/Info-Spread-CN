function [vertices,edges] = Create_ER_NetWork(N,S,p)
%�˺������ڴ���Erdos-Renyi���磬���Ǽ����ʼʱֻ�������ھӽڵ㣬��p�ĸ������ӷ��ھӽڵ�

%�������ͣ�
%1.N:���������������
%2.S:ƽ��ÿ���ڵ�Ķ�.
%3.p:���ӷ��ھӽڵ�ĸ���.

    bar=waitbar(0,'1','name','������������');
    string=sprintf('�������翪ʼ�����ԽǾ���');
    waitbar(0,bar,string);
    vertices=1:N;
    edges=sparse(N,N);

    %�����ڿ�ʼ����ʱ�㽫����Ϊ�����Ǵ���
    S=abs(S)/2;decimal_S=S-fix(S);
    S=fix(S);S=(S<1)+S;

    %'decimal_vector' ��Ϊ�˱�֤���õ�S�����ı�
    decimal_vector=(rand(1,length(diag(edges,1)))<decimal_S);
    edges=sparse(edges+diag(decimal_vector,1));

    %������Ϊ1��N��һ��ѭ��,����N+1��2N��1��N�ȼ�.
    for i=2:S+1
        within_section=diag(ones(1,length(diag(edges,i))),i);
        crossing_section=diag(ones(1,length(diag(edges,N-i))),N-i);
        edges=sparse(edges+within_section+crossing_section);
    end

    %���������ⲿ�Ľڵ�
    [vertice1,vertice2]=find(edges);
    out=(rand(1,length(vertice1))<p);
    edges(vertice1(out),vertice2(out))=0;
    num_out=sum(out);
    out_pairs=[vertice1(out),vertice2(out)];


    for i =1:num_out
        bili=i/num_out;
        string=sprintf('���������Ѵ���%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        %������������յ��һ����Ϊ�±ߵĶ˵�
        index=(rand>0.5)+1;
        out_edge_from=out_pairs(i,index);

        %�������ӱ��Ͽ��ı�
        adj=[out_edge_from;find(edges(:,out_edge_from));...
            find(edges(out_edge_from,:))'];
        non_adj=setdiff(vertices,adj);
        out_edge_to=non_adj(ceil(rand*length(non_adj)));

        %ȷ��Ϊ�����Ǿ���
        out_edge=sort([out_edge_from,out_edge_to]);
        edges(out_edge(1),out_edge(2))=1;
    end
    close(bar);
end
