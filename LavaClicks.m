
%calculate for pool size n
for n = 1:1000
    
    disp(n);
    %init size of matrix
    p = zeros((n+1)*2);
    j=n;

    %{
    Creating an adjacency matrix (aka the prob of going from one state to another (aka a Markov chain))
    
    the states for a pool with sources are 2e, 2f, 1e, 1f, 0e, 0f
    2e denotes 2 sources remaining and holding an empty bucket
    1f denotes 1 source remaining and holding a filled bucket
    
    our goal is to reach 0 sources.
    
    note: some states such as 2f and 0e are impossible. This is intentional
    to make my life easier.
    
    
    
    %}
    
    
    %creating an adjacency matrix
    for i = 1:2:2*n+2

        %disp(i);

        p(i,i) = (n-j)/n;
        p(i+1,i) = j/n;

        if j < n
            p(i+1,i-2) = (n-j)/n;
        end

        if j > 0
            p(i,i+3) = j/n;
        end

        j = j-1;
    end    
    
    %dealing with impossible cases
    p(2,1) = 0;
    p(2*n+1,2*n+1) = 0;

    %{
    to find the avg clicks, we are looking for the average no. of clicks
    to get from ne (n being the initial no. of sources) to 0f.
    
    method used can be found here
    https://www.dartmouth.edu/~chance/teaching_aids/books_articles/probability_book/Chapter11.pdf
    %}
    
    %finding the avg clicks

    q = p(1:2*n+1,1:2*n+1);

    idM = eye(2*n+1);

    M = inv(idM - q);

    rowSum = sum(M,2);

    avgClicks = rowSum(1);
    allAvgClicks(n) = avgClicks;
    
end

xAxis = 1:1:1000;
%plotting the graph cuz everyone loves graphs
plot(xAxis,allAvgClicks);


