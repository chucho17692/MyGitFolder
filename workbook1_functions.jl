function mergesort(A::Array{Int64,1})
    n = length(A)
    if n == 1
        return A
    else
        m = Int(ceil(n/2))
    return mergepresorted(mergesort(A[1:m]),mergesort(A[m+1:n]))
    end
end

function mergepresorted(A::Array{Int64,1}, B::Array{Int64,1})
    if length(A) == 0
        return B
    elseif length(B) == 0
        return A
    elseif A[1] < B[1]
        return vcat([A[1]], mergepresorted(A[2:end], B))
    else
        return vcat([B[1]], mergepresorted(A, B[2:end]))
    end    
end
